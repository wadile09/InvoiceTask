using InvoiceTask.DBContext;
using InvoiceTask.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using System.Data;

namespace InvoiceTask.Controllers
{
    public class InvoiceController : Controller
    {
        private readonly AppDbContext _context;

        public InvoiceController(AppDbContext context)
        {
            _context = context;
        }
        public async Task<IActionResult> Index()
        {
            var latestInvoice = _context.Invoices.OrderByDescending(i => i.InvoiceId).FirstOrDefault();
            var newInvoiceNo = GenerateInvoiceNumber(latestInvoice?.InvoiceNo);
            var invoicedetails = await GetInvoiceDetailsAsync();
            var customers = _context.Customers
                .Select(c => new SelectListItem
                {
                    Value = c.CustomerId.ToString(),
                    Text = c.CustomerName,
                }).ToList();

            var items = _context.Items
                .Select(i => new SelectListItem
                {
                    Value = i.ItemId.ToString(),
                    Text = i.ItemName,
                }).ToList();

            var model = new InvoiceViewModel
            {
                InvoiceNo = newInvoiceNo,
                InvoiceDate = DateTime.Now,
                Customers = customers,
                AvailableItems = items,
                InvoiceDetails = invoicedetails,
                Items = new List<InvoiceItemViewModel> { new InvoiceItemViewModel() }
            };
            return View(model);
        }
        public async Task<List<InvoiceDetailDto>> GetInvoiceDetailsAsync()
        {
            var resultList = new List<InvoiceDetailDto>();

            using (var command = _context.Database.GetDbConnection().CreateCommand())
            {
                command.CommandText = "InvoiceDetials";  
                command.CommandType = CommandType.StoredProcedure;
                await _context.Database.OpenConnectionAsync();

                using (var reader = await command.ExecuteReaderAsync())
                {
                    while (await reader.ReadAsync())
                    {
                        var invoiceDetail = new InvoiceDetailDto
                        {
                            InvoiceNo = reader["InvoiceNo"].ToString(),
                            InvoiceDate = reader["InvoiceDate"] != DBNull.Value
                                ? (DateTime)reader["InvoiceDate"]  
                                : DateTime.MinValue, 
                            CustomerName = reader["CustomerName"].ToString(),  
                            Mobile = reader["Mobile"].ToString(), 
                            Total = reader["TotalAmount"] != DBNull.Value
                                ? Convert.ToDecimal(reader["TotalAmount"]) 
                                : 0m 
                        };

                        resultList.Add(invoiceDetail); 
                    }
                }
            }
            return resultList;  
        }


        private string GenerateInvoiceNumber(string latestInvoiceNo)
        {
            if (string.IsNullOrEmpty(latestInvoiceNo))
                return "INV001";
            var numericPart = int.Parse(latestInvoiceNo.Substring(3));

            return $"INV{(numericPart + 1).ToString("D3")}";
        }
        [HttpGet]
        public IActionResult GetCustomerMobileNumber(int customerId)
        {
            var customer = _context.Customers.FirstOrDefault(c => c.CustomerId == customerId);
            if (customer == null)
                return Json(new { success = false, message = "Customer not found" });

            return Json(new
            {
                success = true,
                data = new
                {
                    customer.Mobile
                }
            });
        }

        [HttpGet]
        public IActionResult GetItemRate(int itemId)
        {
            // Find the item by its ID
            var item = _context.Items.FirstOrDefault(i => i.ItemId == itemId);

            if (item == null)
            {
                return Json(new { success = false, message = "Item not found" });
            }

            // Return the rate as a JSON response
            return Json(new { success = true, rate = item.Rate });
        }

        [HttpPost]
        public IActionResult Create(InvoiceViewModel model)
        {
            try
            {
                var invoice = new Invoice
                {
                    //InvoiceId = newInvoiceId,
                    InvoiceNo = model.InvoiceNo,
                    InvoiceDate = model.InvoiceDate,
                    CustomerId = model.CustomerId,
                    InvoiceItems = new List<InvoiceItem>()
                };
                if (model.Items != null && model.Items.Any())
                {

                    foreach (var item in model.Items)
                    {

                        var invoiceItem = new InvoiceItem
                        {

                            ItemId = item.ItemId,
                            Quantity = item.Quantity,
                            Discount = item.Discount,
                            Total = item.Total
                        };
                        invoice.InvoiceItems.Add(invoiceItem);
                    }
                    _context.SaveChanges();
                }
                _context.Invoices.Add(invoice);
                _context.SaveChanges();

                TempData["SuccessMessage"] = "Invoice has been saved successfully";
                return RedirectToAction("Index");
            }
            catch (Exception ex)
            {
                TempData["ErrorMessage"] = "An error occurred while saving the invoice.";
                throw ex;
            }

            return RedirectToAction("Index", model);
        }
    }
}
