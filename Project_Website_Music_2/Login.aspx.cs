﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Project_Website_Music_2.DAO;
using System.Data.SqlClient; //this namespace is for sqlclient server  
using System.Configuration;
using System.Data;

namespace Project_Website_Music_2
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void Login_Click(object sender, EventArgs e)
        {
            string user = txb_username.Text;
            string pass = txb_password.Text;

            bool Login(string userName, string passWord)
            {
                return AccountDAO.Instance.Login(userName, passWord);
            }
            

            if (Login(user, pass))
            {
                Response.Redirect("Default.aspx");
            }
            else
            {
                Label1.Text = "Your username or password is incorrect";
                Label1.ForeColor = System.Drawing.Color.Red;

            }

        }
    }
}
