using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaEntidad
{
    public class Pedido
    {
        private int numeroPedido;
        private Cliente cliente;
        private DateTime fecha;

        public Pedido()
        {

        }
        public int NumeroPedido { get => numeroPedido; set => numeroPedido = value; }
        public Cliente Cliente { get => cliente; set => cliente = value; }
        public DateTime Fecha { get => fecha; set => fecha = value; }
    }
}
