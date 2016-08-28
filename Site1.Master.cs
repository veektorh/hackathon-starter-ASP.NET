using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace hackathon_starter_asp_webforms
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Cookies["login"] != null)
            {
                lbluser.Text = Request.Cookies["login"]["username"];
                registerLink.Visible = false;
                loginLink.Visible = false;
            }
            else
            {
                userLink.Visible = false;
                registerLink.Visible = true;
                loginLink.Visible = true;
            }
        }

        protected void logoutLinkBtn_Click(object sender, EventArgs e)
        {
            if (Request.Cookies["login"] != null)
            {
                Response.Cookies["login"].Expires = DateTime.Now.AddDays(-1);
                Response.Redirect("default.aspx");
            }
        }

        protected void accountLink_Click(object sender, EventArgs e)
        {
            Response.Redirect(Request.Cookies["login"]["username"].ToString());
        }
    }
}