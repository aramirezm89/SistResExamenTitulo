using CapaEntidad;
using CapaPersistencia;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaNegocio
{
   public class NEGProducto
    {
        public List<Producto> listarProductos()
        {
            DAOProducto producto = new DAOProducto();

            return producto.listarProductos();
        }
    }
}
