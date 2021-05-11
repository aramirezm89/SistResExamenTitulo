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
   public class DAODetalle
    {

        public bool insertaDetalle(Detalle detalle)
        {
            conexionBD conexion = new conexionBD();

            try
            {
                SqlConnection cnn = conexion.abrirConexion();
                SqlCommand cmd = cnn.CreateCommand();
                cmd.CommandText = "SP_InsertaDetalle";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@in_numeroPedido", detalle.Pedido.NumeroPedido);
                cmd.Parameters.AddWithValue("@in_codigoProducto", detalle.Producto.CodigoProducto);
                cmd.Parameters.AddWithValue("@in_cantidadProducto", detalle.CantidadProducto);
                cmd.Parameters.AddWithValue("@in_total", detalle.Total);

                int registro = cmd.ExecuteNonQuery();

                if (registro > 0)
                {
                    return true;
                }
                else
                {
                    return false;
                }

            }
            catch (Exception)
            {

               return false;
            }
            finally
            {
                conexion.cerrarConexion();
            }
        }
    }
}
