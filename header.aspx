<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="header.aspx.cs" Inherits="textiles.header" %>
<%@ Register Src="~/header.ascx" TagPrefix="uc" TagName="Header" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Header - TEXTILES</title>
</head>
<body>
    <form id="form1" runat="server">
        <uc:Header ID="HeaderControl" runat="server" />
    </form>
</body>
</html>