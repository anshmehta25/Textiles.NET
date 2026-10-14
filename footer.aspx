<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="footer.aspx.cs" Inherits="textiles.footer" %>
<%@ Register Src="~/footer.ascx" TagPrefix="uc" TagName="Footer" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Footer - TEXTILES</title>
</head>
<body>
    <form id="form1" runat="server">
        <uc:Footer ID="FooterControl" runat="server" />
    </form>
</body>
</html>