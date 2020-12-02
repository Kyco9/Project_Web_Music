<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Admin.Master" AutoEventWireup="true" CodeBehind="Music.aspx.cs" Inherits="Project_Website_Music_2.Admin.AddMusic" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../style/AdminStyle/AddMusic.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <div class="header"></div>
    <div class="container pos-cen">
        <p class="lb-title">Name of the song:

        </p>
        <asp:TextBox ID="txbSongName" CssClass="txb" runat="server"></asp:TextBox>

        <p class="lb-title">Singer:</p>
        <asp:DropDownList ID="dropdlSinger" CssClass="txb" runat="server" DataSourceID="Singer" DataTextField="Name" DataValueField="id"></asp:DropDownList>

        <asp:SqlDataSource ID="Singer" runat="server" ConnectionString="<%$ ConnectionStrings:DBSongConnectionString %>" SelectCommand="SELECT [Name], [id] FROM [Singer]"></asp:SqlDataSource>

        <p class="lb-title">Duration:

        </p>
        <asp:TextBox ID="txbDuration" CssClass="txb" runat="server" TextMode="Number"></asp:TextBox>

        <p class="lb-title">Date Published:</p>
        <asp:TextBox ID="txb_date" CssClass="txb" runat="server" TextMode="Date"></asp:TextBox>

        <p class="lb-title">Author:</p>
        <asp:DropDownList ID="dropdlAuthor" CssClass="txb" runat="server" DataSourceID="Author" DataTextField="Name" DataValueField="id"></asp:DropDownList>

        <asp:SqlDataSource ID="Author" runat="server" ConnectionString="<%$ ConnectionStrings:DBSongConnectionString %>" SelectCommand="SELECT [Name], [id] FROM [Author]"></asp:SqlDataSource>

        <p class="lb-title">Category:
            
        </p>
        <asp:DropDownList ID="dropdlCategory" CssClass="txb" runat="server" DataSourceID="Category" DataTextField="Name" DataValueField="id">
            </asp:DropDownList>

        <asp:SqlDataSource ID="Category" runat="server" ConnectionString="<%$ ConnectionStrings:DBSongConnectionString %>" SelectCommand="SELECT * FROM [Category]"></asp:SqlDataSource>

        <p></p>
        <asp:Button ID="btn_AddMuic" CssClass="btn btn-Add" runat="server" Text="Add Music" OnClick="btn_AddMuic_Click" />

        
        
        <br />
        <br />
        <br />


        <p class="lb-title">Delete music name:</p>
        <asp:TextBox ID="txb_delete" CssClass="txb" runat="server"></asp:TextBox>
        

        <br />
        

        <asp:Button ID="btn_Delete" CssClass="btn btn-Delete" runat="server" Text="Delete Music" OnClick="btn_Delete_Click" />
        
        
        <br />
        <br />
        
        
        <asp:Label ID="Label1" runat="server" Text="" ForeColor="Red"></asp:Label>
        
        

        <br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="Song Name" HeaderText="Song Name" SortExpression="Song Name" />
                <asp:BoundField DataField="Author" HeaderText="Author" SortExpression="Author" />
                <asp:BoundField DataField="Singer" HeaderText="Singer" SortExpression="Singer" />
                <asp:BoundField DataField="Duration" HeaderText="Duration" SortExpression="Duration" />
                <asp:BoundField DataField="Published" HeaderText="Published" SortExpression="Published" />
                <asp:BoundField DataField="Category" HeaderText="Category" SortExpression="Category" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DBSongConnectionString %>" SelectCommand="SELECT s.Name AS 'Song Name', a.Name AS 'Author', si.Name AS 'Singer', s.Duration, s.Published, c.Name AS 'Category' FROM Song AS s INNER JOIN Author AS a ON s.idAuthor = a.id INNER JOIN Category AS c ON s.idCategory = c.id INNER JOIN Singer AS si ON s.idSinger = si.id"></asp:SqlDataSource>

    </div>
    
</asp:Content>