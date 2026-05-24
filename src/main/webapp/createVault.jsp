<%@ page language="java" %>

<%

String user =
(String)session.getAttribute("user");

if(user == null){

response.sendRedirect("login.jsp");
}
%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>Create Vault</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
rel="stylesheet">

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

<link rel="stylesheet"
href="css/style.css">

<style>

.vault-card{

width:700px;

background:
rgba(255,255,255,0.08);

padding:40px;

border-radius:25px;

backdrop-filter:blur(15px);

box-shadow:
0 8px 32px rgba(0,0,0,0.3);
}

.form-control,
.form-select{

background:
rgba(255,255,255,0.08);

border:none;

color:white;

padding:14px;

border-radius:12px;
}

.form-control:focus,
.form-select:focus{

background:
rgba(255,255,255,0.12);

color:white;

box-shadow:none;
}

.form-control::placeholder{

color:#d1d5db;
}

textarea{

height:150px;
}

</style>

</head>

<body>

<div class="hero">

<div class="vault-card">

<h2 class="mb-4 text-center">

<i class="fa-solid fa-vault"></i>

Create Memory Vault

</h2>

<form
action="createVault"

method="post"

enctype=
"multipart/form-data">

<label>

Upload Memory File

</label>

<input

type="file"

name="memoryFile"

class="form-control mb-3"

accept=".jpg,.png,.pdf,.txt"

>

<input type="text"
name="title"
class="form-control mb-3"
placeholder="Memory Title"
required>

<textarea
name="description"
class="form-control mb-3"
placeholder="Write your future memory...">
</textarea>

<label class="mb-2">

Unlock Date

</label>

<input type="date"
name="unlock_date"
class="form-control mb-3"
required>

<select
name="category"
class="form-select mb-3">

<option>Personal</option>
<option>Career</option>
<option>Family</option>
<option>Friends</option>
<option>Goals</option>
<option>Graduation</option>
<option>Travel</option>

</select>

<input

type="password"

name="vault_password"

class="form-control mb-3"

placeholder=

"Vault Password (optional)">

<option>Private</option>
<option>Shareable</option>
<option>Password Protected</option>

</select>

<button type="submit"
class="btn btn-custom btn-login w-100">

Create Vault

</button>

</form>

</div>

</div>

</body>
</html>