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

@WebServlet("/createVault")

@MultipartConfig(

fileSizeThreshold=1024*1024,

maxFileSize=1024*1024*10,

maxRequestSize=1024*1024*50

)

public class CreateVaultServlet extends HttpServlet {

protected void doPost(

HttpServletRequest request,

HttpServletResponse response)

throws ServletException, IOException {

String title=

request.getParameter("title");

String description=

request.getParameter("description");

String unlockDate=

request.getParameter("unlock_date");

String category=

request.getParameter("category");

String privacyMode=

request.getParameter("privacy_mode");

String vaultPassword=

request.getParameter("vault_password");

HttpSession session=

request.getSession();

int userId=

(Integer)session.getAttribute("userId");

Part filePart=

request.getPart("memoryFile");

String fileName=

filePart.getSubmittedFileName();

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

}

try {

Connection con=

DBConnection.getConnection();

String query=

"INSERT INTO vaults(\r\n"
+ "\r\n"
+ "user_id,\r\n"
+ "\r\n"
+ "title,\r\n"
+ "\r\n"
+ "description,\r\n"
+ "\r\n"
+ "file_path,\r\n"
+ "\r\n"
+ "unlock_date,\r\n"
+ "\r\n"
+ "category,\r\n"
+ "\r\n"
+ "privacy_mode,\r\n"
+ "\r\n"
+ "vault_password,\r\n"
+ "\r\n"
+ "status\r\n"
+ "\r\n"
+ ")\r\n"
+ "\r\n"
+ "VALUES(?,?,?,?,?,?,?,?,?)";

PreparedStatement ps=

con.prepareStatement(query);

ps.setInt(1,userId);

ps.setString(2,title);

ps.setString(3,description);

ps.setString(4,fileName);

ps.setString(5,unlockDate);

ps.setString(6,category);

ps.setString(7,
privacyMode);

ps.setString(8,
vaultPassword);

ps.setString(9,
"Locked");

ps.executeUpdate();

response.sendRedirect(
"timeline.jsp");

}

catch(Exception e){

e.printStackTrace();

}

}

}