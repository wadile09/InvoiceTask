using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using Newtonsoft.Json;

namespace InvoiceTask.Models
{
    public class InvoiceViewModel
    {
        public string InvoiceNo { get; set; }
        public DateTime InvoiceDate { get; set; }

        [Required(ErrorMessage = "Customer is required.")]
        public int CustomerId { get; set; }
        //public int CustomerId { get; set; }
        public int Mobile { get; set; }

        public IEnumerable<SelectListItem>? Customers { get; set; }
        public IEnumerable<SelectListItem>? AvailableItems { get; set; }
        public List<InvoiceItemViewModel>? Items { get; set; }
        public List<InvoiceDetailDto>? InvoiceDetails { get; set; }
        

        public decimal Subtotal { get; set; }
        public decimal TotalDiscount { get; set; }
        public decimal Total { get; set; }
    }
    public class InvoiceItemViewModel
    {
        public int ItemId { get; set; }
        public decimal Rate { get; set; }
        [Required(ErrorMessage = "Quantity is required.")]
        [Range(1, int.MaxValue, ErrorMessage = "Quantity must be greater than 0.")]
        public int Quantity { get; set; }

        public decimal Discount { get; set; }
        public decimal Total { get; set; }
    }

}
