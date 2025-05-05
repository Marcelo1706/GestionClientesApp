Imports System.Data
Imports System.Data.SqlClient
Imports GestionClientesApp
Public Class Clientes
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            If Session("UsuarioId") Is Nothing Then
                Response.Redirect("Login.aspx")
            End If
            CargarClientes()
        End If
    End Sub

    Sub CargarClientes()
        Using conn = Conexion.ObtenerConexion()
            conn.Open()
            Dim cmd = New SqlCommand("SELECT * FROM Clientes WHERE Activo = 1", conn)
            Dim da = New SqlDataAdapter(cmd)
            Dim dt = New DataTable()
            da.Fill(dt)
            gvClientes.DataSource = dt
            gvClientes.DataBind()
        End Using
    End Sub

    Protected Sub gvClientes_RowEditing(sender As Object, e As GridViewEditEventArgs)
        gvClientes.EditIndex = e.NewEditIndex
        CargarClientes()
    End Sub

    Protected Sub gvClientes_RowCancelingEdit(sender As Object, e As GridViewCancelEditEventArgs)
        gvClientes.EditIndex = -1
        CargarClientes()
    End Sub
    Sub RegistrarBitacora(clienteId As Integer, accion As String)
        Dim usuarioId = Convert.ToInt32(Session("UsuarioId"))
        Using conn = Conexion.ObtenerConexion()
            conn.Open()
            Dim cmd = New SqlCommand("INSERT INTO Bitacora (UsuarioId, ClienteId, Accion) VALUES (@u, @c, @a)", conn)
            cmd.Parameters.AddWithValue("@u", usuarioId)
            cmd.Parameters.AddWithValue("@c", clienteId)
            cmd.Parameters.AddWithValue("@a", accion)
            cmd.ExecuteNonQuery()
        End Using
    End Sub

    Protected Sub btnAgregar_Click(sender As Object, e As EventArgs)
        Using conn = Conexion.ObtenerConexion()
            conn.Open()
            Dim cmd = New SqlCommand("INSERT INTO Clientes (Nombre, Correo, Telefono, Direccion) VALUES (@n, @c, @t, @d); SELECT SCOPE_IDENTITY();", conn)
            cmd.Parameters.AddWithValue("@n", txtNombre.Text)
            cmd.Parameters.AddWithValue("@c", txtCorreo.Text)
            cmd.Parameters.AddWithValue("@t", txtTelefono.Text)
            cmd.Parameters.AddWithValue("@d", txtDireccion.Text)

            Dim idCliente = Convert.ToInt32(cmd.ExecuteScalar())
            RegistrarBitacora(idCliente, $"Agregar usuario con Nombre: {txtNombre.Text}")
        End Using
        CargarClientes()
    End Sub

    Protected Sub gvClientes_RowUpdating(sender As Object, e As GridViewUpdateEventArgs)
        Dim id = gvClientes.DataKeys(e.RowIndex).Value
        Dim fila = gvClientes.Rows(e.RowIndex)

        Dim nombre = CType(fila.FindControl("txtEditNombre"), TextBox).Text
        Dim correo = CType(fila.FindControl("txtEditCorreo"), TextBox).Text
        Dim telefono = CType(fila.FindControl("txtEditTelefono"), TextBox).Text
        Dim direccion = CType(fila.FindControl("txtEditDireccion"), TextBox).Text

        Using conn = Conexion.ObtenerConexion()
            conn.Open()
            Dim cmdOld = New SqlCommand("SELECT Nombre, Correo, Telefono, Direccion FROM Clientes WHERE Id=@id", conn)
            cmdOld.Parameters.AddWithValue("@id", id)
            Dim reader = cmdOld.ExecuteReader()
            reader.Read()
            Dim oldNombre = reader("Nombre").ToString()
            Dim oldCorreo = reader("Correo").ToString()
            Dim oldTelefono = reader("Telefono").ToString()
            Dim oldDireccion = reader("Direccion").ToString()
            reader.Close()

            Dim detalles = $"Nombre: {oldNombre} -> {nombre}, Correo: {oldCorreo} -> {correo}, Telefono: {oldTelefono} -> {telefono}, Direccion: {oldDireccion} -> {direccion}"

            Dim cmd = New SqlCommand("UPDATE Clientes SET Nombre=@n, Correo=@c, Telefono=@t, Direccion=@d WHERE Id=@id", conn)
            cmd.Parameters.AddWithValue("@n", nombre)
            cmd.Parameters.AddWithValue("@c", correo)
            cmd.Parameters.AddWithValue("@t", telefono)
            cmd.Parameters.AddWithValue("@d", direccion)
            cmd.Parameters.AddWithValue("@id", id)
            cmd.ExecuteNonQuery()
            RegistrarBitacora(id, $"Editar usuario, nuevos datos: {detalles}")
        End Using
        gvClientes.EditIndex = -1
        CargarClientes()
    End Sub

    Protected Sub gvClientes_RowDeleting(sender As Object, e As GridViewDeleteEventArgs)
        Dim id = gvClientes.DataKeys(e.RowIndex).Value
        Using conn = Conexion.ObtenerConexion()
            conn.Open()
            Dim cmdOld = New SqlCommand("SELECT Nombre FROM Clientes WHERE Id=@id", conn)
            cmdOld.Parameters.AddWithValue("@id", id)
            Dim nombre = cmdOld.ExecuteScalar().ToString()

            Dim cmdEliminar As New SqlCommand("UPDATE Clientes SET Activo = 0 WHERE Id = @Id", conn)
            cmdEliminar.Parameters.AddWithValue("@Id", id)
            cmdEliminar.ExecuteNonQuery()
            RegistrarBitacora(id, $"Eliminar usuario con Nombre: {nombre}")
        End Using
        CargarClientes()
    End Sub
End Class