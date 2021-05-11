using CapaEntidad;
using CapaPersistencia;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaNegocio
{
   public class NEGPedido
    {
        public bool registroPedido(Pedido pedido)
        {
            if (pedido == null)
            {
                return false;
            }
            else
            {
                DAOPedido daoPedido = new DAOPedido();
                return daoPedido.insertaPedido(pedido);
            }
        }

        public List <Pedido> listarPedidos()
        {
            DAOPedido pedido = new DAOPedido();
            return pedido.listarPedidos();
        }
    }
}
