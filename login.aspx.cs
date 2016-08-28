using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.Security;

namespace hackathon_starter_asp_webforms
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Cookies["login"] != null)
            {
                Response.Redirect("default.aspx");
            }
        }

        String cs = ConfigurationManager.ConnectionStrings[1].ConnectionString;

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            if (!String.IsNullOrWhiteSpace(txtUsername.Text) & !String.IsNullOrWhiteSpace(txtPassword.Text))
            {
                using (SqlConnection con = new SqlConnection(cs))
                {
                    String Query = "SELECT USERNAME,PASSWORD FROM [Users] WHERE USERNAME = @username and password = @password";
                    using (SqlCommand cmd = new SqlCommand(Query, con))
                    {
                        string hashedpassword = FormsAuthentication.HashPasswordForStoringInConfigFile(txtPassword.Text, "SHA1");
                        con.Open();
                        cmd.Parameters.AddWithValue("@username", txtUsername.Text);
                        cmd.Parameters.AddWithValue("@password", hashedpassword);
                        using (SqlDataReader dr = cmd.ExecuteReader())
                        {
                            if (dr.HasRows)
                            {
                                HttpCookie mycookie = new HttpCookie("login");
                                mycookie["username"] = txtUsername.Text.ToUpper();
                                mycookie.Expires = DateTime.Now.AddYears(1);
                                Response.Cookies.Add(mycookie);
                                Response.Redirect("default.aspx?id=1");
                            }
                            else
                            {
                                divIncorrectError.Visible = true;
                            }
                        }
                        con.Close();
                    }
                }
            }
            else {
                divLoginError.Visible = true;
            }

        }


    }
}