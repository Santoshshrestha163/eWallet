<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="WebApplication4.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login | Ewallet</title>

    <link type="text/css" href="bootstrap/css/bootstrap.min.css" rel="stylesheet"/>
	<link type="text/css" href="bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet"/>
	<link type="text/css" href="css/theme.css" rel="stylesheet"/>
	<link type="text/css" href="images/icons/css/font-awesome.css" rel="stylesheet"/>
	<link type="text/css" href='http://fonts.googleapis.com/css?family=Open+Sans:400italic,600italic,400,600' rel='stylesheet'/>
</head>
<body>
    <form id="form1" runat="server">
       <div class="navbar navbar-fixed-top">
		<div class="navbar-inner">
			<div class="container">
				<a class="btn btn-navbar" data-toggle="collapse" data-target=".navbar-inverse-collapse">
					<i class="icon-reorder shaded"></i>
				</a>

			  	<a class="brand" href="index.html">
			  		EWALLET
			  	</a>

				<div class="nav-collapse collapse navbar-inverse-collapse">
				
					<ul class="nav pull-right">

					

						

						

						
					</ul>
				</div><!-- /.nav-collapse -->
			</div>
		</div><!-- /navbar-inner -->
	</div><!-- /navbar -->



	<div class="wrapper">
		<div class="container">
			<div class="row">
				<div class="module module-login span4 offset4">
					<div class="form-vertical">
						<div class="module-head">
							<h3>Sign In</h3>
						</div>
						<div class="module-body">
							<div class="control-group">
								<div class="controls row-fluid">
                                    <asp:TextBox ID="txtUsername" CssClass="span12" placeHolder="Enter Username" runat="server"></asp:TextBox>
									
								</div>
							</div>
							<div class="control-group">
								<div class="controls row-fluid">
                                    <asp:TextBox ID="txtPassword" TextMode="Password" CssClass="span12" placeHolder="Enter Password" runat="server"></asp:TextBox>

								</div>
							</div>
						</div>
						<div class="module-foot">
							<div class="control-group">
								<div class="controls clearfix">
                                    <asp:Button ID="btnLogin" CssClass="btn btn-primary pull-right" runat="server" Text="Login" OnClick="btnLogin_Click" />
                      
								
									
                                    <asp:Label ID="lblMaessage" runat="server" Text=""></asp:Label>
                                </div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div><!--/.wrapper-->

	
	<script src="scripts/jquery-1.9.1.min.js" type="text/javascript"></script>
	<script src="scripts/jquery-ui-1.10.1.custom.min.js" type="text/javascript"></script>
	<script src="bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    </form>
</body>
</html>
