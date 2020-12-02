using System;
using System.Collections.Generic;
using System.Data;
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
            string Name = txbSongName.Text;
            int Duration = int.Parse(txbDuration.Text);
            string Published = txb_date.Text;

            Random rnd = new Random();
            int Listened = rnd.Next();
            int idUser = rnd.Next(1, 3);
            int idPlaylist = rnd.Next(1, 3);

            int idAuthor = int.Parse(dropdlAuthor.Text);
            int idSinger = int.Parse(dropdlSinger.Text);
            int idCategory = int.Parse(dropdlCategory.Text);

            if (SongDAO.Instance.InsertSong(Name, Duration, Published, Listened, idAuthor, idSinger, idCategory, idUser, idPlaylist))
                Label1.Text = "Adding Success";
            else
                Label1.Text = "Adding Fail!!!";
            

            GridView1.DataBind();

            
        }

        protected void btn_Delete_Click(object sender, EventArgs e)
        {
            string name = txb_delete.Text;

            if (SongDAO.Instance.DeleteSong(name))
                Label1.Text = "Delete Success";
            else
                Label1.Text = "Delete Fail!!!";
            

            txb_delete.Text = "";
            GridView1.DataBind();
        }

        
    }
}