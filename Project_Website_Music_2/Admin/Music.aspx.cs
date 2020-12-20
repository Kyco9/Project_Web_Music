using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Project_Website_Music_2.DAO;
using System.Web.Configuration;
using System.Data.SqlClient;

namespace Project_Website_Music_2.Admin
{
    public partial class AddMusic : System.Web.UI.Page
    {
        string chuoi = WebConfigurationManager.ConnectionStrings["DBSongConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
                LoadGridViewSong();
        }

        #region old code
        /*protected void btn_AddMuic_Click(object sender, EventArgs e)
        {
            //string Name = txbSongName.Text;
            //int Duration = int.Parse(txbDuration.Text);
            //string Published = txb_date.Text;

            //Random rnd = new Random();
            //int Listened = rnd.Next();
            //int idUser = rnd.Next(1, 3);
            //int idPlaylist = rnd.Next(1, 3);

            //int idAuthor = int.Parse(dropdlAuthor.Text);
            //int idSinger = int.Parse(dropdlSinger.Text);
            //int idCategory = int.Parse(dropdlCategory.Text);

            //if (SongDAO.Instance.InsertSong(Name, Duration, Published, Listened, idAuthor, idSinger, idCategory, idUser, idPlaylist))
            //    Label1.Text = "Adding Success";
            //else
            //    Label1.Text = "Adding Fail!!!";
            

            //GridView1.DataBind();

            
        }

        protected void btn_Delete_Click(object sender, EventArgs e)
        {
            //string name = txb_delete.Text;

            //if (SongDAO.Instance.DeleteSong(name))
            //    Label1.Text = "Delete Success";
            //else
            //    Label1.Text = "Delete Fail!!!";
            

            //txb_delete.Text = "";
            //GridView1.DataBind();
        }
        */
        #endregion

        void LoadGridViewSong()
        {
            string query = "select s.id, s.Name, si.Name as SingerName, a.Name as AuthorName, c.Name as CategoryName, Duration, convert(varchar(10), Published, 120) as Published1, ImgUrl from Song as s, Category as c, Author as a, Singer as si WHERE s.idAuthor = a.id and s.idCategory = c.id and s.idSinger = si.id";
            gv_ShowSong.DataSource = DataProvider.Instance.ExecuteQuery(query);
            gv_ShowSong.DataBind();
        }

        protected void gv_ShowSong_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gv_ShowSong.EditIndex = e.NewEditIndex;
            LoadGridViewSong();
        }

