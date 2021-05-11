using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaEntidad
{
   public class Cliente
    {
        private int id_cliente;
        private string nombre;
        private string apellido1;
        private string apellido2;
        private string rut;
        private string estado;

        public Cliente()
        {

        }
        public int Id_cliente { get => id_cliente; set => id_cliente = value; }
        public string Nombre { get => nombre; set => nombre = value; }
        public string Apellido1 { get => apellido1; set => apellido1 = value; }
        public string Apellido2 { get => apellido2; set => apellido2 = value; }
        public string Rut { get => rut; set => rut = value; }
        public string Estado { get => estado; set => estado = value; }
    }
}
