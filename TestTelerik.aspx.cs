﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace library_management_system_client
{
    public partial class TestTelerik : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void RadGrid1_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
        {
            (sender as RadGrid).DataSource = MyData;
        }

        public IEnumerable<SampleData> MyData = Enumerable.Range(1, 30).Select(x => new SampleData
        {
            Id = x,
            Name = "Name " + x,
            Team = "Team " + x % 5,
            HireDate = DateTime.Now.AddDays(-x * 3).Date
        });

        public class SampleData
        {
            public int Id { get; set; }
            public string Name { get; set; }
            public string Team { get; set; }
            public DateTime HireDate { get; set; }
        }
    }
}