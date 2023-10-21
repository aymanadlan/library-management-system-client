<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Demo.aspx.cs" Inherits="library_management_system_client.Demo" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>


<form runat="server">
    <asp:ScriptManager ID="SM" runat="server"></asp:ScriptManager>

    <telerik:RadLabel ID="RadLabelError" runat="server" ForeColor="DarkRed" Visible="false">Sorry, something went wrong!</telerik:RadLabel>

    <telerik:RadGrid ID="RadGridBooks" runat="server" AllowPaging="True" AllowSorting="true" AllowFilteringByColumn="true"
        OnUpdateCommand="RadGrid1_UpdateCommand"
        EnableAJAX="True"
        OnItemCommand="rgBook_ItemCommand" AllowAutomaticInserts="True">

        <MasterTableView AutoGenerateColumns="False" DataKeyNames="ID">
            <Columns>
                <telerik:GridBoundColumn DataField="ID" DataType="System.Int32" HeaderText="ID" ReadOnly="True" UniqueName="ID">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Name" FilterControlAltText="Filter Name column" SortExpression="Name" HeaderText="Book Name" UniqueName="Name">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Description" FilterControlAltText="Filter Description column" SortExpression="Description" HeaderText="Description" UniqueName="Description">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Price" DataType="System.Int64" FilterControlAltText="Filter Price column" SortExpression="Price" HeaderText="Price" UniqueName="Price">
                </telerik:GridBoundColumn>
                <telerik:GridEditCommandColumn EditText="Edit" />
                <telerik:GridButtonColumn UniqueName="DeleteColumn" CommandName="Delete" Text="Delete" />
            </Columns>

            <%--**--%>
            <EditFormSettings EditFormType="Template">
                <EditColumn UniqueName="EditCommandColumn1">
                </EditColumn>
                <FormTemplate>
                    <table id="Table2" cellspacing="2" cellpadding="1" width="250" border="1" rules="none"
                        style="border-collapse: collapse">
                        <tr>
                            <td>
                                <table id="Table3" cellspacing="1" cellpadding="1" width="250" border="0">
                                    <tr>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td>CustomerID:</td>
                                        <td>
                                            <asp:TextBox ID="txtCustomerID" MaxLength="5" Visible='<% # (Container as GridItem).OwnerTableView.IsItemInserted %>' runat="server">
                                            </asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>CompanyName:</td>
                                        <td>
                                            <asp:TextBox ID="txtUpdateName" runat="server" Text='<%# Eval( "Name" ) %>'>
                                            </asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Description:</td>
                                        <td>
                                            <asp:TextBox ID="txtUpdateDescription" runat="server" Text='<%# Eval( "Description" ) %>'>
                                            </asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Price:</td>
                                        <td>
                                            <asp:TextBox ID="txtUpdatedPrice" runat="server" Text='<%# Eval( "Price" ) %>'>
                                            </asp:TextBox>
                                        </td>
                                    </tr>
                                </table>
                            </td>

                        </tr>
                        <tr>
                            <td align="right" colspan="2">
                                <telerik:RadButton ID="btnUpdate" Text='<%# (Container as GridItem).OwnerTableView.IsItemInserted ? "Insert" : "Update" %>'
                                    runat="server" CommandName='<%# (Container as GridItem).OwnerTableView.IsItemInserted ? "PerformInsert" : "Update" %>'></telerik:RadButton>

                                &nbsp; 
                                <telerik:RadButton ID="btnCancel" Text="Cancel" runat="server" CausesValidation="False"
                                    CommandName="Cancel"></telerik:RadButton>
                            </td>
                            <td align="right" colspan="2"></td>
                        </tr>
                    </table>
                </FormTemplate>
            </EditFormSettings>
            <%--**--%>
        </MasterTableView>
    </telerik:RadGrid>

    <telerik:RadButton ID="Addbtn" runat="server" Text="Add Book" OnClick="AddBook_Click" Height="30px" Width="200px"></telerik:RadButton>

    <div id="divInsert" runat="server" visible="false">
        <table>
            <thead>
                <tr style="display: none;">
                    <th scope="col"></th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>
                        <telerik:RadLabel ID="RadLabelName" runat="server">Book Name:</telerik:RadLabel>
                    </td>
                    <td>
                        <telerik:RadTextBox ID="txtName" runat="server"></telerik:RadTextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <telerik:RadLabel ID="RadLabelDescription" runat="server">Book Name:</telerik:RadLabel>
                    </td>
                    <td>
                        <telerik:RadTextBox ID="txtDescription" runat="server"></telerik:RadTextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <telerik:RadLabel ID="RadLabelPrice" runat="server">Price:</telerik:RadLabel>
                    </td>
                    <td>
                        <telerik:RadTextBox ID="txtPrice" runat="server"></telerik:RadTextBox>
                    </td>
                </tr>
                <tr>
                    <td colspan="1">
                        <telerik:RadPushButton ID="RadPushButtonSave" runat="server" Text="Save" OnClick="SaveInsert_Click"></telerik:RadPushButton>
                        <telerik:RadPushButton ID="RadPushButtonCancel" runat="server" Text="Cancel" OnClick="CancelInsert_Click"></telerik:RadPushButton>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>

</form>