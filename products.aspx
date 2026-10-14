<%@ Page Language="C#" AutoEventWireup="true" %>
<script runat="server">
    protected void Page_Load(object sender, EventArgs e)
    {
        string query = Request.Url.Query;
        Response.Redirect("product.aspx" + query, true);
    }
</script>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Redirecting to Products...</title>
</head>
<body>
    <form id="form1" runat="server">
    </form>
</body>
</html>
