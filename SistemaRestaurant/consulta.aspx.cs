using CapaPersistencia;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SistemaRestaurant
{
    public partial class consulta : System.Web.UI.Page
    {
        DataTable tabla;
        protected void Page_Load(object sender, EventArgs e)
        {
            conexionBD conexion = new conexionBD();
            try
            {
                string query = "SELECT  * FROM V_ConsultaPedidos";
                conexion.abrirConexion();
                SqlDataAdapter adaptador = new SqlDataAdapter(query, conexion.Conexion);
                tabla = new DataTable();

                tabla.Columns.Add("Id_Cliente");
                tabla.Columns.Add("Rut");
                tabla.Columns.Add("NumeroPedido");
                tabla.Columns.Add("Nombre");
                tabla.Columns.Add("Apellido1");
                tabla.Columns.Add("Apellido2");
                tabla.Columns.Add("Estado");

                adaptador.Fill(tabla);

                conexion.cerrarConexion();

                gridPedidos.DataSource = tabla;
                gridPedidos.DataBind();
            }
            catch (Exception)
            {

                throw;
            }
        }

        protected void btnFiltroNombre_Click(object sender, EventArgs e)
        {
            conexionBD conexion = new conexionBD();
            try
            {
                string query = "SELECT * FROM V_ConsultaPedidos WHERE nombre LIKE '" + txtFiltroNombre.Text + "%'";
                conexion.abrirConexion();
                SqlDataAdapter adaptador = new SqlDataAdapter(query, conexion.Conexion);

                tabla = new DataTable();

                tabla.Columns.Add("Id_Cliente");
                tabla.Columns.Add("Rut");
                tabla.Columns.Add("NumeroPedido");
                tabla.Columns.Add("Nombre");
                tabla.Columns.Add("Apellido1");
                tabla.Columns.Add("Apellido2");
                tabla.Columns.Add("Estado");

                adaptador.Fill(tabla);

                conexion.cerrarConexion();

                gridPedidos.DataSource = tabla;
                gridPedidos.DataBind();

            }
            catch (Exception)
            {

                throw;
            }
        }

     

        protected void DpFiltroEstado_SelectedIndexChanged(object sender, EventArgs e)
        {
          
        }

        protected void btnFiltroEstado_Click(object sender, EventArgs e)
        {
            conexionBD conexion = new conexionBD();
            try
            {
                string query = "SELECT * FROM V_ConsultaPedidos WHERE estado ='"+ DpFiltroEstado.Text+"'";
                conexion.abrirConexion();
                SqlDataAdapter adaptador = new SqlDataAdapter(query, conexion.Conexion);

                tabla = new DataTable();

                tabla.Columns.Add("Id_Cliente");
                tabla.Columns.Add("Rut");
                tabla.Columns.Add("NumeroPedido");
                tabla.Columns.Add("Nombre");
                tabla.Columns.Add("Apellido1");
                tabla.Columns.Add("Apellido2");
                tabla.Columns.Add("Estado");

                adaptador.Fill(tabla);

                conexion.cerrarConexion();

                gridPedidos.DataSource = tabla;
                gridPedidos.DataBind();

            }
            catch (Exception)
            {

                throw;
            }
        }
    }
}