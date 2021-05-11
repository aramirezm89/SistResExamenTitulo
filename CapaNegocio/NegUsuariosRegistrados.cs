using CapaEntidad;
using CapaPersistencia;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaNegocio
{
   public class NegUsuariosRegistrados
    {
        public bool buscarUsuariosRegistrados(usuariosRegistrados user)
        {
            if (user == null)
            {
                return false;
            }
            else
            {
                DAOUsuarioRegistrado daoUsuario = new DAOUsuarioRegistrado();
                return daoUsuario.BuscarUsuarioRegistrado(user);

            }
        }
    }
}
