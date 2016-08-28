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
    public partial class editProfile : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings[1].ConnectionString;
        String username;

        protected void Page_Load(object sender, EventArgs e)
        {
            username = Request.Cookies["login"]["username"];
            if (!IsPostBack)
            {
                if (Request.Cookies["login"] != null)
                {
                    getUserInfo();
                }
                else
                {
                    Response.Redirect("default.aspx");
                }
            }
        }

        private void getUserInfo()
        {
            var Query = "SELECT * FROM USERS WHERE USERNAME = @username ";
            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                using (SqlCommand cmd = new SqlCommand(Query, con))
                {
                    cmd.Parameters.AddWithValue("@username", username);
                    SqlDataReader sdr = cmd.ExecuteReader();
                    while (sdr.Read())
                    {
                        txtFullname.Text = sdr["fullname"].ToString();
                        txtGender.Text = sdr["gender"].ToString();
                        txtLocation.Text = sdr["location"].ToString();
                        txtUsername.Text = sdr["username"].ToString();
                        HiddenField1.Value = sdr["image"].ToString();
                    }

                }

            }
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            var Query = "DELETE USERS WHERE USERNAME = @username ";
            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                using (SqlCommand cmd = new SqlCommand(Query, con))
                {
                    cmd.Parameters.AddWithValue("@username", username);
                    int result = cmd.ExecuteNonQuery();
                    if (result > 0)
                    {
                        Response.Cookies["login"].Expires = DateTime.Now.AddDays(-1);
                        Response.Redirect("default.aspx?id=2");
                    }

                }

            }
        }

        protected void btnPasswordSave_Click(object sender, EventArgs e)
        {
            var Query = "SELECT password FROM USERS WHERE USERNAME = @username ";
            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                using (SqlCommand cmd = new SqlCommand(Query, con))
                {
                    cmd.Parameters.AddWithValue("@username", username);
                    var oldpassword = cmd.ExecuteScalar().ToString();
                    var hashedOldPassword = FormsAuthentication.HashPasswordForStoringInConfigFile(txtOldPassword.Text, "SHA1");
                    if (hashedOldPassword == oldpassword)
                    {
                        changeProfilePassword();
                    }
                    else
                    {
                        divPasswordError.Visible = true;
                        divPasswordSuccess.Visible = false;
                    }

                }

            }
        }

        private void changeProfilePassword()
        {
            var Query = "UPDATE USERS SET PASSWORD = @newpassword WHERE USERNAME = @username ";
            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                using (SqlCommand cmd = new SqlCommand(Query, con))
                {
                    cmd.Parameters.AddWithValue("@username", username);
                    cmd.Parameters.AddWithValue("@newpassword", FormsAuthentication.HashPasswordForStoringInConfigFile(txtConfirmPassword.Text, "SHA1"));
                    var result = cmd.ExecuteNonQuery();
                    if (result > 0)
                    {
                        divPasswordSuccess.Visible = true;
                        divPasswordError.Visible = false;
                        divPasswordError2.Visible = false;
                    }
                    else
                    {
                        divPasswordError2.Visible = true;
                        divPasswordSuccess.Visible = false;
                        divPasswordError.Visible = false;
                    }

                }

            }
        }

        protected void btnProfileSave_Click(object sender, EventArgs e)
        {
            var newimage = "";
            if (fileUpload1.HasFile)
            {
                newimage = fileUpload1.FileName;
                fileUpload1.SaveAs(Server.MapPath("/images/" + newimage));
            }
            else
            {
                newimage = HiddenField1.Value;
            }
            
            var Query = "UPDATE USERS SET USERNAME = @username,location=@location,gender=@gender,fullname=@fullname,image=@image where username=@username";
            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                using (SqlCommand cmd = new SqlCommand(Query, con))
                {
                    cmd.Parameters.AddWithValue("@username", txtUsername.Text);
                    cmd.Parameters.AddWithValue("@fullname", txtFullname.Text);
                    cmd.Parameters.AddWithValue("@gender", txtGender.Text);
                    cmd.Parameters.AddWithValue("@location", txtLocation.Text);
                    cmd.Parameters.AddWithValue("@image", newimage);
                    var result = cmd.ExecuteNonQuery();
                    if (result > 0)
                    {
                        divProfileSuccess.Visible = true;
                    }
                    else
                    {
                        divProfileError.Visible = true;
                    }

                }

            }
        }
    }
}