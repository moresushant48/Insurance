﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace InsuranceManagement.admin
{
    public partial class ViewPolicyExtra : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["loggedIn"] == null || Session["userId"].ToString() != 1.ToString())
            {
                Response.Redirect("/");
            }
        }
    }
}