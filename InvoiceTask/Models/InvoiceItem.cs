namespace InvoiceTask.Models
{
    public class InvoiceItem
    {
        public int InvoiceItemId { get; set; }
        public int InvoiceId { get; set; }
        public int ItemId { get; set; }
        public int Quantity { get; set; }
        public decimal Discount { get; set; }
        public decimal Total { get; set; }

    }
}
