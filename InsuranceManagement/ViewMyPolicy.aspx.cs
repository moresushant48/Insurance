using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Net;
using System.Net.Mail;

namespace InsuranceManagement
{
    public partial class ViewMyPolicy : System.Web.UI.Page
    {

        private String code;

        protected void Page_Load(object sender, EventArgs e)
        {

            
        }

        protected void btnSendMail_Click(object sender, EventArgs e)
        {
            Random random = new Random();

            using (SqlConnection con = new SqlConnection(_Default.conString))
            {
                con.Open();
                String exists = "SELECT * FROM customers WHERE email = '" + txtEmail.Text.Trim() + "'";
                SqlCommand cmd = new SqlCommand(exists);

                cmd = new SqlCommand(exists, con);

                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.Read())
                {
                    code = random.Next(000000, 999999).ToString();
                    Response.Cookies["otp"].Value = code;
                    MailMessage message = new MailMessage("dhondesooraj@gmail.com", txtEmail.Text.Trim());

                    message.Subject = "View Your Policies at Insurance Management";
                    message.IsBodyHtml = true;
                    message.Body = "Hey there, Your <b>OTP</b> is <br> <h1>" + code + "</h1>";

                    SmtpClient client = new SmtpClient("smtp.gmail.com", 587);
                    NetworkCredential networkCredential = new NetworkCredential("dhondesooraj@gmail.com", "zgirxewitlyfuyla");
                    client.EnableSsl = true;
                    client.UseDefaultCredentials = false;
                    client.Credentials = networkCredential;
                    try
                    {
                        client.Send(message);
                    }
                    catch (Exception ex)
                    {
                        throw ex;
                    }

                    lblSuccess.Text = "OTP sent on your email.";
                }
                else
                {
                    lblSuccess.Text = "You will receive an Email if you are our registered customer.";
                }

                reader.Close();
                cmd.Dispose();
                con.Dispose();
            }
        }

        protected void btnVerifyOtp_Click(object sender, EventArgs e)
        {
            if (Request.Cookies["otp"].Value != null)
            {

                if (Request.Cookies["otp"].Value.Equals(txtSecurityCode.Text.Trim()))
                {

                    using (SqlConnection con = new SqlConnection(_Default.conString))
                    {

                        SqlDataSource3.SelectParameters["email"].DefaultValue = txtEmail.Text.Trim();

                        ListView1.DataBind();
                    }

                }
                else
                {
                    lblInvalidCode.Text = "Invalid Security Code.";
                }
            }
        }
    }
}