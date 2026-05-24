<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>Login</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
rel="stylesheet">

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

<link rel="stylesheet"
href="css/style.css">

<style>

.form-card{

width:450px;
}

.form-control{

background:
rgba(255,255,255,0.08);

border:none;

color:white;

padding:14px;

border-radius:12px;
}

.form-control::placeholder{

color:#d1d5db;
}

.form-control:focus{

background:
rgba(255,255,255,0.12);

color:white;

box-shadow:none;
}

.form-title{

font-size:36px;

margin-bottom:30px;
}

.link-text{

color:#d1d5db;
}

.link-text a{

color:white;
text-decoration:none;
}

</style>

</head>

<body>

<div class="hero">

<div class="glass-card form-card">

<div class="logo">

<i class="fa-solid fa-right-to-bracket"></i>

</div>

<h2 class="form-title">

Welcome Back

</h2>

<form action="login"
method="post">

<input type="email"
name="email"
class="form-control mb-3"
placeholder="Email Address"
required>

<input type="password"
name="password"
class="form-control mb-4"
placeholder="Password"
required>

<button type="submit"
class="btn btn-custom btn-login w-100">

Login

</button>

</form>

<p class="mt-4 link-text">

Don't have an account?

<a href="register.jsp">

Register

</a>

</p>

</div>

</div>

</body>
</html>