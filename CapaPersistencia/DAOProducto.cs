using CapaEntidad;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaPersistencia
{
    public class DAOProducto
    {
        public List <Producto> listarProductos()
        {
            conexionBD conexion = new conexionBD();

            try
            {
                string query = "SELECT * FROM TBL_productos";
                conexion.abrirConexion();
                SqlDataAdapter adaptador = new SqlDataAdapter(query, conexion.Conexion);
                DataTable tabla = new DataTable();
                adaptador.Fill(tabla);
               
                conexion.cerrarConexion();

                if (tabla.Rows.Count >0)
                {
                    List<Producto> listaProductos = new List<Producto>();

                    for (int i = 0; i < tabla.Rows.Count; i++)
                    {
                        Producto producto = new Producto();

                        producto.CodigoProducto = int.Parse(tabla.Rows[i]["codigoProducto"].ToString());
                        producto.Descripcion = tabla.Rows[i]["descripcion"].ToString();
                        producto.PreocioUnitario = int.Parse(tabla.Rows[i]["precioUnitario"].ToString());

                        listaProductos.Add(producto);
                    }

                    return listaProductos;

                }
                else
                {
                    return new List<Producto>();
                }

            }
            catch (Exception)
            {

                return new List<Producto>();
            }
            finally
            {
                conexion.cerrarConexion();
            }
        }
    }
}
