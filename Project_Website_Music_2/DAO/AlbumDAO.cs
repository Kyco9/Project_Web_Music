using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Project_Website_Music_2.DAO
{
    public class AlbumDAO
    {
        private static AlbumDAO instance;

        public static AlbumDAO Instance
        {
            get { if (instance == null) instance = new AlbumDAO(); return AlbumDAO.instance; }
            private set { AlbumDAO.instance = value; }
        }
        private AlbumDAO() { }

        /*-------------------------------------------------------------------------------------------------*/

        public bool InsertAlbum(string name, string artis, string category, string datePubsl)
        {
            string query = string.Format("INSERT dbo.Table_2 ( song_name, artis, catetory, nxb )VALUES  ( N'{0}', N'{1}', N'{2}', N'{3}')", name, artis, category, datePubsl);
            int result = DataProvider.Instance.ExecuteNonQuery(query);

            return result > 0;
        }

        //public bool UpdateFood(int idFood, string name, int id, float price)
        //{
        //    string query = string.Format("UPDATE dbo.Food SET name = N'{0}', idCategory = {1}, price = {2} WHERE id = {3}", name, id, price, idFood);
        //    int result = DataProvider.Instance.ExecuteNonQuery(query);

        //    return result > 0;
        //}

        //public bool DeleteFood(int idFood)
        //{
        //    BillInfoDAO.Instance.DeleteBillInfoByFoodID(idFood);

        //    string query = string.Format("Delete Food where id = {0}", idFood);
        //    int result = DataProvider.Instance.ExecuteNonQuery(query);

        //    return result > 0;
        //}
    }
}