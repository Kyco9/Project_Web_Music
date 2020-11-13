<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Project_Website_Music_2.Admin.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Home</title>
    <link href="//fonts.googleapis.com/css?family=Poppins:400,500,600,700" rel="stylesheet">
    <link href="../style/AdminStyle/Home.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        
         <div class="wrapper">
            <input type="checkbox" id="btn" hidden>
            <label for="btn" class="menu-btn">
                <i class="fas fa-bars"></i>
                <i class="fas fa-times"></i>
            </label>
            <nav id="sidebar">
                <div class="title">
                    Side Menu</div>
                <ul class="list-items">
                    <li><a href="Home.aspx"><i class="fas fa-home"></i>Home</a></li>
                    <li><a href="AddMusic.aspx"><i class="fas fa-sliders-h"></i>Add Music</a></li>
                    <li><a href="ManageUsers.aspx"><i class="fas fa-address-book"></i>Manage Users</a></li>
                    
                </ul>
            </nav>
        </div>
        <div class="content">
            
        </div>

    </form>
</body>
</html>
