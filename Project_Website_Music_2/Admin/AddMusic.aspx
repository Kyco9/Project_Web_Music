<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Admin.Master" AutoEventWireup="true" CodeBehind="AddMusic.aspx.cs" Inherits="Project_Website_Music_2.Admin.AddMusic" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../style/AdminStyle/AddMusic.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <div class="header pos-cen">header<br />
        <br />
    </div>
    <div class="container pos-cen">
        <p class="lb-title">Name of the song:<asp:TextBox ID="txb_song_name" CssClass="" runat="server"></asp:TextBox>

        </p>

        <p class="lb-title">Category:<asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="category" DataValueField="category">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Test_ASPConnectionString %>" SelectCommand="SELECT [category] FROM [Table_3]"></asp:SqlDataSource>
        </p>

        <p class="lb-title">Artis:<asp:TextBox ID="txb_artis" CssClass="" runat="server"></asp:TextBox>

        </p>

        <p class="lb-title">Date Published:</p>
        <asp:Calendar ID="Calendar_DatePublished" runat="server" BackColor="White" BorderColor="Black" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" Height="100px" NextPrevFormat="ShortMonth" SelectionMode="DayWeekMonth" ShowTitle="False" Width="200px">
            <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" />
            <NextPrevStyle VerticalAlign="Bottom" />
            <OtherMonthDayStyle ForeColor="#808080" />
            <SelectedDayStyle BackColor="#666666" Font-Bold="True" ForeColor="White" />
            <SelectorStyle BackColor="#CCCCCC" />
            <TitleStyle BackColor="#999999" BorderColor="Black" Font-Bold="True" />
            <TodayDayStyle BackColor="#CCCCCC" ForeColor="Black" />
            <WeekendDayStyle BackColor="#FFFFCC" />
        </asp:Calendar>

        <asp:Button ID="btn_AddMuic" runat="server" Text="Add Music" OnClick="btn_AddMuic_Click" />

        <asp:Button ID="btn_Delete" runat="server" Text="Delete Music" OnClick="btn_Delete_Click" />
        
        
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2">
            <Columns>
                <asp:BoundField DataField="song_name" HeaderText="song_name" SortExpression="song_name" />
                <asp:BoundField DataField="artis" HeaderText="artis" SortExpression="artis" />
                <asp:BoundField DataField="catetory" HeaderText="catetory" SortExpression="catetory" />
                <asp:BoundField DataField="nxb" HeaderText="nxb" SortExpression="nxb" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Test_ASPConnectionString %>" SelectCommand="SELECT * FROM [Table_2]"></asp:SqlDataSource>
        
        
    </div>

</asp:Content>