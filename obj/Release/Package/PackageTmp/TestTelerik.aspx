<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TestTelerik.aspx.cs" Inherits="library_management_system_client.TestTelerik" %>


<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>


<form runat="server">
<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
<telerik:RadGrid ID="RadGrid1" runat="server" AllowPaging="True" AllowSorting="true" AllowFilteringByColumn="true" OnNeedDataSource="RadGrid1_NeedDataSource">
    <MasterTableView AutoGenerateColumns="False" DataKeyNames="ID">
        <Columns>
            <telerik:GridBoundColumn DataField="ID" DataType="System.Int32" HeaderText="OrderID" ReadOnly="True" UniqueName="ID">
            </telerik:GridBoundColumn>
            <telerik:GridBoundColumn DataField="Name" FilterControlAltText="Filter Name column" SortExpression="Name" HeaderText="Employee Name" UniqueName="Name">
            </telerik:GridBoundColumn>
            <telerik:GridBoundColumn DataField="Team" FilterControlAltText="Filter Team column" SortExpression="Team" HeaderText="Team" UniqueName="Team">
            </telerik:GridBoundColumn>
            <telerik:GridDateTimeColumn DataField="HireDate" DataType="System.DateTime" FilterControlAltText="Filter HireDate column" SortExpression="HireDate" HeaderText="Hire Date" UniqueName="HireDate">
            </telerik:GridDateTimeColumn>
        </Columns>
    </MasterTableView>
</telerik:RadGrid>
</form>