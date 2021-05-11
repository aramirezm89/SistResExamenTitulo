<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="SistemaRestaurant.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
     <link type="text/css" rel="stylesheet" href="Content/bootstrap.min.css" />
    <script type="text/javascript" src="Scripts/bootstrap.min.js"></script>
    <script type="text/javascript" src="Scripts/jquery-3.0.0.min.js"></script>
    <link type="text/css" href="Content/misEstilos.css" rel="stylesheet" />
    <title>Loginrestaurant</title>
</head>
<body class="body-main">
   

    <div>
        <div class="modal-dialog text-center ">
            <div class="col-sm-12">
                <div class="modal-content">
                     <header>
                        <div class="container header">
                            <h1>Login</h1>
                        </div>
                     </header>
                    <div class="col-12">
                        <img src="Imagenes/personal-user-illustration-@2x.png" style="width:200px;margin-top:10px"  />
                    </div>
                    <form class="col-12" id="form1" runat="server">
                        <div class="container text-center">
                            <div class="form-group" style="margin-top: 15px">
                                <asp:Label ID="lblUser" runat="server" CssClass="label-user" Text="Usuario:"></asp:Label>
                                <asp:TextBox ID="txtUser" MaxLength="20" CssClass=" form-control-lg caja" placeholder="Ingrese nombre de usuario" runat="server"></asp:TextBox>
                            </div>

                            <div class="form-group">
                                <asp:Label ID="lblPass" runat="server" CssClass="label-pass" Text="Contraseña:"></asp:Label>
                                <asp:TextBox ID="txtPass" TextMode="Password" MaxLength="20" CssClass="form-control-lg caja " placeholder="Ingrese su contraseña" runat="server"></asp:TextBox>
                            </div>

                            <div style="margin-bottom: 25px">
                                <asp:Button ID="btnLogin" CssClass="btn btn-primary boton" OnClick="btnLogin_Click" runat="server" Text="Ingresar" />
                            </div>

                        </div>
                    </form>
                </div>
            </div>

        </div>

    </div>
</body>
</html>
