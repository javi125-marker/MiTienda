using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MiTienda.Models
{
    public class CompraDetalle
    {
       
        public int IdUsuario { get; set; }
        public string Fecha { get; set; }
        public int IdCompra { get; set; }
        public double Productos { get; set; }
        public double Total { get; set; }


    }

}