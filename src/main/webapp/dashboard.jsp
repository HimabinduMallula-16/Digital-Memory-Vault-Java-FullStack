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

int totalVaults=0;

int upcomingUnlocks=0;

int archived=0;

PreparedStatement ps1=

con.prepareStatement(

"SELECT COUNT(*) FROM vaults WHERE user_id=?"

);

ps1.setInt(
1,
userId
);

ResultSet r1=

ps1.executeQuery();

if(r1.next()){

totalVaults=

r1.getInt(1);

}

PreparedStatement ps2=

con.prepareStatement(

"SELECT COUNT(*) FROM vaults WHERE user_id=? AND unlock_date>CURRENT_DATE"

);

ps2.setInt(
1,
userId
);

ResultSet r2=

ps2.executeQuery();

if(r2.next()){

upcomingUnlocks=

r2.getInt(1);

}

PreparedStatement ps3=

con.prepareStatement(

"SELECT COUNT(*) FROM archives a INNER JOIN vaults v ON a.vault_id=v.id WHERE v.user_id=?"

);

ps3.setInt(
1,
userId
);

ResultSet r3=

ps3.executeQuery();

if(r3.next()){

archived=

r3.getInt(1);

}

%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>

Dashboard

</title>

<link

href=

"https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"

rel="stylesheet">

<link

rel="stylesheet"

href="css/style.css">

<link

rel="stylesheet"

href=

"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

<style>

.dashboard-card{

background:

rgba(255,255,255,0.08);

border-radius:22px;

padding:30px;

backdrop-filter:

blur(14px);

box-shadow:

0 8px 24px rgba(0,0,0,0.25);

transition:0.3s;

height:100%;

}

.dashboard-card:hover{

transform:

translateY(-5px);

}

.stat-card{

background:

rgba(255,255,255,0.08);

padding:25px;

border-radius:20px;

text-align:center;

backdrop-filter:

blur(15px);

box-shadow:

0 6px 18px rgba(0,0,0,0.25);

}

.navbar-custom{

background:

rgba(0,0,0,0.25);

backdrop-filter:

blur(12px);

}

</style>

</head>

<body>

<nav

class=

"navbar navbar-expand-lg navbar-dark navbar-custom">

<div class="container-fluid">

<a
class="navbar-brand">

Digital Memory Vault

</a>

<div>

<span
class="text-white me-3">

Welcome

<%=user%>

</span>

<a

href="logout"

class=

"btn btn-danger">

Logout

</a>

</div>

</div>

</nav>

<div class="container mt-5">

<div class="row g-4">

<div class="col-md-4">

<div
class=

"dashboard-card text-center">

<i
class=

"fa-solid fa-plus fa-3x mb-3">

</i>

<h3>

Create Vault

</h3>

<p>

Store future memories

securely.

</p>

<a

href="createVault.jsp"

class=

"btn btn-primary">

Open

</a>

</div>

</div>

<div class="col-md-4">

<div
class=

"dashboard-card text-center">

<i
class=

"fa-solid fa-clock fa-3x mb-3">

</i>

<h3>

Timeline

</h3>

<p>

Track locked and

unlocked memories.

</p>

<a

href="timeline.jsp"

class=

"btn btn-secondary">

Open

</a>

</div>

</div>

<div class="col-md-4">

<div
class=

"dashboard-card text-center">

<i
class=

"fa-solid fa-user fa-3x mb-3">

</i>

<h3>

Profile

</h3>

<p>

Manage profile

settings.

</p>

<a

href="profile.jsp"

class=

"btn btn-info">

Open

</a>

</div>

</div>

</div>

<div
class=

"row mt-5 g-4">

<div class="col-md-4">

<div
class="stat-card">

<h3>

Upcoming Unlocks

</h3>

<h1>

<%=upcomingUnlocks%>

</h1>

</div>

</div>

<div class="col-md-4">

<div
class="stat-card">

<h3>

Vaults Created

</h3>

<h1>

<%=totalVaults%>

</h1>

</div>

</div>

<div class="col-md-4">

<div
class="stat-card">

<h3>

Archived Memories

</h3>

<h1>

<%=archived%>

</h1>

</div>

</div>

</div>

</div>

</body>

</html>