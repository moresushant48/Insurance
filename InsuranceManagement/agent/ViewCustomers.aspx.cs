using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace InsuranceManagement.agent
{
    public partial class ViewCustomers : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAddCustomer_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(_Default.conString))
            {
                con.Open();
                String query = "INSERT INTO customers VALUES (" +
                    "'" + txtFirstName.Text.Trim() + "'," +
                    "'" + txtMiddleName.Text.Trim() + "'," +
                    "'" + txtLastName.Text.Trim() + "'," +
                    "'" + txtGender.SelectedValue.Trim().ToString() + "'," +
                    "'" + txtDay.Text.Trim() + "/" + txtMonth.Text.Trim() + "/" + txtYear.Text.Trim() + "'," +
                    "'" + txtMobNo.Text.Trim() + "'," +
                    "'" + txtEmail.Text.Trim() + "'," +
                    "'" + txtAddress.Text.Trim() + "'," +
                    "'" + txtPincode.Text.Trim() + "'," +
                    "'" + txtMotherName.Text.Trim() + "'," +
                    "'" + txtMotherStatus.SelectedValue.Trim() + "'," +
                    "'" + txtFatherName.Text.Trim() + "'," +
                    "'" + txtFatherStatus.SelectedValue.Trim() + "'," +
                    "'" + txtMarried.SelectedValue.Trim() + "'," +
                    "'" + txtSpouseName.Text.Trim() + "')";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    if (cmd.ExecuteNonQuery() > 0)
                    {
                        ListView1.DataBind();
                        Response.Write("<script>alert('Customer Added.');</script>");
                    }
                    else
                    {
                        Response.Write("<script>alert('Couldn't add Customer, please try again.');</script>");
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

                    String query = "DELETE FROM customers WHERE id = '" + btn.CommandArgument.Trim().ToString() + "'";

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

        protected void btnViewUserInfo_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            Response.Write("<script>window.open('/agent/ViewCustomerExtra?custId=" + btn.CommandArgument + "','_blank');</script>");
        }
    }
}