        protected void gv_ShowSong_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gv_ShowSong.EditIndex = -1;
            LoadGridViewSong();
        }

        protected void gv_ShowSong_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                using (SqlConnection ketnoi = new SqlConnection(chuoi))
                {//, Author=@idAuthor, Category=@idCategory, Duration=@Duration, Published=@Published 
                    ketnoi.Open();
                    string updateqr = "update Song set Name=@Name, idSinger=@idSinger, idAuthor=@idAuthor, idCategory=@idCategory, Duration=@Duration, Published=@Published where id=@id";
                    SqlCommand cmd = new SqlCommand(updateqr, ketnoi);
                    cmd.Parameters.AddWithValue("@Name", (gv_ShowSong.Rows[e.RowIndex].FindControl("txb_SongName") as TextBox).Text.Trim());
                    cmd.Parameters.AddWithValue("@idSinger", Convert.ToInt32((gv_ShowSong.Rows[e.RowIndex].FindControl("ddl_Singer") as DropDownList).Text));
                    cmd.Parameters.AddWithValue("@idAuthor", Convert.ToInt32((gv_ShowSong.Rows[e.RowIndex].FindControl("ddl_Author") as DropDownList).Text));
                    cmd.Parameters.AddWithValue("@idCategory", Convert.ToInt32((gv_ShowSong.Rows[e.RowIndex].FindControl("ddl_Category") as DropDownList).Text));
                    cmd.Parameters.AddWithValue("@Duration", (gv_ShowSong.Rows[e.RowIndex].FindControl("txb_Duration") as TextBox).Text.Trim());
                    cmd.Parameters.AddWithValue("@Published", (gv_ShowSong.Rows[e.RowIndex].FindControl("txb_DatePub") as TextBox).Text.Trim());

                    cmd.Parameters.AddWithValue("@id", Convert.ToInt32((gv_ShowSong.DataKeys[e.RowIndex].Value.ToString())));
                    cmd.ExecuteNonQuery();
                    gv_ShowSong.EditIndex = -1;
                    LoadGridViewSong();

                    string display = "Edit Success!";
                    ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + display + "');", true);

                }
            }
            catch (Exception exx)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "Edit Fail", "alert('" + exx.Message + "');", true);
            }
        }

        protected void gv_ShowSong_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                using (SqlConnection ketnoi = new SqlConnection(chuoi))
                {//, Author=@idAuthor, Category=@idCategory, Duration=@Duration, Published=@Published 
                    ketnoi.Open();
                    string updateqr = "Delete from Song where id=@id";
                    SqlCommand cmd = new SqlCommand(updateqr, ketnoi);
                    cmd.Parameters.AddWithValue("@id", Convert.ToInt32((gv_ShowSong.DataKeys[e.RowIndex].Value.ToString())));
                    cmd.ExecuteNonQuery();
                    gv_ShowSong.EditIndex = -1;
                    LoadGridViewSong();

                    string display = "Delete Success!";
                    ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + display + "');", true);

                }
            }
            catch (Exception exx)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "Delete Fail", "alert('" + exx.Message + "');", true);
            }
        }

        protected void gv_ShowSong_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if(e.CommandName.Equals("AddNew"))
            {
                try
                {
                    using (SqlConnection ketnoi = new SqlConnection(chuoi))
                    {//, Author=@idAuthor, Category=@idCategory, Duration=@Duration, Published=@Published 
                        ketnoi.Open();
                        string updateqr = "insert into Song (Name, Duration, Published, idAuthor, idSinger, idCategory) value ('@Name', '@Duration', '@Published', '@idAuthor', '@idSinger', '@idCategory')";
                        SqlCommand cmd = new SqlCommand(updateqr, ketnoi);
                        cmd.Parameters.AddWithValue("@Name", (gv_ShowSong.FooterRow.FindControl("txb_SongNameFooter") as TextBox).Text.Trim());
                        cmd.Parameters.AddWithValue("@idSinger", Convert.ToInt32((gv_ShowSong.FooterRow.FindControl("ddl_SingerFooter") as DropDownList).Text));
                        cmd.Parameters.AddWithValue("@idAuthor", Convert.ToInt32((gv_ShowSong.FooterRow.FindControl("ddl_AuthorFooter") as DropDownList).Text));
                        cmd.Parameters.AddWithValue("@idCategory", Convert.ToInt32((gv_ShowSong.FooterRow.FindControl("ddl_CategoryFooter") as DropDownList).Text));
                        cmd.Parameters.AddWithValue("@Duration", (gv_ShowSong.FooterRow.FindControl("txb_DurationFooter") as TextBox).Text.Trim());
                        cmd.Parameters.AddWithValue("@Published", (gv_ShowSong.FooterRow.FindControl("txb_DatePubFooter") as TextBox).Text.Trim());

                        cmd.ExecuteNonQuery();
                        LoadGridViewSong();

                        string display = "Edit Success!";
                        ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + display + "');", true);

                    }
                }
                catch (Exception exx)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "Edit Fail", "alert('" + exx.Message + "');", true);
                }
            }
            
        }

        protected void ib_refesh_Click(object sender, ImageClickEventArgs e)
        {
            Page_Load(sender, e);
        }

        protected void lib_Add_Click(object sender, EventArgs e)
        {
            Response.Redirect("MusicAddNew.aspx");
        }

        protected void lib_Edit_Click(object sender, EventArgs e)
        {
            Response.Redirect("MusicEdit.aspx");
        }

        protected void lib_Del_Click(object sender, EventArgs e)
        {

        }
    }
}