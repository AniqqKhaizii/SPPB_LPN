<cfcomponent>
  <cfset this.name = "SPPB">
  <cfset this.sessionmanagement = "Yes">
  <cfset this.sessionTimeout = #CreateTimeSpan(1,0,0,0)#>  
  <cfset this.datasource = "LPN_0SYS">
  <cfset root_dir = "C:\ColdFusion2018\cfusion\wwwroot\SPPB_LPN">	

  <cffunction name="onRequestStart" access="public" returntype="void">
        <cfargument name="target" type="string" required="true">

        <cfset var newURL = arguments.target>
        <cfset var newExt = ".cfm">

        <cfif not findNoCase(newExt, newURL)>
            <cfset newURL = newURL & newExt>
        </cfif>

        <cfset request.target = newURL>
    </cffunction>
</cfcomponent>
