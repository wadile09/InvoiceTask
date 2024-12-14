namespace InvoiceTask.Models
{
    public class Customer
    {
        public int CustomerId { get; set; }
        public string CustomerName { get; set; }
        public string Mobile { get; set; }
        public ICollection<Invoice> Invoices { get; set; }
    }
}
