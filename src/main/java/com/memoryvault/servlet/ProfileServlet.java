package com.memoryvault.servlet;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.memoryvault.util.DBConnection;

@WebServlet("/profile")

@MultipartConfig

public class ProfileServlet
extends HttpServlet{

protected void doPost(

HttpServletRequest request,

HttpServletResponse response)

throws ServletException,
IOException{

try{

HttpSession session=

request.getSession();

Integer userId=

(Integer)
session.getAttribute(
"userId"
);

Part filePart=

request.getPart(
"profile"
);

String fileName=

filePart
.getSubmittedFileName();

String uploadPath=

getServletContext()
.getRealPath("")

+"uploads";

File folder=

new File(uploadPath);

if(!folder.exists()){

folder.mkdir();

}

if(fileName!=null
&&
!fileName.isEmpty()){

filePart.write(

uploadPath

+File.separator

+fileName

);

Connection con=

DBConnection.getConnection();

PreparedStatement ps=

con.prepareStatement(

"UPDATE users SET profile_image=? WHERE id=?"

);

ps.setString(

1,

fileName

);

ps.setInt(

2,

userId

);

ps.executeUpdate();

}

response.sendRedirect(

"profile.jsp"

);

}

catch(Exception e){

e.printStackTrace();

}

}

}