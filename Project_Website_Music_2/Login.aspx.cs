using System;
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
            #region Loginadmin
            //string user = txb_username.Text;
            //string pass = txb_password.Text;

            //int Login(string userName, string passWord)
            //{
            //    if (AccountDAO.Instance.LoginWithPermission(userName, passWord) == 1)
            //        return 1;
            //    else if (AccountDAO.Instance.LoginWithPermission(userName, passWord) == 2)
            //        return 2;
            //    else
            //        return 0;
            //}
            

            //if (Login(user, pass) == 1)
            //{
            //    Response.Redirect("Admin/Home.aspx");
            //}
            //else if (Login(user, pass) == 2)
            //{
            //    Response.Redirect("Default.aspx");
            //}
            //else 
            //{
            //    Label1.Text = "Your username and word is incorrect";
            //    Label1.ForeColor = System.Drawing.Color.Red;

            //}
            #endregion

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
