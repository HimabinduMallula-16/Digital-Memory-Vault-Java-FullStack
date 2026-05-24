package com.memoryvault.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.memoryvault.util.DBConnection;

@WebServlet("/archive")

public class ArchiveServlet
extends HttpServlet{

protected void doPost(

HttpServletRequest request,

HttpServletResponse response)

throws ServletException,
IOException{

try{

int id=

Integer.parseInt(
request.getParameter("id")
);

Connection con=

DBConnection.getConnection();

PreparedStatement ps=

con.prepareStatement(

"INSERT INTO archives(vault_id) VALUES(?)"

);

ps.setInt(1,id);

ps.executeUpdate();

response.sendRedirect(
"timeline.jsp"
);

}

catch(Exception e){

e.printStackTrace();

}

}

}