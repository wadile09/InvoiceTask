namespace InvoiceTask.Models
{
    public class Item
    {
        public int ItemId { get; set; }
        public string ItemName { get; set; }
        public decimal Rate { get; set; }
        public ICollection<InvoiceItem> InvoiceItems { get; set; }
    }
}
