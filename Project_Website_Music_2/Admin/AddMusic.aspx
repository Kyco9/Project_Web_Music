<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Admin.Master" AutoEventWireup="true" CodeBehind="AddMusic.aspx.cs" Inherits="Project_Website_Music_2.Admin.AddMusic" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../style/AdminStyle/AddMusic.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <div class="header"></div>
    <div class="container pos-cen">
        <p class="lb-title">Name of the song:

        </p>
        <asp:TextBox ID="txb_song_name" CssClass="txb" runat="server"></asp:TextBox>

        <p class="lb-title">Category:
            
        </p>
        <asp:DropDownList ID="DropDownList1" CssClass="txb" runat="server" DataSourceID="SqlDataSource1" DataTextField="category" DataValueField="category">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Test_ASPConnectionString2 %>" SelectCommand="SELECT [category] FROM [Table_3]"></asp:SqlDataSource>

        <p class="lb-title">Artis:
            
        </p>
        <asp:TextBox ID="txb_artis"  CssClass="txb" runat="server"></asp:TextBox>

        <p class="lb-title">Date Published:
            
        </p>
        <asp:TextBox ID="txb_date" CssClass="txb" runat="server" TextMode="Date"></asp:TextBox>
        <p></p>
        <asp:Button ID="btn_AddMuic" CssClass="btn btn-Add" runat="server" Text="Add Music" OnClick="btn_AddMuic_Click" />

        
        
        <br />
        <p class="lb-title">Delete music name:</p>
        <asp:TextBox ID="txb_delete" CssClass="txb" runat="server"></asp:TextBox>
        

        <br />
        

        <asp:Button ID="btn_Delete" CssClass="btn btn-Delete" runat="server" Text="Delete Music" OnClick="btn_Delete_Click" />
        
        
        <br />
        <br />
        
        
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" Height="214px" Width="516px">
            <Columns>
                <asp:BoundField DataField="song_name" HeaderText="song_name" SortExpression="song_name" />
                <asp:BoundField DataField="artis" HeaderText="artis" SortExpression="artis" />
                <asp:BoundField DataField="catetory" HeaderText="catetory" SortExpression="catetory" />
                <asp:BoundField DataField="nxb" HeaderText="nxb" SortExpression="nxb" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Test_ASPConnectionString2 %>" SelectCommand="SELECT * FROM [Table_2]"></asp:SqlDataSource>
        
        
        <asp:Label ID="Label1" runat="server" Text="" ForeColor="Red"></asp:Label>
        
        
    </div>

</asp:Content>