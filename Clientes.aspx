 
<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Clientes.aspx.vb" Inherits="Clientes" MasterPageFile="~/Site.Master" %>  
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">  
    <div class="container-fluid">  
        <div class="row mb-4">  
            <div class="col">  
                <h2 class="text-primary"><i class="fas fa-users me-2"></i>Gestión de Clientes</h2>  
            </div>  
        </div>  
            
        <!-- Add Client Section -->  
        <div class="row mb-4 justify-content-center">  
            <div class="col-lg-6">  
                <div class="card">  
                    <div class="card-header">  
                        <h5><i class="fas fa-user-plus me-2"></i>Agregar Nuevo Cliente</h5>  
                    </div>  
                    <div class="card-body">  
                        <div class="form-group mb-3">  
                            <asp:Label AssociatedControlID="txtNombre" CssClass="form-label w-100" runat="server">Nombre</asp:Label>  
                            <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control w-100" Placeholder="Nombre" />  
                            <asp:RequiredFieldValidator ID="rfvNombre" runat="server" ControlToValidate="txtNombre" ErrorMessage="El nombre es obligatorio." CssClass="text-danger" Display="Dynamic" ValidationGroup="AgregarCliente" />  
                        </div>  
                        <div class="form-group mb-3">  
                            <asp:Label AssociatedControlID="txtCorreo" CssClass="form-label w-100" runat="server">Correo Electrónico</asp:Label>  
                            <asp:TextBox ID="txtCorreo" runat="server" CssClass="form-control w-100" Placeholder="Correo" TextMode="Email" />  
                            <asp:RequiredFieldValidator ID="rfvCorreo" runat="server" ControlToValidate="txtCorreo" ErrorMessage="El correo es obligatorio." CssClass="text-danger" Display="Dynamic" ValidationGroup="AgregarCliente" />  
                        </div>  
                        <div class="form-group mb-3">  
                            <asp:Label AssociatedControlID="txtTelefono" CssClass="form-label w-100" runat="server">Teléfono</asp:Label>  
                            <asp:TextBox ID="txtTelefono" runat="server" CssClass="form-control w-100" Placeholder="Teléfono" />  
                            <asp:RequiredFieldValidator ID="rfvTelefono" runat="server" ControlToValidate="txtTelefono" ErrorMessage="El teléfono es obligatorio." CssClass="text-danger" Display="Dynamic" ValidationGroup="AgregarCliente" />  
                        </div>  
                        <div class="form-group mb-3">  
                            <asp:Label AssociatedControlID="txtDireccion" CssClass="form-label w-100" runat="server">Dirección</asp:Label>  
                            <asp:TextBox ID="txtDireccion" runat="server" CssClass="form-control w-100" Placeholder="Dirección" />  
                            <asp:RequiredFieldValidator ID="rfvDireccion" runat="server" ControlToValidate="txtDireccion" ErrorMessage="La dirección es obligatoria." CssClass="text-danger" Display="Dynamic" ValidationGroup="AgregarCliente" />  
                        </div>  
                        <div class="col-12">  
                            <asp:Button ID="btnAgregar" runat="server" Text="Agregar" CssClass="btn btn-primary w-100" OnClick="btnAgregar_Click" ValidationGroup="AgregarCliente" />  
                        </div>  
                    </div>  
                </div>  
            </div>  
        </div>  
            
        <!-- Clients GridView -->  
        <div class="card">  
            <div class="card-header">  
                <h5 class="mb-0"><i class="fas fa-list me-2"></i>Lista de Clientes</h5>  
            </div>  
            <div class="card-body">  
                <div class="gridview-container">  
                    <asp:GridView ID="gvClientes" runat="server" AutoGenerateColumns="False"  
                        DataKeyNames="Id" OnRowEditing="gvClientes_RowEditing"  
                        OnRowUpdating="gvClientes_RowUpdating" OnRowDeleting="gvClientes_RowDeleting"  
                        OnRowCancelingEdit="gvClientes_RowCancelingEdit"  
                        CssClass="table table-hover table-striped" GridLines="None">  
                        <Columns>  
                            <asp:TemplateField HeaderText="Nombre">  
                                <ItemTemplate>  
                                    <%# Eval("Nombre") %>  
                                </ItemTemplate>  
                                <EditItemTemplate>  
                                    <asp:TextBox ID="txtEditNombre" runat="server" CssClass="form-control" Text='<%# Bind("Nombre") %>' />  
                                    <asp:RequiredFieldValidator ID="rfvEditNombre" runat="server" ControlToValidate="txtEditNombre" ErrorMessage="El nombre es obligatorio." CssClass="text-danger" Display="Dynamic" ValidationGroup="EditarCliente" />  
                                </EditItemTemplate>  
                            </asp:TemplateField>  
                            <asp:TemplateField HeaderText="Correo">  
                                <ItemTemplate>  
                                    <%# Eval("Correo") %>  
                                </ItemTemplate>  
                                <EditItemTemplate>  
                                    <asp:TextBox ID="txtEditCorreo" runat="server" CssClass="form-control" Text='<%# Bind("Correo") %>' TextMode="Email" />  
                                    <asp:RequiredFieldValidator ID="rfvEditCorreo" runat="server" ControlToValidate="txtEditCorreo" ErrorMessage="El correo es obligatorio." CssClass="text-danger" Display="Dynamic" ValidationGroup="EditarCliente" />  
                                </EditItemTemplate>  
                            </asp:TemplateField>  
                            <asp:TemplateField HeaderText="Teléfono">  
                                <ItemTemplate>  
                                    <%# Eval("Telefono") %>  
                                </ItemTemplate>  
                                <EditItemTemplate>  
                                    <asp:TextBox ID="txtEditTelefono" runat="server" CssClass="form-control" Text='<%# Bind("Telefono") %>' />  
                                    <asp:RequiredFieldValidator ID="rfvEditTelefono" runat="server" ControlToValidate="txtEditTelefono" ErrorMessage="El teléfono es obligatorio." CssClass="text-danger" Display="Dynamic" ValidationGroup="EditarCliente" />  
                                </EditItemTemplate>  
                            </asp:TemplateField>  
                            <asp:TemplateField HeaderText="Dirección">  
                                <ItemTemplate>  
                                    <%# Eval("Direccion") %>  
                                </ItemTemplate>  
                                <EditItemTemplate>  
                                    <asp:TextBox ID="txtEditDireccion" runat="server" CssClass="form-control" Text='<%# Bind("Direccion") %>' />  
                                    <asp:RequiredFieldValidator ID="rfvEditDireccion" runat="server" ControlToValidate="txtEditDireccion" ErrorMessage="La dirección es obligatoria." CssClass="text-danger" Display="Dynamic" ValidationGroup="EditarCliente" />  
                                </EditItemTemplate>  
                            </asp:TemplateField>  
                            <asp:CommandField ShowEditButton="True" ShowDeleteButton="True"   
                                ControlStyle-CssClass="btn btn-sm btn-outline-primary"   
                                EditText='<i class="fas fa-edit"></i>'   
                                UpdateText='<i class="fas fa-check"></i>'   
                                CancelText='<i class="fas fa-times"></i>'   
                                DeleteText='<i class="fas fa-trash"></i>'   
                                ButtonType="Link" ValidationGroup="EditarCliente" />  
                        </Columns>  
                        <HeaderStyle CssClass="table-primary" />  
                        <RowStyle CssClass="align-middle" />  
                        <EditRowStyle CssClass="bg-light" />  
                    </asp:GridView>  
                </div>  
            </div>  
        </div>  
    </div>  
</asp:Content>  