using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaEntidad
{
    public class Detalle
    {
        private Pedido pedido;
        private Producto producto;
        private int cantidadProducto;
        private int total;
    


        public Detalle()
        {

        }

        public Pedido Pedido { get => pedido; set => pedido = value; }
        public Producto Producto { get => producto; set => producto = value; }
        public int CantidadProducto { get => cantidadProducto; set => cantidadProducto = value; }
        public int Total { get => total; set => total = value; }
    }
}
