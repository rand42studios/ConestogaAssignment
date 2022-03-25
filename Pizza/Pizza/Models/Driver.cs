using System;
using System.Collections.Generic;

namespace Pizza.Models
{
    public partial class Driver
    {
        public Driver()
        {
            Order = new HashSet<Order>();
        }

        public string DriverCode { get; set; }
        public string FullName { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }

        public virtual ICollection<Order> Order { get; set; }
    }
}
