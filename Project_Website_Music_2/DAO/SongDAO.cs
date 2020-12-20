using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using Project_Website_Music_2.DTO;

namespace Project_Website_Music_2.DAO
{
    public class SongDAO
    {
        private static SongDAO instance;

        public static SongDAO Instance
        {
            get { if (instance == null) instance = new SongDAO(); return SongDAO.instance; }
            private set { SongDAO.instance = value; }
        }
        private SongDAO() { }

        /*-------------------------------------------------------------------------------------------------*/

        public bool InsertSong(string Name, int Duration, string Published, int Listened, int idAuthor, int idSinger, int idCategory, int idUser, int idPlaylist)
        {
            string query = string.Format("insert into Song (Name, Duration, Published, Listened, idAuthor, idSinger, idCategory, idUser, idPlaylist) values('{0}',{1},'{2}',{3}, {4}, {5}, {6}, {7}, {8})", Name, Duration, Published, Listened, idAuthor, idSinger, idCategory, idUser, idPlaylist);
            int result = DataProvider.Instance.ExecuteNonQuery(query);

            return result > 0;
        }

        public class SongDataAccessLayer
        {
            public static List<Song> GetAllSong()
            {
                List<Song> listSong = new List<Song>();

                string CS = ConfigurationManager.ConnectionStrings["DBSongConnectionString"].ConnectionString;
                using (SqlConnection con = new SqlConnection(CS))
                {
                    SqlCommand cmd = new SqlCommand("Select * from Song", con);
                    con.Open();
                    SqlDataReader rdr = cmd.ExecuteReader();
                    while (rdr.Read())
                    {
                        Song s = new Song();
                        s.ID = Convert.ToInt32(rdr["ID"]);
                        s.Name = rdr["Name"].ToString();
                        s.Duration = Convert.ToInt32(rdr["Duration"]);
                        s.Published = rdr["Published"].ToString();
                        s.idSinger = Convert.ToInt32(rdr["idSinger"]);
                        s.idAuthor = Convert.ToInt32(rdr["idAuthor"]);
                        s.idCategory = Convert.ToInt32(rdr["idCategory"]);

                        listSong.Add(s);
                    }
                }

                return listSong;
            }

            public static void DeleteSong(List<string> SongIds)
            {
                string CS = ConfigurationManager.ConnectionStrings["DBSongConnectionString"].ConnectionString;
                using (SqlConnection con = new SqlConnection(CS))
                {
                    List<string> parameters = SongIds.Select((s, i) => "@Parameter" + i.ToString()).ToList();
                    string inClause = string.Join(",", parameters);
                    string deleteCommandText = "Delete from Song where ID IN (" + inClause + ")";
                    SqlCommand cmd = new SqlCommand(deleteCommandText, con);

                    for (int i = 0; i < parameters.Count; i++)
                    {
                        cmd.Parameters.AddWithValue(parameters[i], SongIds[i]);
                    }

                    con.Open();
                    cmd.ExecuteNonQuery();
                }
            }

            //public bool UpdateFood(int idFood, string name, int id, float price)
            //{
            //    string query = string.Format("UPDATE dbo.Food SET name = N'{0}', idCategory = {1}, price = {2} WHERE id = {3}", name, id, price, idFood);
            //    int result = DataProvider.Instance.ExecuteNonQuery(query);

            //    return result > 0;
            //}

            //public bool DeleteSong(string nameFood)
            //{

            //    string query = string.Format("Delete Table_2 where song_name = N'{0}'", nameFood);
            //    int result = DataProvider.Instance.ExecuteNonQuery(query);

            //    return result > 0;
            //}
        }
    }
}