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
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            usuariosRegistrados user = new usuariosRegistrados();

            user.NombreUsuario = txtUser.Text;
            user.Contraseña = txtPass.Text;
            NegUsuariosRegistrados negUsuariosRegistrados = new NegUsuariosRegistrados();

            bool registro = negUsuariosRegistrados.buscarUsuariosRegistrados(user);

            if (txtPass.Text.Length <6)
            {
                Response.Write("<script>alert('La contraseña debe ser minimo de 6 caracteres')</script>");
            }
            else
            {

                if (registro)
                {
                    Response.Write("<script>alert('Bienvenido')</script>");
                    Response.Redirect("Inicio.aspx");
                
                }
                else
                {
                    Response.Write("<script>alert('usuario no existe')</script>");
                }

            }


        }
    }
}