using CapaEntidad;
using CapaPersistencia;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaNegocio
{
    public class NegCliente
    {
        public bool registroCliente(Cliente cliente)
        {
            if (cliente == null)
            {
                return false;
            }
            else
            {
                DAOCLiente daoCliente = new DAOCLiente();
                return daoCliente.insertaCliente(cliente);
            }
 
        }

        public List <Cliente> listarCLientes()
        {
            DAOCLiente cliente = new DAOCLiente();
            return cliente.listarClientes();
        }

        public bool editarEstadoCliente(Cliente cliente)
        {
            if (cliente == null)
            {
                return false;
            }
            else
            {
                DAOCLiente daoCliente = new DAOCLiente();
                return daoCliente.cambiaEstadoCliente(cliente);
            }
        }
    }
}
