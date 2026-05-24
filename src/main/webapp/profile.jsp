<%@page import="java.sql.*"%>
<%@page import="com.memoryvault.util.DBConnection"%>

<%

String user=

(String)
session.getAttribute(
"user"
);

Integer userId=

(Integer)
session.getAttribute(
"userId"
);

if(user==null){

response.sendRedirect(
"login.jsp"
);

return;

}

Connection con=

DBConnection.getConnection();

PreparedStatement ps=

con.prepareStatement(

"SELECT profile_image FROM users WHERE id=?"

);

ps.setInt(
1,
userId
);

ResultSet rs=

ps.executeQuery();

String img=null;

if(rs.next()){

img=

rs.getString(
"profile_image"
);

}

String imagePath="";

if(img!=null
&&
!img.trim().isEmpty()){

imagePath=

"uploads/"+img;

}

else{

imagePath=

"https://cdn-icons-png.flaticon.com/512/149/149071.png";

}

%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>

Profile Settings

</title>

<link

href=

"https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"

rel="stylesheet">

<link

rel="stylesheet"

href="css/style.css">

<style>

.profile-card{

max-width:700px;

margin:auto;

padding:40px;

background:

rgba(255,255,255,0.08);

backdrop-filter:

blur(15px);

border-radius:25px;

box-shadow:

0 8px 25px rgba(0,0,0,0.25);

margin-top:60px;

}

.avatar{

width:150px;

height:150px;

border-radius:50%;

object-fit:cover;

border:

4px solid white;

box-shadow:

0 4px 18px rgba(0,0,0,0.3);

}

.light{

background:white;

color:black;

}

</style>

</head>

<body>

<div class="container">

<div class="profile-card
text-center">

<h1>

Profile Settings

</h1>

<hr>

<img

src="<%=imagePath%>"

class="avatar"

>

<h2
class="mt-3">

<%=user%>

</h2>

<form

method="post"

action="profile"

enctype=

"multipart/form-data"

class="mt-4">

<label>

Upload Profile Picture

</label>

<input

type="file"

name="profile"

class=

"form-control mt-2"

required

>

<button

class=

"btn btn-primary mt-3">

Save Picture

</button>

</form>

<div
class="mt-4">

<button

onclick=

"toggleTheme()"

class=

"btn btn-light">

Theme Toggle

</button>

<a

href="dashboard.jsp"

class=

"btn btn-secondary">

Dashboard

</a>

</div>

</div>

</div>

<script>

function toggleTheme(){

document.body.classList.toggle(

"light"

);

localStorage.setItem(

"theme",

document.body.className

);

}

window.onload=()=>{

document.body.className=

localStorage.getItem(

"theme"

)||"";

};

</script>

</body>

</html>