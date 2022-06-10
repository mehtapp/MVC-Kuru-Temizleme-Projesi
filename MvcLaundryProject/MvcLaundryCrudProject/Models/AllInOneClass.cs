using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;


namespace MvcLaundryCrudProject.Models
{
    public class AllInOneClass
    {
        
        //public IEnumerable<Services> AllServices { get; set; }
        //public IEnumerable<Categories> AllCategories { get; set; }
        //public IEnumerable<Customers> AllCustomers { get; set; }
        
        public int ServicesCount { get; set; }
        public int CategoriesCount { get; set; }
        public int CustomerCount { get; set; }
        public int MoneyCount { get; set; }
    }
}