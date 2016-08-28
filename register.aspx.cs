using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Web.Security;

namespace hackathon_starter_asp_webforms
{
    public partial class register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Cookies["login"] != null)
            {
                Response.Redirect("default.aspx");
            }
        }

        static string cs = ConfigurationManager.ConnectionStrings[1].ConnectionString;
        
        protected void btnRegister_Click(object sender, EventArgs e)
        {
            CheckThenRegisterUsers();
        }
        private void CheckForExistingUsername()
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                String Query = "SELECT USERNAME FROM [Users] WHERE USERNAME = @username";
                using (SqlCommand cmd = new SqlCommand(Query,con))
                {
                    con.Open();
                    cmd.Parameters.AddWithValue("@username", txtUsername.Text);
                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {
                        if (dr.HasRows)
                        {
                            lblUsernameExist.Visible = true;
                            lblUsernameExist.Text = "This username has already been taken";
                            lblUsernameExist.ForeColor = System.Drawing.Color.Red;
                        }
                        else
                        {
                            lblUsernameExist.Visible = true;
                            lblUsernameExist.Text = "This username is valid";
                            lblUsernameExist.ForeColor = System.Drawing.Color.Green;
                        }
                    }
                    con.Close();
                }
            }
        }

        private void RegisterNewUser()
        {            
            using (SqlConnection con = new SqlConnection(cs))
            {
                String Query = "INSERT INTO [Users] (username,password,fullname,gender,location,image) VALUES (@username,@password,'','','','')";
                using (SqlCommand cmd = new SqlCommand(Query,con))
                {
                    String hashedPassword = FormsAuthentication.HashPasswordForStoringInConfigFile(txtPassword.Text, "SHA1");
                    con.Open();
                    cmd.Parameters.AddWithValue("@username", txtUsername.Text);
                    cmd.Parameters.AddWithValue("@password", hashedPassword);
                    int result = cmd.ExecuteNonQuery();
                    if (result>0)
                    {
                        divRegisterSuccess.Visible = true;
                        lblUsernameExist.Visible = false;
                        txtUsername.Text = "";
                    }
                    else
                    {
                        divRegisterError.Visible = false;
                    }
                    con.Close();
                }
            }
        }

        private void CheckThenRegisterUsers() {
            using (SqlConnection con = new SqlConnection(cs))
            {
                String Query = "SELECT USERNAME FROM [Users] WHERE USERNAME = @username";
                using (SqlCommand cmd = new SqlCommand(Query, con))
                {
                    con.Open();
                    cmd.Parameters.AddWithValue("@username", txtUsername.Text);
                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {
                        if (dr.HasRows)
                        {
                            lblUsernameExist.Visible = true;
                            lblUsernameExist.Text = "This username has already been taken";
                            lblUsernameExist.ForeColor = System.Drawing.Color.Red;
                        }
                        else
                        {
                            RegisterNewUser();
                        }
                    }
                    con.Close();
                }
            }
        }


        protected void txtUsername_TextChanged(object sender, EventArgs e)
        {
            CheckForExistingUsername();
        }
        
    }
}