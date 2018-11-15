<%@ page contentType="text/html; charset=utf-8" language="java" errorPage="" %>
<%@ page import="java.util.Enumeration"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>美容美发管理系统</title>
</head>
<%
	java.util.Vector vect = new java.util.Vector();
	Enumeration sessionItems = session.getAttributeNames();
	String s = null;
	try {
		while(sessionItems.hasMoreElements())
		{
			 s = (String)sessionItems.nextElement();
			 vect.add(s);
		}
	}
	catch(Exception e) {
		System.out.println("e="+e);
	}
	for (int i=0; i< vect.size();i++ ) {
		session.removeAttribute(vect.get(i).toString());
	}
	String sHref = "index.jsp";
   	out.println("<Script Language='javaScript'>");
   	out.println("document.location.href=\""+sHref+"\"");
   	out.println("</Script>");
%>
<body>
</body>
</html>
