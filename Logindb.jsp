<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%
                String email=request.getParameter("email");
        		String pwd=request.getParameter("pwd");
        		int i = 0;
        		String name = "";
        		String Email = "";
        		try
        		{
        			Class.forName("oracle.jdbc.driver.OracleDriver");
        			Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","root");
        			Statement st = con.createStatement();
        			ResultSet rs = st.executeQuery("select * from users where email = '"+email+"' and password = '"+pwd+"'");
        			while(rs.next())
        			{
        				i=1;
        				name = rs.getString(1);
        				Email = rs.getString(2);
        			}
        			if(i == 1)
        			{
        				session.setAttribute("email", Email);
        				session.setAttribute("name", name);
        				response.sendRedirect("Home.jsp");
        			}
        			else
        			{
        				response.sendRedirect("Login.jsp");
        			}

        		}
        		catch(Exception ex)
        		{
        			System.out.println(ex);
        		}
                %>