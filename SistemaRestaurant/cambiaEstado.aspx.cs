using CapaEntidad;
using CapaNegocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SistemaRestaurant
{
    public partial class cambiaEstado : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnCambiaEstado_Click(object sender, EventArgs e)
        {
            Cliente cliente = new Cliente();

            cliente.Id_cliente = int.Parse(txtIdCli.Text);

            NegCliente negCliente = new NegCliente();

            bool registro = negCliente.editarEstadoCliente(cliente);

            if (registro)
            {
                Response.Write("<script>alert('EL estado del cliente fue cambiado de Nuevo a Frecuente. si desea revisarlo vuelva a cargar el modulo consulta ')</script>");
            }
            else
            {
                Response.Write("<script>alert('Error, no se pudo cambiar el estado del cliente de Nuevo a Frecuente. Revise que el cliente tenga mas de 4 pedidos realizados.')</script>");
            }
        }
    }
}