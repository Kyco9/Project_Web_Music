using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

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

        //public bool UpdateFood(int idFood, string name, int id, float price)
        //{
        //    string query = string.Format("UPDATE dbo.Food SET name = N'{0}', idCategory = {1}, price = {2} WHERE id = {3}", name, id, price, idFood);
        //    int result = DataProvider.Instance.ExecuteNonQuery(query);

        //    return result > 0;
        //}

        public bool DeleteSong(string nameFood)
        {

            string query = string.Format("Delete Table_2 where song_name = N'{0}'", nameFood);
            int result = DataProvider.Instance.ExecuteNonQuery(query);

            return result > 0;
        }
    }
}