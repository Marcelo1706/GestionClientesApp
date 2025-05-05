<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Usuarios.aspx.vb" Inherits="Usuarios" MasterPageFile="~/Site.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container-fluid">
        <div class="row mb-4">
            <div class="col">
                <h2 class="text-primary"><i class="fas fa-users-cog me-2"></i>Gestión de Usuarios</h2>
            </div>
        </div>

        <!-- Add User Section -->
        <div class="row mb-4 justify-content-center">
            <div class="col-lg-6">
                <div class="card">
                    <div class="card-header">
                        <h5><i class="fas fa-user-plus me-2"></i>Agregar Nuevo Usuario</h5>
                    </div>
                    <div class="card-body">
                        <div class="form-group mb-3">
                            <asp:Label AssociatedControlID="txtNuevoUsuario" CssClass="form-label w-100" runat="server">Nombre de Usuario</asp:Label>
                            <asp:TextBox ID="txtNuevoUsuario" runat="server" CssClass="form-control w-100" placeholder="Nombre de usuario" />
                            <asp:RequiredFieldValidator ID="rfvUsuario" runat="server" ControlToValidate="txtNuevoUsuario" 
                                ErrorMessage="El nombre de usuario es obligatorio." CssClass="text-danger" Display="Dynamic" 
                                ValidationGroup="AgregarUsuario" />
                        </div>
                        <div class="form-group mb-3">
                            <asp:Label AssociatedControlID="txtNuevaClave" CssClass="form-label w-100" runat="server">Contraseña</asp:Label>
                            <asp:TextBox ID="txtNuevaClave" runat="server" CssClass="form-control w-100" TextMode="Password" placeholder="Contraseña" />
                            <asp:RequiredFieldValidator ID="rfvClave" runat="server" ControlToValidate="txtNuevaClave" 
                                ErrorMessage="La contraseña es obligatoria." CssClass="text-danger" Display="Dynamic" 
                                ValidationGroup="AgregarUsuario" />
                        </div>
                        <div class="form-group mb-3">
                            <asp:Label AssociatedControlID="txtConfirmarClave" CssClass="form-label w-100" runat="server">Confirmar Contraseña</asp:Label>
                            <asp:TextBox ID="txtConfirmarClave" runat="server" CssClass="form-control w-100" TextMode="Password" placeholder="Confirmar Contraseña" />
                            <asp:RequiredFieldValidator ID="rfvConfirmarClave" runat="server" ControlToValidate="txtConfirmarClave" 
                                ErrorMessage="Debe confirmar la contraseña." CssClass="text-danger" Display="Dynamic" 
                                ValidationGroup="AgregarUsuario" />
                            <asp:CompareValidator ID="cvClaves" runat="server" ControlToValidate="txtConfirmarClave" 
                                ControlToCompare="txtNuevaClave" ErrorMessage="Las contraseñas no coinciden." 
                                CssClass="text-danger" Display="Dynamic" ValidationGroup="AgregarUsuario" />
                        </div>
                        <div class="col-12">
                            <asp:Button ID="btnAgregarUsuario" runat="server" Text="Agregar Usuario" 
                                CssClass="btn btn-primary w-100" OnClick="btnAgregarUsuario_Click" 
                                ValidationGroup="AgregarUsuario" />
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Users GridView -->
        <div class="card">
            <div class="card-header">
                <h5 class="mb-0"><i class="fas fa-list me-2"></i>Usuarios Registrados</h5>
            </div>
            <div class="card-body">
                <div class="gridview-container">
                    <asp:GridView ID="gvusuarios" runat="server" CssClass="table table-hover table-striped" 
                        AutoGenerateColumns="False" GridLines="None">
                        <Columns>
                            <asp:BoundField DataField="Id" HeaderText="ID" ItemStyle-CssClass="fw-bold" />
                            <asp:BoundField DataField="NombreUsuario" HeaderText="Usuario" />
                            <asp:TemplateField HeaderText="Acciones">
                                <ItemTemplate>
                                    <asp:Button ID="btnEliminar" runat="server" Text="Eliminar" 
                                        CssClass="btn btn-danger btn-sm" 
                                        CommandArgument='<%# Eval("Id") %>' 
                                        OnClick="btnEliminar_Click"
                                        OnClientClick="return confirm('¿Está seguro que desea eliminar este usuario?');" />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <HeaderStyle CssClass="table-primary" />
                        <RowStyle CssClass="align-middle" />
                    </asp:GridView>
                </div>
            </div>
        </div>
    </div>
</asp:Content>