<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMain.Master" AutoEventWireup="true" CodeBehind="ManageMerchant.aspx.cs" Inherits="WebApplication4.Admin.ManageMerchant" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="module">
							<div class="module-head">
								<h3>Forms</h3>
							</div>
							<div class="module-body">

									

									<div class="form-horizontal row-fluid">
										<div class="control-group">
											<label class="control-label" >Merchantname</label>
											<div class="controls">
                                                <asp:TextBox ID="txtMerchant" CssClass="span8" placeHolder="Enter Merchantname" runat="server"></asp:TextBox>
											
											</div>
										</div>


											 <div class="control-group">
											<label class="control-label" >Category </label>
											<div class="controls">

                                                <asp:DropDownList ID="ddlCategorytype" CssClass="span8" runat="server">
                                                  
                                                  
                                                    
                                                  
                                                </asp:DropDownList>
                                              
											
											</div>
										         <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="FileUpload2" ErrorMessage="Photo not support" ForeColor="Red" ValidationExpression="/.*\.(gif|jpe?g|bmp|png)$/igm">Photo not support</asp:RegularExpressionValidator>
										</div>
                                        <div class ="control-group">
                                            <label class ="control-label">Photo</label>
                                            <div class="controls">
                                                <asp:Image ID="Image1" CssClass="span8" runat="server" Height="140px" Width="176px" />
                                                <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="FileUpload2" ErrorMessage="Out of range" ForeColor="Red" MaximumValue="1000" MinimumValue="50 " Type="Integer">Out of range</asp:RangeValidator>
                                                <asp:FileUpload ID="FileUpload2" CssClass="span8" runat="server"  Height="22px" Width="620px" />


                                            </div>
                                               </div>

                                       
                                            
                      


                                                                     
                      
										<div class="control-group">
											<div class="controls">
                                                <asp:Button ID="btnSave" CssClass="btn btn-success" runat="server" OnClick="btnSave_Click" Text="Save" Width="142px" />
                                                <asp:Button ID="btnUpdate" CssClass="btn btn-warning" runat="server" OnClick="btnUpdate_Click" Text="Update" Width="122px" />
                                                <asp:Button ID="btnDelete" CssClass="btn btn-danger" OnClick="btnDelete_Click" runat="server" Text="Delete" Width="121px" />
                                        
                                                <asp:HiddenField ID="HiddenField1" runat="server" />
                                                <asp:HiddenField ID="HiddenField2" runat="server" />
                                            </div>

                                             &nbsp;&nbsp;&nbsp;

                                             <asp:Label ID="lblMessage" CssClass="btn btn-block" runat="server"></asp:Label>

                                            <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" Height="207px" Width="562px" AutoGenerateColumns="False" DataKeyNames="Merchantid" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                                                <AlternatingRowStyle BackColor="White" />
                                                <Columns>
                                                    <asp:CommandField ButtonType="Button" ShowSelectButton="True" />
                                                    <asp:TemplateField HeaderText="SN">
                                                        <ItemTemplate>
                                                            <%#Container.DataItemIndex+1 %>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    
                                                    <asp:TemplateField HeaderText="Categoryname">
                                                        <ItemTemplate>
                                                            <%#Eval("tblCategory1.Categoryname") %>
                                                        </ItemTemplate>

                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Merchantname">
                                                        <ItemTemplate>
                                                            <%#Eval("Merchantname") %>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Photo">
                                                        <ItemTemplate>
                                                            <asp:Image ID="Image2"  Height="50px" Width="50px" runat="server" ImageUrl='<%#"~/ProductImages/"+Eval("Photo") %>' />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                                <EditRowStyle BackColor="#7C6F57" />
                                                <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                                <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                                <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                                                <RowStyle BackColor="#E3EAEB" />
                                                <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                                                <SortedAscendingCellStyle BackColor="#F8FAFA" />
                                                <SortedAscendingHeaderStyle BackColor="#246B61" />
                                                <SortedDescendingCellStyle BackColor="#D4DFE1" />
                                                <SortedDescendingHeaderStyle BackColor="#15524A" />
                                            </asp:GridView>
                                            
                                           
										</div>
									</div>
							</div>
						</div>
</asp:Content>