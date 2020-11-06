using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace InsuranceManagement
{
    public partial class Account : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["loggedIn"] == null)
            {
                Response.Redirect("/");
            }

            if (!IsPostBack)
            {
                using (SqlConnection con = new SqlConnection(_Default.conString))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("SELECT * FROM agents WHERE id=" + Session["userId"].ToString(), con);

                    SqlDataReader reader = cmd.ExecuteReader();
                    if (reader.Read())
                    {
                        lblName.Text = reader.GetString(1);
                        txtFirstName.Text = reader.GetString(1);
                        txtMiddleName.Text = reader.GetString(2);
                        txtLastName.Text = reader.GetString(3);
                        txtEmail.Text = reader.GetString(4);
                        txtPhone.Text = reader.GetString(5);
                        txtBloodGroup.Text = reader.GetString(6);
                        txtAddress.Text = reader.GetString(7);
                    }
                    cmd.Dispose();
                    con.Close();
                }
            }

        }

        protected void txtPhone_TextChanged(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(_Default.conString))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("UPDATE agents SET phone = '" + txtPhone.Text.Trim() + "' WHERE id=" + Session["userId"].ToString(), con);
                cmd.ExecuteNonQuery();
                cmd.Dispose();
                con.Close();
            }
        }

        protected void txtEmail_TextChanged(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(_Default.conString))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("UPDATE agents SET email = '" + txtEmail.Text.Trim() + "' WHERE id=" + Session["userId"].ToString(), con);
                cmd.ExecuteNonQuery();
                cmd.Dispose();
                con.Close();
            }
        }

        protected void txtAddress_TextChanged(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(_Default.conString))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("UPDATE agents SET address = '" + txtAddress.Text.Trim() + "' WHERE id=" + Session["userId"].ToString(), con);
                cmd.ExecuteNonQuery();
                cmd.Dispose();
                con.Close();
            }
        }

        protected void btnChangePassword_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(_Default.conString))
            {

                con.Open();

                String query = "SELECT password FROM agents where id = " + Session["userId"];
                SqlCommand cmd = new SqlCommand(query, con);
                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.Read())
                {
                    if (txtPrevPassword.Text.Trim().Equals(reader.GetString(0)))
                    {
                        cmd.CommandText = "UPDATE agents " +
                            "SET password = '" + txtChangedPassword.Text.Trim() + "' " +
                            "WHERE id = " + Session["userId"];

                        reader.Close();

                        if (cmd.ExecuteNonQuery() > 0)
                        {
                            Response.Write("<script>alert('Password changed succefully.')</script>");
                        }
                        else
                        {
                            Response.Write("<script>alert('Failed to Change Password.')</script>");
                        }
                    }
                    else
                    {
                        Response.Write("<script>alert('Wrong Current Password.')</script>");
                    }
                }


            }
        }
    }
}