<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Project_Website_Music_2.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
    <link href="//fonts.googleapis.com/css?family=Poppins:400,500,600,700" rel="stylesheet">
    <link href="style/login.css" rel="stylesheet" />
</head>
<body>
    
        <form id="form1" runat="server">
    
        <div class="content">
            <div class="header">
                <div class="logo">
                    <a href=""><img src="img/Logo.jpg" alt="Logo should be here" /></a>
                </div>
            </div>
            <div class="container">
                <h1>Sign in to continue</h1>
                <div class="form-login">
                    <p id="label-username">Email or username</p> 
                    <%--<input id="txb-username" class="inputt" type="text" />--%>
                    <asp:TextBox ID="txb_username" CssClass="inputt" runat="server"></asp:TextBox>
                    <div></div>
                    <p id="fg-pass"><a href="#">Forgot password?</a></p>
                    <p id="lb-pass">Password</p>
                    <%--<input id="txb-password" class="inputt" type="password" />--%>
                    <asp:TextBox  type="password" ID="txb_password" CssClass="inputt" runat="server"></asp:TextBox>
                    <div class="submit-btn">
                        <asp:Button ID="Button1" class="btn-log" runat="server" Text="Submit" OnClick="Login_Click" />
                        
                    </div>
                
                    <h4>------------OR------------</h4>

                    <%--<div><input type="button" id="btn-fb" class="btn-log" value="Sign in with Facebook" /></div>

                    <div><input type="button" id="btn-gg" class="btn-log" value="Sign in with Google" /></div>--%>
                    <asp:Button ID="btn_fb" runat="server" Text="Sign in with Facebook" CssClass="btn-log" />
                    <div></div>
                    <asp:Button ID="btn_gg" runat="server" Text="Sign in with Google" CssClass="btn-log" />
                    <div class="sign-up-link">
                        <p class="sign-up-link">Don't have an account? <a href="#">Sign up</a></p>
                    </div>
                </div>
                
            </div>
            <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
        </div>
   
            
   
        </form>
   
</body>
</html>
