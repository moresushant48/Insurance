using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Net;
using System.Net.Mail;

namespace InsuranceManagement.views
{
    public partial class footer : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSend_Click(object sender, EventArgs e)
        {
            MailMessage message = new MailMessage(txtEmail.Text.Trim(), "dhondesooraj@gmail.com");

            message.Subject = "For Insurance Help.";
            message.IsBodyHtml = true;
            message.Body = "Hello, This is <b>" + txtName.Text + "</b> (" + txtEmail.Text.Trim() + ").<br>" + txtMessage.Text.Trim();

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
            finally
            {
                txtName.Text = "";
                txtEmail.Text = "";
                txtMessage.Text = "";
                lblMailSuccess.Text = "Email has been sent. You will be contacted shortly.";
            }
        }
    }
}