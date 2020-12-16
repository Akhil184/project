<%@ page import="java.sql.*" %>
<%@ page import = "java.io.*,java.util.*" %>
<h1>Transcation Details</h1>
<table border="1" align="center" cellpadding="4" cellspacing="4">
<tr>
<th>Name</th>
<th>Balance</th>
</tr>
<%


Statement statement;
ResultSet rs ;
int y=0;
int b=Integer.parseInt(request.getParameter("balance"));  
String name=request.getParameter("name");   
Class.forName("oracle.jdbc.driver.OracleDriver");  
Connection con=DriverManager.getConnection(  
"jdbc:oracle:thin:@localhost:1521:xe","system","akhil");  
    
 
PreparedStatement ps=con.prepareStatement(  
"Update customers1 set balance=? where name=?");  
  
statement=con.createStatement();

String sql ="select balance,name from customers1 where name='"+name+"'";;
rs = statement.executeQuery(sql); 
  


while(rs.next()){
y=rs.getInt("balance");
%>
<tr>
<td><%=rs.getString("name") %></td><br>
<td><%=rs.getInt("balance") %></td><br>
</tr>
<%
}
ps.setInt(1,b+y); 
ps.setString(2,name); 
       
int i=ps.executeUpdate();  
if(i>0) 
{ 
out.print("Money Transfer successfully");

}
else
{
out.print("un");     
}         
  
%>



