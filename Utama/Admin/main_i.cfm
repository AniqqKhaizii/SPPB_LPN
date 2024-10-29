<cfstoredproc procedure="SP_Tetapan_Pengguna_Carian" datasource="LPN_0SYS"> 
<cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@USER_ID"  value="#Session.SS_USR_ID#" null="No"> 
<cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@LPN_KOD"  value="#Session.LPN_CODE#" null="No"> 
<cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@USR_PEGKOD"  value="#Session.SS_USR_ID#" null="No"> 
<cfprocresult name = RS_Pengguna> 
</cfstoredproc>
	
<cfstoredproc procedure="SP_Tetapan_LPN_Carian" datasource="LPN_0SYS"> 
    <cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@USER_ID" value="#Session.SS_USR_ID#" null="No"> 
    <cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@LPN_KOD" value="#Session.LPN_CODE#" null="No"> 
    <cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@CARI_LPN_KOD" value="#Session.LPN_CODE#" null="No"> 
    <cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@PAGE_URL" value="admin/index.cfm" null="No"> 
    <cfprocresult name="RS_Tetapan_LPN"> 
</cfstoredproc>	



<!-- Page -->
<div class="grid grid-cols-1 sm:grid-cols-1 gap-6 items-center min-h-[80vh] bg-gradient-to-br from-purple-600 to-pink-600 backdrop-blur-2xl rounded-lg shadow-2xl text-white text-center p-6">
    
    <cfoutput>
        <div class="flex flex-col justify-center items-center gap-6">
            <h1 class="text-5xl font-bold animate-pulse tracking-wide mb-4"><cfoutput>#RS_Pengguna.USR_NAMA#</cfoutput></h1>
            <h2 class="text-4xl font-bold tracking-wide mb-2">SISTEM PENGURUSAN PERUMAHAN BERSEPADU</h2>

            <cfif RS_Tetapan_LPN.LPN_KOD == "LPNMLK">
                <img src="../../public/assets/LPM.png" 
                     class="h-48 w-auto drop-shadow-2xl transition-transform duration-500 hover:scale-110 mb-4" 
                     alt="Logo"
                />
            </cfif>

            <h3 class="text-3xl font-semibold drop-shadow-lg mb-1">#RS_Tetapan_LPN.LPN_NAMA#</h3>
            <h4 class="text-3xl font-medium drop-shadow-md">(#RS_Tetapan_LPN.LPN_NSGKT#)</h4>
        </div>
    </cfoutput>
</div>

