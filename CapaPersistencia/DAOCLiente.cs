using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CapaEntidad;

namespace CapaPersistencia
{
    public class DAOCLiente
    {
        public bool insertaCliente(Cliente cliente)
        {
            conexionBD conexion = new conexionBD();

            try
            {
                SqlConnection cnn = conexion.abrirConexion();
                SqlCommand cmd = cnn.CreateCommand();
                cmd.CommandText = "SP_InsertaCLiente";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@in_nombre", cliente.Nombre);
                cmd.Parameters.AddWithValue("@in_apellido1", cliente.Apellido1);
                cmd.Parameters.AddWithValue("@in_apellido2", cliente.Apellido2);
                cmd.Parameters.AddWithValue("@in_rut", cliente.Rut);
                cmd.Parameters.AddWithValue("@in_estado", cliente.Estado);
               
                
                int registro = cmd.ExecuteNonQuery();

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


        public List <Cliente> listarClientes()
        {
            conexionBD conexion = new conexionBD();

            try
            {
                string query = "SELECT * FROM TBL_cliente";
                conexion.abrirConexion();
                SqlDataAdapter adaptador = new SqlDataAdapter(query, conexion.Conexion);
                DataTable tabla = new DataTable();

                adaptador.Fill(tabla);

                conexion.cerrarConexion();
                if (tabla.Rows.Count > 0)
                {
                    List<Cliente> listaClientes = new List<Cliente>();

                    for (int i = 0; i < tabla.Rows.Count; i++)
                    {
                        Cliente cliente = new Cliente();

                        cliente.Id_cliente = int.Parse(tabla.Rows[i]["id_cliente"].ToString());
                        cliente.Nombre = tabla.Rows[i]["nombre"].ToString();
                        cliente.Apellido1 = tabla.Rows[i]["apellido1"].ToString();
                        cliente.Apellido2 = tabla.Rows[i]["apellido2"].ToString();
                        cliente.Rut = tabla.Rows[i]["rut"].ToString();
                        cliente.Estado = tabla.Rows[i]["estado"].ToString();

                        listaClientes.Add(cliente);
                    }

                    return listaClientes;
                }
                else
                {
                    return new List<Cliente>();
                }
            }
            catch (Exception)
            {

                return new List<Cliente>();
            }
            finally
            {
                conexion.cerrarConexion();
            }


        }


        public bool cambiaEstadoCliente(Cliente cliente)
        {
            conexionBD conexion = new conexionBD();
            try
            {
                SqlConnection cnn = conexion.abrirConexion();
                SqlCommand cmd = cnn.CreateCommand();
                cmd.CommandText = "SP_CambiaEstado";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@in_id_cliente", cliente.Id_cliente);
                int registro = cmd.ExecuteNonQuery();

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



    }
}
