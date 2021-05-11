using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaEntidad
{
   public class Producto
    {
        private int codigoProducto;
        private string descripcion;
        private int preocioUnitario;

        public Producto()
        {

        }

        public int CodigoProducto { get => codigoProducto; set => codigoProducto = value; }
        public string Descripcion { get => descripcion; set => descripcion = value; }
        public int PreocioUnitario { get => preocioUnitario; set => preocioUnitario = value; }
    }
}
