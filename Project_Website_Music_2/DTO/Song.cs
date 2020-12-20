using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Project_Website_Music_2.DTO
{
    public class Song
    {
        public int ID { get; set; }
        public string Name { get; set; }
        public int Duration { get; set; }
        public string Published { get; set; }
        public int idSinger { get; set; }
        public int idAuthor { get; set; }
        public int idCategory { get; set; }
    }
}