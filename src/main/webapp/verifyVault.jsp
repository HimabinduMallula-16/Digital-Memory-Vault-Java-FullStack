<!DOCTYPE html>

<html>

<head>

<title>

Verify Vault

</title>

<link
href=
"https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
rel="stylesheet">

</head>

<body>

<div
class="container mt-5">

<h2>

Enter Vault Password

</h2>

<form
action="unlockVault"

method="post">

<input

type="hidden"

name="id"

value=

"<%=request.getParameter("id")%>"

>

<input

type="password"

name="password"

class="form-control mb-3"

required>

<button
class="btn btn-primary">

Unlock

</button>

</form>

</div>

</body>

</html>