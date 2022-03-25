using System;
using System.Collections.Generic;

namespace Pizza.Models
{
    public partial class OrderItem
    {
        public int OrderItemId { get; set; }
        public int OrderId { get; set; }
        public int ItemId { get; set; }
        public double Quantity { get; set; }
        public double Price { get; set; }
        public string Comment { get; set; }

        public virtual Item Item { get; set; }
        public virtual Order Order { get; set; }
    }
}
