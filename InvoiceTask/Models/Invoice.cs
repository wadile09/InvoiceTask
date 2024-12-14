namespace InvoiceTask.Models
{
    public class Invoice
    {
        public int InvoiceId { get; set; }
        public string InvoiceNo { get; set; }
        public DateTime InvoiceDate { get; set; }
        public int CustomerId { get; set; }

        public Customer Customer { get; set; }
        public ICollection<InvoiceItem> ? InvoiceItems { get; set; }
    }
}
