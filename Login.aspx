<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Login.aspx.vb" Inherits="GestionClientesApp.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Login - GestionClientesApp</title>
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <!-- Font Awesome for icons -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet" />
    <style>
        :root {
            --primary-color: #4e73df;
            --secondary-color: #f8f9fc;
        }
        
        body {
            background-color: var(--secondary-color);
            height: 100vh;
            display: flex;
            align-items: center;
        }
        
        .login-card {
            border: 0;
            border-radius: 1rem;
            box-shadow: 0 0.15rem 1.75rem 0 rgba(58, 59, 69, 0.15);
        }
        
        .login-card .card-body {
            padding: 2rem;
        }
        
        .login-card .form-control {
            padding: 1rem;
            border-radius: 0.35rem;
        }
        
        .btn-login {
            background-color: var(--primary-color);
            border: none;
            padding: 0.8rem;
            font-size: 1rem;
            border-radius: 0.35rem;
            letter-spacing: 0.05rem;
        }
        
        .btn-login:hover {
            background-color: #3a5ccc;
        }
        
        .form-floating label {
            padding: 1rem;
        }
        
        .text-primary {
            color: var(--primary-color) !important;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server" class="w-100">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-xl-5 col-lg-6 col-md-8 col-sm-10">
                    <div class="card login-card">
                        <div class="card-body p-4 p-sm-5">
                            <div class="text-center mb-4">
                                <i class="fas fa-user-circle fa-4x text-primary mb-3"></i>
                                <h3 class="mb-2">GestionClientesApp</h3>
                                <p class="text-muted">Ingrese sus credenciales para continuar</p>
                            </div>
                            
                            <div class="form-floating mb-3">
                                <asp:TextBox ID="txtUsuario" runat="server" CssClass="form-control" placeholder="Usuario" />
                                <label for="txtUsuario"><i class="fas fa-user me-1"></i> Usuario</label>
                            </div>
                            
                            <div class="form-floating mb-4">
                                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="form-control" placeholder="Contraseña" />
                                <label for="txtPassword"><i class="fas fa-lock me-1"></i> Contraseña</label>
                            </div>
                            
                            <asp:Button ID="btnLogin" runat="server" Text="Ingresar" OnClick="btnLogin_Click" 
                                CssClass="btn btn-login btn-block w-100 text-white fw-bold" />
                            
                            <div class="text-center mt-3">
                                <asp:Label ID="lblError" runat="server" ForeColor="Red" CssClass="d-block" />
                            </div>
                            
                            <hr class="my-4" />
                            
                            <div class="text-center">
                                <a href="#" class="small text-primary">¿Olvidó su contraseña?</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>

    <!-- Bootstrap 5 JS Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>