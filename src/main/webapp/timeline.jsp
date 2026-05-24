<%@page import="java.sql.*"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.time.temporal.ChronoUnit"%>
<%@page import="com.memoryvault.util.DBConnection"%>

<%

String user=
(String)session.getAttribute("user");

Integer userId=
(Integer)session.getAttribute("userId");

if(user==null){

response.sendRedirect("login.jsp");

return;

}

Connection con=
DBConnection.getConnection();

String search=
request.getParameter("search");

String category=
request.getParameter("category");

String sql=
"SELECT * FROM vaults WHERE user_id=?";

if(search!=null
&&
!search.isEmpty()){

sql+=" AND title LIKE ?";

}

if(category!=null
&&
!category.equals("All")
&&
!category.isEmpty()){

sql+=" AND category=?";

}

sql+=" ORDER BY unlock_date";

PreparedStatement ps=
con.prepareStatement(sql);

int index=1;

ps.setInt(index++,userId);

if(search!=null
&&
!search.isEmpty()){

ps.setString(
index++,
"%"+search+"%"
);

}

if(category!=null
&&
!category.equals("All")
&&
!category.isEmpty()){

ps.setString(
index++,
category
);

}

ResultSet rs=
ps.executeQuery();

%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Timeline</title>

<link
href=
"https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
rel="stylesheet">

<link rel="stylesheet"
href=
"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

<link rel="stylesheet"
href="css/style.css">

<style>

.timeline-card{

background:
rgba(255,255,255,0.08);

padding:25px;

border-radius:22px;

margin-bottom:25px;

backdrop-filter:blur(15px);

box-shadow:
0 8px 25px rgba(0,0,0,0.25);

transition:0.3s;

}

.timeline-card:hover{

transform:
translateY(-5px);

}

.locked{

opacity:0.75;

}

.locked .memory{

filter:
blur(5px);

}

.badge-lock{

background:#dc3545;

}

.badge-open{

background:#198754;

}

</style>

</head>

<body>

<div class="container mt-5">

<div
class=
"d-flex justify-content-between mb-4">

<h1 class="text-white">

Memory Timeline

</h1>

<a
href="dashboard.jsp"

class="btn btn-light">

Dashboard

</a>

</div>

<form

method="get"

action="timeline.jsp"

class="row mb-4">

<div class="col-md-5">

<input

type="text"

name="search"

placeholder="Search Memory"

class="form-control"

value=

"<%=search==null?"":search%>"

>

</div>

<div class="col-md-4">

<select

name="category"

class="form-select">

<option>

All

</option>

<option>

Career

</option>

<option>

Family

</option>

<option>

Goals

</option>

<option>

Travel

</option>

<option>

Friends

</option>

<option>

Graduation

</option>

</select>

</div>

<div class="col-md-3">

<button
class="btn btn-primary w-100">

Search

</button>

</div>

</form>

<%

while(rs.next()){

LocalDate today=
LocalDate.now();

LocalDate unlockDate=

rs.getDate(
"unlock_date"
).toLocalDate();

boolean unlocked=

!unlockDate.isAfter(today);

long days=

ChronoUnit.DAYS.between(

today,

unlockDate

);

%>

<div

class=
"timeline-card
<%=!unlocked?"locked":""%>">

<div
class=
"d-flex justify-content-between">

<h3>

<%=rs.getString("title")%>

</h3>

<%

if(unlocked){

%>

<span
class=
"badge badge-open">

Unlocked

</span>

<%

}

else{

%>

<span
class=
"badge badge-lock">

Locked

</span>

<%

}

%>

</div>

<hr>

<div class="memory">

<p>

<%=rs.getString("description")%>

</p>

</div>

<p>

<b>Category:</b>

<%=rs.getString("category")%>

</p>

<p>

<b>Unlock Date:</b>

<%=unlockDate%>

</p>

<%

if(!unlocked){

%>

<div
class=
"alert alert-warning">

Unlocks in

<b>

<%=days%>

days

</b>

</div>

<%

}

else{

%>

<div
class=
"alert alert-success">

Memory Available

</div>

<%

}

String file=

rs.getString(
"file_path"
);

if(file!=null
&&
!file.isEmpty()){

%>

<a

href=

"uploads/<%=file%>"

target="_blank"

class=
"btn btn-info">

Open Memory File

</a>

<%

}

%>

</div>

<%

}

%>

</div>

</body>

</html>