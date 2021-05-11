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
    public class DAOUsuarioRegistrado
    {
        public bool BuscarUsuarioRegistrado(usuariosRegistrados user)
        {
            conexionBD conexion = new conexionBD();

            try
            {
                SqlConnection cnn = conexion.abrirConexion();
                SqlCommand cmd = cnn.CreateCommand();
                cmd.CommandText = "SP_BuscaUsuarios";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@in_nombreUsuario", user.NombreUsuario);
                cmd.Parameters.AddWithValue("@in_contraseña", user.Contraseña);
                SqlDataReader leerDatos = cmd.ExecuteReader();

                if (leerDatos.Read())
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
