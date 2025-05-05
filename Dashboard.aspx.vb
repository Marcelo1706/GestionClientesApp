Public Class Dashboard
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            If Session("UsuarioId") Is Nothing Then
                Response.Redirect("Login.aspx")
            End If
        End If
    End Sub

End Class