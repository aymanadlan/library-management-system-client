using System;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace library_management_system_client
{
    public partial class Demo : System.Web.UI.Page
    {
        protected void Page_PreRender(object sender, EventArgs e)
        {
            try
            {
                PopulateGridView();
            }
            catch (Exception)
            {
                RadLabelError.Visible = true;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
        }
        protected void RgBook_ItemCommand(object sender, GridCommandEventArgs e)
        {
            GridDataItem gdItem ;

            switch (e.CommandName)
            {
                case "Edit":
                    _ = (GridDataItem)e.Item;
                    break;
                case "Delete":
                    gdItem = (GridDataItem)e.Item;
                    DeleteBook(gdItem);
                    break;
            }
        }
        protected void SaveInsert_Click(object sender, EventArgs e)
        {
            try
            {
                Helper.Add(txtName.Text, txtDescription.Text, txtPrice.Text);

                divInsert.Visible = false;
                Addbtn.Visible = true;

                PopulateGridView();
            }
            catch (Exception)
            {
                RadLabelError.Visible = true;
            }
        }
        protected void CancelInsert_Click(object sender, EventArgs e)
        {
            divInsert.Visible = false;
            Addbtn.Visible = true;
        }
        protected void RadGrid1_UpdateCommand(object source, GridCommandEventArgs e)
        {
            //Get the GridEditableItem of the RadGrid 
            GridEditableItem editedItem = e.Item as GridEditableItem;
            //Get the primary key value using the DataKeyValue. 
            int Id = Convert.ToInt32(editedItem.OwnerTableView.DataKeyValues[editedItem.ItemIndex]["ID"]);

            //Access the textbox from the edit form template and store the values in string variables. 
            string UpdatedName = (editedItem.FindControl("txtUpdateName") as TextBox).Text;
            string UpdatedDescription = (editedItem.FindControl("txtUpdateDescription") as TextBox).Text;
            string UpdatedPrice = (editedItem.FindControl("txtUpdatedPrice") as TextBox).Text;


            Helper.Update(Id, UpdatedName, UpdatedDescription, UpdatedPrice);
        }
        protected void AddBook_Click(object sender, EventArgs e)
        {
            divInsert.Visible = true;
            Addbtn.Visible = false;
        }
        private void DeleteBook(GridDataItem gdItem)
        {
            try
            {
                var id = Convert.ToInt32(gdItem.OwnerTableView.DataKeyValues[gdItem.ItemIndex]["ID"]);
                Helper.Delete(id);
            }
            catch (Exception)
            {
                RadLabelError.Visible = true;
            }
        }
        private void PopulateGridView()
        {
            var books = Helper.Populate();

            RadGridBooks.DataSource = books;
            RadGridBooks.DataBind();
        }
    }
}