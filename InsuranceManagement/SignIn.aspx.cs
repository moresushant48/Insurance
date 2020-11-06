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
    public partial class SignIn : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["loggedIn"] != null)
            {
                Response.Redirect("/");
            }

            if (!IsPostBack)
            {

            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {

            lblFailure.Text = "";

            using (SqlConnection con = new SqlConnection(_Default.conString))
            {
                con.Open();

                String existsLogin = "SELECT * FROM agents WHERE email = '" + txtEmail.Text + "' AND password = '" + txtPassword.Text + "'";
                SqlCommand cmd = new SqlCommand(existsLogin, con);

                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.Read())
                {
                    Session["loggedIn"] = true;
                    Session["userId"] = reader.GetInt32(0);
                    Session["userEmail"] = reader.GetString(4);

                    redirectAfterLogin();
                }
                else
                {
                    txtEmail.Text = "";
                    txtPassword.Text = "";
                    lblFailure.Text = "Wrong credentials.";
                }

                reader.Close();
                con.Close();

            }
        }

        private void redirectAfterLogin()
        {
            Response.Redirect("/");
        }
    }
}