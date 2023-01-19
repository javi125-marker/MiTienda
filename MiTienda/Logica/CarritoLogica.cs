using MiTienda.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Web;
using System.Xml;
using System.Xml.Linq;

namespace MiTienda.Logica
{
    public class CarritoLogica
    {
        private static CarritoLogica _instancia = null;

        public CarritoLogica()
        {

        }

        public static CarritoLogica Instancia
        {
            get
            {
                if (_instancia == null)
                {
                    _instancia = new CarritoLogica();
                }

                return _instancia;
            }
        }

        public int Registrar(Carrito oCarrito)
        {
            int respuesta = 0;
            using (SqlConnection oConexion = new SqlConnection(Conexion.CN))
            {
                try
                {
                    SqlCommand cmd = new SqlCommand("sp_InsertarCarrito", oConexion);
                    cmd.Parameters.AddWithValue("IdUsuario", oCarrito.oUsuario.IdUsuario);
                    cmd.Parameters.AddWithValue("IdProducto", oCarrito.oProducto.IdProducto);
                    cmd.Parameters.Add("Resultado", SqlDbType.Int).Direction = ParameterDirection.Output;
                    cmd.CommandType = CommandType.StoredProcedure;

                    oConexion.Open();
                    cmd.ExecuteNonQuery();
                    respuesta = Convert.ToInt32(cmd.Parameters["Resultado"].Value);

                }
                catch (Exception ex)
                {
                    respuesta = 0;
                }
            }
            return respuesta;
        }


        public int Cantidad(int idusuario)
        {
            int respuesta = 0;
            using (SqlConnection oConexion = new SqlConnection(Conexion.CN))
            {
                try
                {
                    SqlCommand cmd = new SqlCommand("select count(*) from carrito where idusuario = @idusuario", oConexion);
                    cmd.Parameters.AddWithValue("@idusuario", idusuario);
                    cmd.CommandType = CommandType.Text;

                    oConexion.Open();
                    respuesta = Convert.ToInt32(cmd.ExecuteScalar().ToString());

                }
                catch (Exception ex)
                {
                    respuesta = 0;
                }
            }
            return respuesta;
        }

        public List<Carrito> Obtener(int _idusuario)
        {
            List<Carrito> lst = new List<Carrito>();
            using (SqlConnection oConexion = new SqlConnection(Conexion.CN))
            {
                try
                {
                    SqlCommand cmd = new SqlCommand("sp_ObtenerCarrito", oConexion);
                    cmd.Parameters.AddWithValue("IdUsuario", _idusuario);
                    cmd.CommandType = CommandType.StoredProcedure;

                    oConexion.Open();

                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {
                        while (dr.Read())
                        {
                            lst.Add(new Carrito() {

                                IdCarrito = Convert.ToInt32(dr["IdCarrito"].ToString()),
                                oProducto = new Producto() {
                                    IdProducto = Convert.ToInt32(dr["IdProducto"].ToString()),
                                    Nombre = dr["Nombre"].ToString(),
                                    oMarca = new Marca() { Descripcion = dr["Descripcion"].ToString() },
                                    Precio = Convert.ToDecimal(dr["Precio"].ToString(), new CultureInfo("es-PE")),
                                    RutaImagen = dr["RutaImagen"].ToString()
                                },
                                
                            });
                        }
                    }

                }
                catch (Exception ex)
                {
                    lst = new List<Carrito>();
                }
            }
            return lst;
        }

        public bool Eliminar(string IdCarrito, string IdProducto) {

            bool respuesta = true;
            using (SqlConnection oConexion = new SqlConnection(Conexion.CN))
            {
                try
                {
                    StringBuilder query = new StringBuilder();
                    query.AppendLine("delete from carrito where idcarrito = @idcarrito");
                    query.AppendLine("update PRODUCTO set Stock = Stock + 1 where IdProducto = @idproducto");

                    SqlCommand cmd = new SqlCommand(query.ToString(), oConexion);
                    cmd.Parameters.AddWithValue("@idcarrito", IdCarrito);
                    cmd.Parameters.AddWithValue("@idproducto", IdProducto);
                    cmd.CommandType = CommandType.Text;

                    oConexion.Open();
                    cmd.ExecuteNonQuery();

                }
                catch (Exception ex)
                {
                    respuesta = false;
                }
            }
            return respuesta;
        }

        public List<CompraDetalle> ObtenerCompra(int IdUsuario)
        {
            List<CompraDetalle> respuesta = new List<CompraDetalle>();
            using (SqlConnection oConexion = new SqlConnection(Conexion.CN))
            {
                try
                {
                    oConexion.Open();
                    string query = @"select c.IdUsuario AS idUsuario, c.IdCompra As IdCompra, c.TotalProducto AS Productos, c.Total As Total, c.FechaCompra As Fecha from COMPRA c where IdUsuario = '" + IdUsuario+"'";
                    SqlCommand cmd = new SqlCommand(query, oConexion);
                    SqlDataReader dataReader = cmd.ExecuteReader();
                    respuesta = GetList<CompraDetalle>(dataReader);
                    return respuesta;

                }
                catch (Exception ex)
                {
                    throw ex;
                }
            }

        }

        private List<T> GetList<T>(IDataReader data)
        {
            List<T> result = new List<T>();
            while(data.Read())
            {
                var type = typeof(T);
                T obj = (T)Activator.CreateInstance(type);
                foreach(var prop in type.GetProperties())
                {
                    var propType = prop.PropertyType;
                    prop.SetValue(obj, Convert.ChangeType(data[prop.Name].ToString(), propType));
                }

                result.Add(obj);
            }

            return result;
        }



    }
}