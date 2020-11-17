using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Project_Website_Music_2.DAO;

namespace Project_Website_Music_2.Admin
{
    public partial class AddMusic : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_AddMuic_Click(object sender, EventArgs e)
        {
            string name = txb_song_name.Text;
            string artiss = txb_artis.Text;
            string category = DropDownList1.Text;
            string datePub = txb_date.Text;

            Label1.Text = datePub;

            if (AlbumDAO.Instance.InsertAlbum(name, artiss, category, datePub))
                Label1.Text = "Adding Success";
            else
                Label1.Text = "Adding Fail!!!";

            txb_song_name.Text = "";
            txb_artis.Text = "";
            txb_date.Text = "";

            GridView1.DataBind();

            
        }

        protected void btn_Delete_Click(object sender, EventArgs e)
        {
            string name = txb_delete.Text;
            AlbumDAO.Instance.DeleteAlbum(name);

            txb_delete.Text = "";
            GridView1.DataBind();
        }

        
    }
}