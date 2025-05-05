Imports System.Security.Cryptography
Imports System.Text

Public Class Seguridad
    Public Shared Function HashPassword(password As String) As String
        Dim sha256 As SHA256 = SHA256.Create()
        Dim bytes As Byte() = sha256.ComputeHash(Encoding.UTF8.GetBytes(password))
        Return Convert.ToBase64String(bytes)
    End Function
End Class
