using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Configuration;
using System.Data;
using System.Runtime.InteropServices.WindowsRuntime;

namespace CapaPersistencia
{
   public class conexionBD
    {
        private string cadenaConexion = @"";
        private SqlConnection conexion = null;

        public conexionBD()
        {
            cadenaConexion = ConfigurationManager.ConnectionStrings["MiConexion"].ConnectionString;
            conexion = new SqlConnection(cadenaConexion);
        }

        public SqlConnection Conexion { get => conexion;}

        public SqlConnection abrirConexion()
        {
            try
            {
                if (conexion.State == ConnectionState.Closed )
                {
                    conexion.Open();
                    return conexion;
                }
               
              
            }
            catch (Exception)
            {

                throw;
            }

            return conexion;
        }


        public SqlConnection cerrarConexion()
        {
            try
            {
                if (conexion.State == ConnectionState.Open)
                {
                    conexion.Close();    
                }


            }
            catch (Exception)
            {

                throw;
            }

            return conexion;
        }

    }
}
