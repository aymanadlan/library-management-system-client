using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace library_management_system_client.Models
{
    public class Book
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public decimal Price { get; set; }
    }
}