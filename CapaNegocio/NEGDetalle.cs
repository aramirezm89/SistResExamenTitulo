using CapaEntidad;
using CapaPersistencia;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaNegocio
{
   public class NEGDetalle
    {

        public bool registraDetalle(Detalle detalle)
        {
            if (detalle == null)
            {
                return false;
            }
            else
            {
                DAODetalle daoDetalle = new DAODetalle();
               return daoDetalle.insertaDetalle(detalle);
            }
        }

    }
}
