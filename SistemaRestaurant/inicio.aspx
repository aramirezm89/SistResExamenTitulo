<%@ Page Title="" Language="C#" MasterPageFile="~/home.Master" AutoEventWireup="true" CodeBehind="inicio.aspx.cs" Inherits="SistemaRestaurant.inicio" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <header>
            <div class="container header">
                <h1 style="text-align: center; margin-top: 20px">Ingrese Cliente</h1>
                <small>Completa los siguientes datos si es que deseas crear un nuevo cliente, una vez creado presiona el boton actualizar</small>
            </div>
        </header>

        <div class="row" style="margin-top: 40px">
            <div class="col">
                <asp:TextBox ID="txtNombre" MaxLength="50"  CssClass="form-control" placeholder="Nombre Cliente" runat="server"></asp:TextBox>
            </div>

            <div class="col">
                <asp:TextBox ID="txtApellido1" MaxLength="50" CssClass="form-control" placeholder="Apellido Paterno" runat="server"></asp:TextBox>
            </div>

            <div class="col">
                <asp:TextBox ID="txtApellido2" MaxLength="50" CssClass="form-control" placeholder="Apellido Materno" runat="server"></asp:TextBox>
            </div>

        </div>

        <div class="row" style="margin-top: 10px">
            <div class="col">
                <asp:TextBox ID="txtRut" MaxLength="10" CssClass="form-control" placeholder="Rut Cliente" runat="server"></asp:TextBox>
            </div>
            <div class="col">
                <asp:DropDownList ID="dpEstado" CssClass="form-control" runat="server">
                    <asp:ListItem>Nuevo</asp:ListItem>
                    <asp:ListItem>Frecuente</asp:ListItem>
                </asp:DropDownList>
            </div>
        </div>

        <div class="row">
            <div class="col">
                <asp:Button ID="btnRegistraCLi" OnClick="btnRegistraCLi_Click" Style="margin-top: 10px" CssClass="btn btn-primary" runat="server" Text="Guardar Cliente" />
                <asp:Button ID="btnActualizar" OnClick="btnActualizar_Click" Style="margin-top: 10px" CssClass="btn btn-primary" runat="server" Text="Actualizar" />
            </div>

        </div>

    </div>



    <div class="container">
        <header>
            <div class="container header">
                <h1 style="text-align: center; margin-top: 20px">Ingresa Pedido</h1>
                <small>Completa los siguientes datos si deseas crear un nuevo numero de pedido, una vez creado presiona el boton actualizar</small>
            </div>
        </header>

        <div class="row">

            <div class="col">
               <label for="dpCli">Cliente</label>
                <asp:DropDownList ID="dpCli" CssClass="form-control" runat="server"></asp:DropDownList>
            </div>

            <div class="col">
              <label for="txtFecha">Fecha</label>
                 <asp:TextBox ID="txtFecha" TextMode="Date"  CssClass="form-control" runat="server"></asp:TextBox>
            </div>
        </div>

        <asp:Button ID="btnPedido" OnClick="btnPedido_Click" Style="margin-top: 10px" CssClass="btn btn-primary" runat="server" Text="Guardar Pedido" />
        <asp:Button ID="btnActPedido" OnClick="btnActPedido_Click"  Style="margin-top: 10px" CssClass="btn btn-primary" runat="server" Text="Actualizar" />
    </div>



    <div class="container">

        <header>
            <div class="container header">
                <h1 style="text-align: center; margin-top: 20px">Ingresa detalle del pedido</h1>
                  <small>Completa estos datos para agregar los platos correspondientes a tu pedido</small>
            </div>
        </header>

      

        <div class="row" style="margin-top: 15px">

            <div class="col">
                <label for="dpNumeroPedido">Numero Pedido</label>
                <asp:DropDownList ID="dpNumeroPedido" CssClass="form-control" runat="server"></asp:DropDownList>
            </div>

            <div class="col">
                <label for="dpCodigoPro">Codigo Producto</label>
                <asp:DropDownList ID="dpCodigoPro" OnSelectedIndexChanged="dpCodigoPro_SelectedIndexChanged" AutoPostBack="true" CssClass="form-control" runat="server"></asp:DropDownList>
            </div>
        </div>

        <div class="row" style="margin-top: 10px">

            <div class="col">
                <label for="txtDescripcion">Descripcion del producto</label>
                <asp:TextBox ID="txtDescripcion" CssClass="form-control" ReadOnly="true" runat="server"></asp:TextBox>
            </div>

            <div class="col">
                <label for="txtPrecio">Precio Unitario</label>
                <asp:TextBox ID="txtPrecio" CssClass="form-control" ReadOnly="true" runat="server"></asp:TextBox>
            </div>
        </div>

        <div class="row" style="margin-top: 10px">

            <div class="col">
                <label for="txtCantidad">Cantidad </label>
                <asp:TextBox MaxLength="2" TextMode="Number" ID="txtCantidad" CssClass="form-control" runat="server"></asp:TextBox>
            </div>

            <div class="col">
                <label for="txtTotal">Precio Total</label>
                <asp:TextBox ID="txtTotal" CssClass="form-control" ReadOnly="true" runat="server"></asp:TextBox>
            </div>
        </div>
         <div class="row" style="margin-top:30px">
            <div class="col">
                 <asp:GridView ID="gridDetalle" RowStyle-Wrap="false" CssClass="table table-striped table-bordered table-sm  text-center"  runat="server"></asp:GridView>
            </div>
        </div>
        <div class="row" style="margin-top:20px; margin-bottom:20px"">
              <div class="col" style="align-content:center">
                 <label for="txtTotalCompra">Total de la Compra:</label>
                  <asp:TextBox ID="txtTotalCompra" runat="server" ReadOnly="true" Style="margin-left:5px"></asp:TextBox>
             </div>
        </div>
         <asp:Button ID="btnRegistraDetalle" OnClick="btnRegistraDetalle_Click"  Style="width:100%;margin-top: 10px; margin-bottom:20px " CssClass="btn btn-primary" runat="server" Text="Guardar Detalle" />
    </div>


</asp:Content>
