<cfif isdefined("form.SIMPAN_PIC_1")>
<cfsetting 
enableCFoutputOnly = "no" 
requestTimeOut = "6000"
showDebugOutput = "yes" >

<cfif isdefined("form.SIMPAN_PIC_1")>

<cffile action="upload"
destination="C:\inetpub\wwwroot\SPKB_PBT\LOGO\#Session.PBT_CODE#\#Session.PBT_CODE#.jpg"
nameConflict="overwrite"
fileField="Form.PIC_1">	
<script>	
	
</script>
<cfset form.filename = CFFILE.serverfile>
	
<cfoutput>
<cfhttp url="https://mbsp.epenguatkuasa.com:4489/SPKB_PBT/LOGO/#Session.PBT_CODE#/#Session.PBT_CODE#.jpg" method="GET"
resolveurl="Yes" throwOnError="Yes" getAsBinary="yes" />	
	
<cfset photo = cfhttp.fileContent>
	
<cfstoredproc procedure="SP_System_PBT_Gambar_Simpan" datasource="SPKB_0SYS"> 
<cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@USER_ID" value="#Session.SS_USR_ID#"> 
<cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@PBT_KOD" value="#Session.PBT_CODE#"> 
<cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@PAGE_URL" value="spkb_kodfail_organisasi_pbt_imej_upload_proses.cfm">
<cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@GBR_SLOTKOD" value="LOGO_PBT">
<cfprocparam cfsqltype="CF_SQL_BLOB" dbvarname="@GBR_DATA" value="#photo#">

<cfprocresult name = RS_MASUK_DATA> 
</cfstoredproc>

<cfif isdefined("RS_MASUK_DATA.RETURN_MESSAGE") AND #RS_MASUK_DATA.RETURN_CODE# LT 0>
<p><cfoutput>#RS_MASUK_DATA.RETURN_MESSAGE#</cfoutput></p>
<cflocation url="spkb_kodfail_organisasi_pbt_imej.cfm?&ERROR=#RS_MASUK_DATA.RETURN_MESSAGE#">
</cfif>

<cflocation url="spkb_kodfail_organisasi_pbt_imej.cfm">	

</cfoutput>
	

<cfif isdefined("RS_MASUK_DATA.RETURN_MESSAGE") AND #RS_MASUK_DATA.RETURN_CODE# LT '0' >
<script type="text/javascript" src="https://code.jquery.com/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>	

<style>
#myModal {
width: 500px;
top: 25%;
left: 50%;
margin-top: -25px;
margin-left: -200px;
padding: 20px;
}
</style>

<div class="container">

<div class="modal fade" id="myModal" role="dialog">
<div class="modal-dialog modal-simple modal-center">

<div class="modal-content">
<div class="modal-body">

<table width="100%" border="0">
<tbody>
<tr>
<td colspan="2">
<p><cfoutput>#RS_MASUK_DATA.RETURN_MESSAGE#</cfoutput></p>
</br>
</td>
</tr>
<tr>
<td></td>
<td width="25%">
<button type="button" class="btn btn-danger btn-block" data-dismiss="modal">Kembali</button>
</td>
</tr>
</tbody>
</table>

</div>
</div>
</div>
</div>
</div>

<script>
$(window).load(function(){
$('#myModal').modal('show');
});
</script>	

<cfelse>
<cfoutput>
<cflocation url="spkb_kodfail_organisasi_pbt_imej.cfm">	
</cfoutput>
</cfif>
</cfif>
</cfif>