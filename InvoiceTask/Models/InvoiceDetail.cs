namespace InvoiceTask.Models
{
    public class InvoiceDetailDto
    {
        public int InvoiceId { get; set; }
        public string InvoiceNo { get; set; }
        public DateTime InvoiceDate { get; set; }
        public string CustomerName { get; set; }
        public string Mobile { get; set; }
        public decimal Total { get; set; }
    }
}
