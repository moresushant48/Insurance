using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace InsuranceManagement.admin
{
    public partial class ViewPolicies : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["loggedIn"] == null || Session["userId"].ToString() != 1.ToString())
            {
                Response.Redirect("/");
            }
        }

        protected void DeletePolicy_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            if (btn.CommandName == "deletePolicy")
            {
                using (SqlConnection con = new SqlConnection(_Default.conString))
                {
                    con.Open();

                    String query = "DELETE FROM policies WHERE id = '" + btn.CommandArgument.Trim().ToString() + "'";

                    SqlCommand cmd = new SqlCommand(query, con);

                    if (cmd.ExecuteNonQuery() > 0)
                    {
                        ListView1.DataBind();
                    }

                    cmd.Dispose();
                    con.Close();
                }
            }
        }

        protected void btnAddPolicy_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(_Default.conString))
            {
                con.Open();
                String query = "INSERT INTO policies VALUES (" +
                    "'" + txtPolicyName.Text.Trim() + "'," +
                    "'" + txtPolicyDesc.Text.Trim() + "')";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    if (cmd.ExecuteNonQuery() > 0)
                    {
                        ListView1.DataBind();
                        Response.Write("<script>alert('Policy Added.');</script>");
                    }
                    else
                    {
                        Response.Write("<script>alert('Couldn't add Policy, please try again.');</script>");
                    }
                }
            }
        }
    }
}