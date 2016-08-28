using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
namespace hackathon_starter_asp_webforms
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["id"] == "1")
            {
                divLoginSuccess.Visible = true;
            }
            if (Request.QueryString["id"] == "2")
            {
                divDeleteSuccess.Visible = true;
            }
            if (Request.Cookies["login"] != null)
            {
                btnRegister.Visible = false;
            }
            else
            {
                btnRegister.Visible = true;
            }

            GetTotalNumberOfUsers();
        }
        
        private void GetTotalNumberOfUsers()
        {
            var cs = ConfigurationManager.ConnectionStrings[1].ConnectionString;
            var Query = "select COUNT(*) FROM Users";
            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                using (SqlCommand cmd = new SqlCommand(Query, con))
                {
                    lblUsers.Text = cmd.ExecuteScalar().ToString();
                }

            }
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            Response.Redirect("register.aspx");
        }
    }
}