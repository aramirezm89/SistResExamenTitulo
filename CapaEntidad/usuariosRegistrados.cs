using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaEntidad
{
   public class usuariosRegistrados
    {
        private string nombreUsuario;
        private string contraseña;
        private string nombre;
        private string apellido1;
        private string apellido2;

        public usuariosRegistrados()
        {

        }

        public usuariosRegistrados( string nombreUsuario, string contraseña)
        {
            this.nombreUsuario = nombreUsuario;
            this.contraseña = contraseña;
        }

        public string NombreUsuario { get => nombreUsuario; set => nombreUsuario = value; }
        public string Contraseña { get => contraseña; set => contraseña = value; }
        public string Nombre { get => nombre; set => nombre = value; }
        public string Apellido1 { get => apellido1; set => apellido1 = value; }
        public string Apellido2 { get => apellido2; set => apellido2 = value; }
    }
}
