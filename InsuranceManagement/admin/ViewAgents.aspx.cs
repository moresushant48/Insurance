using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using InsuranceManagement.views;

namespace InsuranceManagement.admin
{
    public partial class ViewAgents : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            /*if (Session["loggedIn"] == null || Session["roleId"].ToString() != Roles.ADMIN)
            {
                Response.Redirect("/");
            }*/
        }

        protected void DeleteUser_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            if (btn.CommandName == "deleteUser")
            {
                using (SqlConnection con = new SqlConnection(_Default.conString))
                {
                    con.Open();

                    String query = "DELETE FROM agents WHERE id = '" + btn.CommandArgument.Trim().ToString() + "'";

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

        protected void btnAddAgent_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(_Default.conString))
            {
                con.Open();
                String query = "INSERT INTO agents VALUES (" +
                    "'" + txtFirstName.Text.Trim() + "'," +
                    "'" + txtMiddleName.Text.Trim() + "'," +
                    "'" + txtLastName.Text.Trim() + "'," +
                    "'" + txtEmail.Text.Trim() + "'," +
                    "'" + txtMobNo.Text.Trim() + "'," +
                    "'" + txtGender.SelectedValue.Trim().ToString() + "'," +
                    "'" + txtAddress.Text.Trim() + "'," +
                    "'" + txtPincode.Text.Trim() + "')";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    if (cmd.ExecuteNonQuery() > 0)
                    {
                        ListView1.DataBind();
                        Response.Write("<script>alert('Agent Added.');</script>");
                    }
                    else
                    {
                        Response.Write("<script>alert('Couldn't add agent, please try again.');</script>");
                    }
                }
            }
        }
    }
}