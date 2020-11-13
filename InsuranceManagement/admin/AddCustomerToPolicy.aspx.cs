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
    public partial class AddCustomerToPolicy : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["loggedIn"] == null || Session["userId"].ToString() != 1.ToString())
            {
                Response.Redirect("/");
            }
        }

        protected void btnAddCustomerToPolicy_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(_Default.conString))
            {
                con.Open();
                String query = "INSERT INTO custpolicy VALUES (" +
                    ddlPolicyID.SelectedValue + "," +
                    ddlCustomerId.SelectedValue + "," +
                    Session["userId"] + "," +
                    txtSumAssured.Text.Trim() + "," +
                    txtPaymentPeriod.Text.Trim() + "," +
                    txtInsurancePeriod.Text.Trim() + "," +
                    "'" + ddlPremiumMode.SelectedValue + "')";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    if (cmd.ExecuteNonQuery() > 0)
                    {
                        ListView1.DataBind();
                        Response.Write("<script>alert('Customer Added To Policy.');</script>");
                    }
                    else
                    {
                        Response.Write("<script>alert('Couldn't add Customer To Policy, please try again.');</script>");
                    }
                }
            }
        }

        protected void DeleteCustomer_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            if (btn.CommandName == "deleteCustomer")
            {
                using (SqlConnection con = new SqlConnection(_Default.conString))
                {
                    con.Open();

                    String query = "DELETE FROM custpolicy WHERE id = '" + btn.CommandArgument.Trim().ToString() + "'";

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
    }
}