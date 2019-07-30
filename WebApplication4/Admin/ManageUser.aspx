<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMain.Master" AutoEventWireup="true" CodeBehind="ManageUser.aspx.cs" Inherits="WebApplication4.Admin.ManageUser" %>
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
											<label class="control-label" >Username</label>
											<div class="controls">
                                                <asp:TextBox ID="txtUsername" CssClass="span8" placeHolder="Enter Username" runat="server"></asp:TextBox>
											
											</div>
										    <asp:RequiredFieldValidator ID="Required" runat="server" ControlToValidate="txtUsername" ErrorMessage="RequiredFieldValidator" ForeColor="Red">Required</asp:RequiredFieldValidator>
										</div>

										<div class="control-group" aria-valuemax="10" aria-valuemin="6">
											<label class="control-label" >Password</label>
											<div class="controls">
                                                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"  placeHolder=" Enter Password"></asp:TextBox>
                                 
											
											</div>
										    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtPassword" ControlToValidate="txtRetypePassword" ErrorMessage="Password not same" ForeColor="Red">Password not same</asp:CompareValidator>
										    
										   
										    <asp:CustomValidator ID="PasswordLengthValidator" runat="server"   ControlToValidate="txtPassword" ErrorMessage="minm length is 6" ForeColor="Red">minm length is 6</asp:CustomValidator>
										    
										   
										</div>
                                        <div class="control-group">
											<label class="control-label" >Retype Password</label>
											<div class="controls">
                                                <asp:TextBox ID="txtRetypePassword" TextMode="Password" CssClass="span8"  placeHolder="Re Enter Password"  runat="server"></asp:TextBox>
                                             
											
											</div>
										    <asp:CustomValidator ID="PasswordnameValidator" runat="server" ControlToValidate="txtPassword" ErrorMessage="Minimum length is 8" ForeColor="Red" OnServerValidate="CustomValidator1_ServerValidate1">Minimum length is 8</asp:CustomValidator>
										</div>

										 <div class="control-group">
											<label class="control-label" >Usertype </label>
											<div class="controls">

                                                <asp:DropDownList ID="ddlUsertype" CssClass="span8" runat="server">
                                                    <asp:ListItem>Choose Roles</asp:ListItem>
                                                    <asp:ListItem>Admin</asp:ListItem>
                                                    <asp:ListItem>User</asp:ListItem>
                                                </asp:DropDownList>
                                              
											
											</div>
										</div>

									
										 <div class="control-group">
											<label class="control-label" >Fullname </label>
											<div class="controls">

                                                <asp:TextBox ID="txtFullname" CssClass="span8" placeHolder="Enter Fullname" runat="server"></asp:TextBox>
                                              
											
											</div>
										     <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtFullname" ErrorMessage="Required" ForeColor="Red">Required</asp:RequiredFieldValidator>
										</div>

										

										<div class="control-group">
											<div class="controls">
                                            <asp:Button ID="btnSave" CssClass="btn btn-success" runat="server" OnClick="btnSave_Click" Text="Save" />
                                            <asp:Button ID="btnUpdate" CssClass="btn btn-warning" runat="server" OnClick="btnUpdate_Click" Text="Update" />
                                            <asp:Button ID="btnDelete" CssClass="btn btn-danger" runat="server" Text="Delete" OnClick="btnDelete_Click"  />   
                                               
											</div>
                                            <asp:Label ID="lblMessage" CssClass="label label-important " runat="server"></asp:Label>


											<asp:GridView ID="GridView1" runat="server" DataKeyNames="id" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" Width="660px">
                                                <Columns>
                                                    <asp:CommandField ShowSelectButton="True" />
                                                </Columns>
                                            </asp:GridView>
                                            <asp:HiddenField ID="HiddenField1" runat="server" />
                                           
										</div>
									</div>
							</div>
						</div>
</asp:Content>
