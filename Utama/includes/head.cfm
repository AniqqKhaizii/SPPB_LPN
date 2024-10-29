<!doctype html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" integrity="sha384-k6RqeWeci5ZR/Lv4MR0sA0FfDOM3ck6rF98s2/cbXH/4F1GdfE8w5Tz5+hYf6l0c" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/pagedone@1.2.2/src/js/pagedone.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/pagedone@1.2.2/src/css/pagedone.css " rel="stylesheet"/> 
    <cfif NOT ListFind(CGI.SCRIPT_NAME, "/SPPB_LPN/Utama/Admin/index.cfm")>
        <cfinclude template="sessionTimeOut.cfm">
    </cfif>

    <title>SPPB | Elix Solution Sdn Bhd</title>
	
    <link rel="apple-touch-icon" href="../assets/SPPB.png">
    <link rel="shortcut icon" href="../assets/SPPB.png">


    <link href="../../public/output.css" rel="stylesheet">
</head>
</html>