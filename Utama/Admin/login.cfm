<cfparam name="getUsername" default="" />
<cfparam name="getPassword" default="" />
<cfoutput>#getUsername#</cfoutput>
<cfoutput>#getPassword#</cfoutput>
<cfif structKeyExists(form, "verify")>
    <cfstoredproc procedure="SP_System_Akses_Pengguna_Login" datasource="LPN_0SYS"> 
        <cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@LPN_KOD"  value="LPNMLK" null="No"> 
        <cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@LOGIN_ID"  value="#getUsername#" null="No"> 
        <cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@LOGIN_PWD"  value="#getPassword#" null="No"> 
        <cfprocresult name = verifyusername> 
    </cfstoredproc>
  <cfif isDefined("verifyusername.USR_PEGKOD")>
    <cfset Session.SS_USR_ID = #verifyusername.USR_PEGKOD#>
    <cfset Session.SS_USR_PWD = #verifyusername.USR_LOGIN_PWD#>
    <cfset Session.SS_USR_NAME = #verifyusername.USR_NAMA#>
    <cfset Session.LPN_CODE = #verifyusername.USR_LPNKOD#>
    <cfset Session.USR_ROLES = #verifyusername.USR_ROLES#>
    <cfset Session.USR_ROLES_SUPER = #verifyusername.USR_ROLES_SUPER#>
    <cfset Session.USR_ROLES_ADMIN = #verifyusername.USR_ROLES_ADMIN#>
    <cfset Session.USR_ROLES_BIASA = #verifyusername.USR_ROLES_BIASA#>
    <cfset Session.USR_CTL_DATA_TEST = #verifyusername.USR_CTL_DATA_TEST#>
    <cfset Session.USR_CTL_TETAPAN_SISTEM = #verifyusername.USR_CTL_TETAPAN_SISTEM#>
    <cfset Session.USR_CTL_TETAPAN_PENGGUNA = #verifyusername.USR_CTL_TETAPAN_PENGGUNA#>
    <cfset Session.USR_CTL_DATA_PROFIL = #verifyusername.USR_CTL_DATA_PROFIL#>
    <cfset Session.USR_PAGE_DEFAULT = #verifyusername.USR_PAGE_DEFAULT#>
    <cfset Session.USR_PAGE_LOCK = #verifyusername.USR_PAGE_LOCK#>
    <cfset Session.USR_LOGIN_TOKEN = #verifyusername.USR_LOGIN_TOKEN#>
    <cfset Session.SS_USR_LOGIN_TOKEN = #verifyusername.USR_LOGIN_TOKEN#>
    <cfset Session.SS_LPN_NSGKT = #verifyusername.LPN_NSGKT#>
    <cfset Session.SS_Folder = 'Admin'>
    <cflocation url="./main.cfm">
  <cfelse>
    <cfoutput>
      <p><strong>Maaf</strong>! Maklumat tidak dijumpai. Sila cuba sekali lagi.</p>
    </cfoutput>
  </cfif>
</cfif>