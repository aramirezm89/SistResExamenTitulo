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
    public class DAOPedido
    {
        public bool insertaPedido(Pedido pedido)
        {
            conexionBD conexion = new conexionBD();
            try
            {
                SqlConnection cnn = conexion.abrirConexion();
                SqlCommand cmd = cnn.CreateCommand();
                cmd.CommandText = "SP_InsertaPedido";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@in_id_cliente", pedido.Cliente.Id_cliente);
                cmd.Parameters.AddWithValue("@in_fecha", pedido.Fecha);
                
                int registro =  cmd.ExecuteNonQuery();

                if (registro >0)
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

        public List <Pedido> listarPedidos()
        {
            conexionBD conexion = new conexionBD();

            try
            {
                string query = "SELECT * FROM TBL_pedidos";
                conexion.abrirConexion();
                SqlDataAdapter adaptador = new SqlDataAdapter(query, conexion.Conexion);
                DataTable tabla = new DataTable();
                adaptador.Fill(tabla);

                conexion.cerrarConexion();

                if (tabla.Rows.Count >0)
                {
                    List<Pedido> listaPedidos = new List<Pedido>();

                    for (int i = 0; i < tabla.Rows.Count; i++)
                    {
                        Pedido pedido = new Pedido();

                        pedido.NumeroPedido = int.Parse(tabla.Rows[i]["numeroPedido"].ToString());
                        pedido.Fecha = DateTime.Parse(tabla.Rows[i]["fecha"].ToString());

                        listaPedidos.Add(pedido);
                    }

                    return listaPedidos;
                }
                else
                {
                    return new List<Pedido>();
                }

            }
            catch (Exception)
            {

                return new List<Pedido>();
            }
            finally
            {
                conexion.cerrarConexion();
            }
        }
    }
}
