using Microsoft.EntityFrameworkCore;
using InvoiceTask.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
namespace InvoiceTask.DBContext
{
    public class AppDbContext : Microsoft.EntityFrameworkCore.DbContext

    {
        public AppDbContext(DbContextOptions<AppDbContext> options) : base(options)
        {

        }
        public DbSet<Customer> Customers { get; set; }
        public DbSet<Item> Items { get; set; }
        public DbSet<Invoice>? Invoices { get; set; }
        public DbSet<InvoiceItem>? InvoiceItems { get; set; }
        
       
    }

}
