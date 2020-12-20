<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Admin.Master" AutoEventWireup="true" CodeBehind="Music.aspx.cs" Inherits="Project_Website_Music_2.Admin.AddMusic" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../style/AdminStyle/Music.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <div class="header"></div>
    <div class="container pos-cen">

        <div class="menu-features">
            <ul style="list-style: none; display: inline-flex; float: left; margin: 10px 20px; text-align: center;">
                <li style="background: #72b1ff; display: block; padding: 15px 15px;" >
                    <asp:LinkButton ID="lib_Refesh" runat="server" CssClass="text-fea">
                        Refesh 
                        <img class="btn-fea" src="..\img\Admin\refesh.png" alt="Refesh" width="20px" />
                    </asp:LinkButton>
                    
                </li>
                <img src="..\img\Admin\split.gif" alt="Alternate Text" />
                <li style="background: #72b1ff; display: block; padding: 15px 15px;" >
                    <asp:LinkButton ID="lib_Add" runat="server" CssClass="text-fea" OnClick="lib_Add_Click">
                        Add new
                        <img class="btn-fea" src="..\img\Admin\add.png" alt="Add new" width="20px"/>
                    </asp:LinkButton>
                    
                </li>
                <img src="..\img\Admin\split.gif" alt="Alternate Text" />
                <li style="background: #72b1ff; display: block; padding: 15px 15px;" >
                    <asp:LinkButton ID="lib_Edit" runat="server" CssClass="text-fea" OnClick="lib_Edit_Click">
                        Edit
                        <img class="btn-fea" src="..\img\Admin\edit.png" alt="Edit" width="20px"/>
                    </asp:LinkButton>
                    
                </li>
                <img src="..\img\Admin\split.gif" alt="Alternate Text" />
                <li style=" background: #72b1ff; display: block; padding: 15px 15px;" >
                    <asp:LinkButton ID="lib_Del" runat="server" CssClass="text-fea" OnClick="lib_Del_Click">
                        Delete
                        <img class="btn-fea" src="..\img\Admin\delete1.png" alt="Delete" width="20px"/>
                    </asp:LinkButton>
                    
                </li>
            </ul>
        </div>
        <div class="TableSong">
            
            <asp:GridView ID="gv_ShowSong" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellPadding="3" Width="1500px" Height="450px" style="text-align: center" DataKeyNames="id" OnRowCancelingEdit="gv_ShowSong_RowCancelingEdit" OnRowEditing="gv_ShowSong_RowEditing" OnRowUpdating="gv_ShowSong_RowUpdating" CellSpacing="1" GridLines="None" OnRowDeleting="gv_ShowSong_RowDeleting" OnRowCommand="gv_ShowSong_RowCommand">
            <Columns>
                <asp:TemplateField>
                    <HeaderTemplate>
                        <asp:CheckBox ID="cb_DeleteHeader" runat="server" AutoPostBack="True" OnCheckedChanged="cb_DeleteHeader_CheckedChanged" Width="25px" />
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:CheckBox ID="cb_Delete" runat="server" Width="25px" AutoPostBack="True" OnCheckedChanged="cb_Delete_CheckedChanged" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="ID">
                    <EditItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("id") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("id") %>' Width="25px"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Thumbnail">
                    <EditItemTemplate>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DBSongConnectionString %>" SelectCommand="SELECT [ImgUrl] FROM [Song]"></asp:SqlDataSource>
                        <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("ImgUrl") %>' Width="100px" />
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("ImgUrl") %>' Width="100px" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Song Name" AccessibleHeaderText="songName">
                    <EditItemTemplate>
                        <asp:TextBox ID="txb_SongName" runat="server" Text='<%# Eval("Name") %>' Font-Size="14pt"></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("Name") %>' Font-Size="14pt"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Singer">
                    <EditItemTemplate>
                        <asp:DropDownList ID="ddl_Singer" runat="server" DataSourceID="idSinger" DataTextField="Name" DataValueField="id" Font-Size="14pt" AutoPostBack="True">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="idSinger" runat="server" ConnectionString="<%$ ConnectionStrings:DBSongConnectionString %>" SelectCommand="SELECT [id], [Name] FROM [Singer]"></asp:SqlDataSource>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:SqlDataSource ID="idSingerFooter" runat="server" ConnectionString="<%$ ConnectionStrings:DBSongConnectionString %>" SelectCommand="SELECT [id], [Name] FROM [Singer]"></asp:SqlDataSource>
                    </FooterTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Eval("SingerName") %>' Font-Size="14pt"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Author">
                    <EditItemTemplate>
                        <asp:DropDownList ID="ddl_Author" runat="server" DataSourceID="idAuthor" DataTextField="Name" DataValueField="id" Font-Size="14pt" AutoPostBack="True">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="idAuthor" runat="server" ConnectionString="<%$ ConnectionStrings:DBSongConnectionString %>" SelectCommand="SELECT [Name], [id] FROM [Author]"></asp:SqlDataSource>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:SqlDataSource ID="idAuthorFooter" runat="server" ConnectionString="<%$ ConnectionStrings:DBSongConnectionString %>" SelectCommand="SELECT [Name], [id] FROM [Author]"></asp:SqlDataSource>
                    </FooterTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Eval("AuthorName") %>' Font-Size="14pt"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Category">
                    <EditItemTemplate>
                        <asp:DropDownList ID="ddl_Category" runat="server" DataSourceID="idCategory" DataTextField="Name" DataValueField="id" Font-Size="14pt" AutoPostBack="True">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="idCategory" runat="server" ConnectionString="<%$ ConnectionStrings:DBSongConnectionString %>" SelectCommand="SELECT * FROM [Category]"></asp:SqlDataSource>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:SqlDataSource ID="idCategoryFooter" runat="server" ConnectionString="<%$ ConnectionStrings:DBSongConnectionString %>" SelectCommand="SELECT * FROM [Category]"></asp:SqlDataSource>
                    </FooterTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label5" runat="server" Text='<%# Eval("CategoryName") %>' Font-Size="14pt"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Duration">
                    <EditItemTemplate>
                        <asp:TextBox ID="txb_Duration" runat="server" Text='<%# Eval("Duration") %>' TextMode="Number" Font-Size="14pt"></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label6" runat="server" Text='<%# Eval("Duration") %>' Font-Names="14"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Date Publish" AccessibleHeaderText="datePub">
                    <EditItemTemplate>
                        <asp:TextBox ID="txb_DatePub" runat="server" Text='<%# Eval("Published1") %>' TextMode="Date" Font-Names="14"></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label7" runat="server" Text='<%# Eval("Published1") %>' Font-Names="14"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <EditItemTemplate>
                        <asp:ImageButton ID="ImageButton3" runat="server" CommandName="Update" ImageUrl="..\img\Admin\save.png" Width="25px" />
                        <asp:ImageButton ID="ImageButton4" runat="server" CommandName="Cancel" ImageUrl="..\img\Admin\cancel.png" Width="25px" />
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:ImageButton ID="ImageButton1" runat="server" CommandName="Edit" ImageUrl="..\img\Admin\edit.png" Width="25px" />
                        <asp:ImageButton ID="ImageButton2" runat="server" CommandName="Delete" ImageUrl="..\img\Admin\delete1.png" Width="25px" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <EmptyDataTemplate>
                No data<br />
            </EmptyDataTemplate>
            <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
            <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
            <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
            <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
            <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#594B9C" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#33276A" />
        </asp:GridView>

        </div>
    </div>
    
</asp:Content>