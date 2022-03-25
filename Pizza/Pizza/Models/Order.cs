using System;
using System.Collections.Generic;

namespace Pizza.Models
{
    public partial class Order
    {
        public Order()
        {
            OrderItem = new HashSet<OrderItem>();
        }

        public int OrderId { get; set; }
        public int CustomerId { get; set; }
        public DateTime DateTimeOrdered { get; set; }
        public bool Pickup { get; set; }
        public string DriverCode { get; set; }
        public string Comments { get; set; }
        public bool OrderComplete { get; set; }

        public virtual Customer Customer { get; set; }
        public virtual Driver DriverCodeNavigation { get; set; }
        public virtual ICollection<OrderItem> OrderItem { get; set; }
    }
}
