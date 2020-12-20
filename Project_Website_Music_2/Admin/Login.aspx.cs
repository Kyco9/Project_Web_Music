using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Project_Website_Music_2.DAO;



namespace Project_Website_Music_2.Admin
{
    
    public partial class Login : System.Web.UI.Page
    {
        public string logged = "";
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_log_Click(object sender, EventArgs e)
        {
            string user = txb_user.Text.Trim();
            string pass = txb_pass.Text.Trim();

            int Login(string userName, string passWord)
            {
                if (AccountDAO.Instance.LoginWithPermission(userName, passWord) == 1)
                    return 1;
                else if (AccountDAO.Instance.LoginWithPermission(userName, passWord) == 2)
                    return 2;
                else
                    return 0;
            }


            if (Login(user, pass) == 1)
            {
                logged = "";
                Response.Redirect("Home.aspx");
            }
            else if (Login(user, pass) == 2)
            {
                Label1.Text = "*You don't have permission to login this page";
            }
            else
            {
                Label1.Text = "*Your username and word is incorrect";

            }
        }
        
    }
}