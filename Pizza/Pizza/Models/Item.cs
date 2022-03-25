using System;
using System.Collections.Generic;

namespace Pizza.Models
{
    public partial class Item
    {
        public Item()
        {
            OrderItem = new HashSet<OrderItem>();
        }

        public int ItemId { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public double BaseCost { get; set; }
        public double CostFactorForToppings { get; set; }
        public bool IsPizzaTopping { get; set; }

        public virtual ICollection<OrderItem> OrderItem { get; set; }
    }
}
