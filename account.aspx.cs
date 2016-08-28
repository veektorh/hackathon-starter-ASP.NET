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
    public partial class account : System.Web.UI.Page
    {
        
        string cs = ConfigurationManager.ConnectionStrings[1].ConnectionString;
        String username;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Page.RouteData.Values["username"].ToString() != null)
                {
                    divPageError.Visible = false;
                    username = Page.RouteData.Values["username"].ToString();
                    CheckThenFetchUser();
                }
            }
            catch (Exception)
            {
                Profilebody.Visible = false;
                divPageError.Visible = true;
            }

            if (Request.Cookies["login"] != null)
            {
                btnUpdateProfile.Visible = true;
            }
            else
            {
                btnUpdateProfile.Visible = false;
            }
        }

        private void CheckThenFetchUser()
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                String Query = "SELECT USERNAME FROM [Users] WHERE USERNAME = @username";
                using (SqlCommand cmd = new SqlCommand(Query, con))
                {
                    con.Open();
                    cmd.Parameters.AddWithValue("@username", username);
                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {
                        if (dr.HasRows)
                        {
                            getProfileInfo();
                        }
                        else
                        {
                            Profilebody.Visible = false;
                            divUserError.Visible = true;
                        }
                    }
                    con.Close();
                }
            }
        }

        private void getProfileInfo()
        {
            var Query = "SELECT * FROM USERS WHERE USERNAME = @username ";
            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                using (SqlCommand cmd = new SqlCommand(Query,con))
                {
                    cmd.Parameters.AddWithValue("username",username);
                    SqlDataReader sdr = cmd.ExecuteReader();
                    while (sdr.Read())
                    {
                        lblFullname.Text = sdr["fullname"].ToString();
                        lblGender.Text = sdr["gender"].ToString();
                        lblLocation.Text = sdr["location"].ToString();
                        lblUsername.Text = sdr["username"].ToString();
                        if (string.IsNullOrWhiteSpace(sdr["image"].ToString()))
                        {
                            Image1.ImageUrl = "images/favicon.png";
                        }
                        else
                        {
                            Image1.ImageUrl = "images/" + sdr["image"].ToString();
                        }
                        
                    }
                    
                }
               
            }
        }

        protected void btnUpdateProfile_Click(object sender, EventArgs e)
        {
            Response.Redirect("editProfile.aspx"); 
        }
    }
}