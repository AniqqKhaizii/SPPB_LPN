
<cfstoredproc procedure="SP_System_Akses_Pengguna_Logout" datasource="LPN_0SYS"> 
<cfprocparam  cfsqltype="CF_SQL_VARCHAR" dbvarname="@LOGIN_ID"  value="#Session.SS_USR_ID#" null="No"> 
<cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@LPN_KOD"  value="#Session.LPN_CODE#" null="No"> 
<cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@USER_LOGOUT"  value="Y" null="No">	
<cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@SESN_TIMEOUT"  value="">
<cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@MACH_ID"  value="#cgi.REMOTE_ADDR#" null="No">
<cfprocresult name = RSLOGOUT> 
</cfstoredproc>

<cfscript>
   StructClear(Session);
</cfscript>
<cfoutput><cflocation url="../Admin" addtoken="no"></cfoutput>