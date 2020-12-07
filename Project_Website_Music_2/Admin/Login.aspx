<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Project_Website_Music_2.Admin.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="../style/AdminStyle/Login.css" rel="stylesheet" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="head">
            <img src="../img/Admin/Logo_login.png" alt="log_logo" id="img_logo" style="background-color: #FFFFFF; border-radius:5px" width="100px" />
            <h1>Sign in to Admin Dashbroad</h1>
        </div>
        <div class="form-log">

            <asp:Label ID="lb_user" CssClass="lb" runat="server" Text="Username"></asp:Label>
            <asp:TextBox ID="txb_user" CssClass="txb" runat="server"></asp:TextBox>
            <div></div>
            <asp:Label ID="lb_pass" CssClass="lb" runat="server" Text="Password"></asp:Label>
            <asp:TextBox type="password" ID="txb_pass" CssClass="txb" runat="server"></asp:TextBox>
            <div>
                <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
            </div>
            <asp:Button ID="btn_log" runat="server" Text="Login" OnClick="btn_log_Click"/>
        </div>
    </form>
</body>
</html>
