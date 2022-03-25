using System;
using System.Collections.Generic;

namespace Pizza.Models
{
    public partial class Customer
    {
        public Customer()
        {
            Order = new HashSet<Order>();
        }

        public int CustomerId { get; set; }
        public string Name { get; set; }
        public string Phone { get; set; }
        public string StreetAddress { get; set; }
        public string Apartment { get; set; }
        public string City { get; set; }
        public string Comments { get; set; }

        public virtual ICollection<Order> Order { get; set; }
    }
}
