
<script>
document.addEventListener("DOMContentLoaded", function(event) { 
var scrollpos = localStorage.getItem('scrollpos');
if (scrollpos) window.scrollTo(0, scrollpos);
});

window.onbeforeunload = function(e) {
localStorage.setItem('scrollpos', window.scrollY);
};
</script>

<cfparam name="FORM.USR_PEGKOD" default="">
<cfparam name="FORM.LPN_NAMA" default="">
<cfparam name="FORM.LPN_NSGKT" default="">
<cfparam name="FORM.LPN_ALAMAT1" default="">
<cfparam name="FORM.LPN_ALAMAT2" default="">
<cfparam name="FORM.LPN_ALAMAT3" default="">
<cfparam name="FORM.LPN_ALAMAT4" default="">
<cfparam name="FORM.PBT_DAERAH" default="">
<cfparam name="FORM.LPN_TMS_KOD" default="">
<cfparam name="FORM.LPN_TELNO" default="">
<cfparam name="FORM.LPN_FAXNO" default="">
<cfparam name="FORM.LPN_EMEL" default="">
<cfparam name="FORM.LPN_WSURL" default="">
<cfparam name="FORM.LPN_SETT_AYT_PETIKAN1" default="">
<cfparam name="FORM.LPN_SETT_AYT_PETIKAN2" default="">
<cfparam name="FORM.LPN_SETT_AYT_PETIKAN3" default="">
<cfparam name="FORM.LPN_SETT_AYT_PETIKAN4" default=""> 
	
<!---<cfstoredproc procedure="[SP_System_Akses_Pengguna_Login]" datasource="LPN_0SYS"> 
<cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@LPN_KOD"  value="#Session.LPN_CODE#" null="No">  
<cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@PAGE_URL"  value="sppb_tetapan_organisasi_kemaskini.cfm" null="No"> 
<cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@LOGIN_ID"  value="ELIXTECH" null="No"> 
<cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@LOGIN_PWD"  value="ELIX1833" null="No"> 
<cfprocresult name = RS_AKSES_PENGGUNA> 
</cfstoredproc>--->
	
<cfstoredproc procedure="SP_Senarai_Tempat_Negeri" datasource="LPN_0SYS">
<cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@LPN_KOD" value="#Session.LPN_CODE#">
<cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@USER_ID"  value="#Session.SS_USR_ID#"> 
<cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@PAGE_URL"  value="sppb_tetapan_organisasi.cfm">
<cfprocresult name="RS_NEGERI">
</cfstoredproc>	
	
<cfstoredproc procedure="SP_TETAPAN_LPN_CARIAN" datasource="LPN_0SYS"> 
<cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@LPN_KOD"  value="#Session.LPN_CODE#" null="No"> 
<cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@USER_ID"  value="#Session.SS_USR_ID#" null="No"> 
<cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@PAGE_URL"  value="sppb_tetapan_organisasi.cfm" null="No"> 
<cfprocresult name = RS_ORGANISASI> 
</cfstoredproc> 


<!---RETURN MESSAGE START--->
<!---RETURN MESSAGE START--->
<!---RETURN MESSAGE START--->	

<div id="errorModal" class="hidden fixed inset-0 bg-gray-800 bg-opacity-50 flex items-center justify-center">
    <!-- Modal Content -->
    <div class="bg-white rounded-lg shadow-lg p-6 w-1/3">
        <h2 class="text-xl font-bold mb-4">Error</h2>
        <p id="errorMessage" class="text-gray-700 mb-4"></p>
        <div class="flex justify-end">
            <button id="closeModal" class="w-1/4 bg-gray-500 text-white px-4 py-4 rounded hover:bg-gray-600">Kembali</button>
        </div>
    </div>
</div>

<script>
    // Function to get URL parameter
    function getUrlParameter(name) {
        name = name.replace(/[\[\]]/g, '\\$&');
        var regex = new RegExp('[?&]' + name + '(=([^&#]*)|&|#|$)');
        var results = regex.exec(window.location.href);
        if (!results) return null;
        if (!results[2]) return '';
        return decodeURIComponent(results[2].replace(/\+/g, ' '));
    }

    // Function to open the modal with the error message
    function openModal(errorMessage) {
        document.getElementById('errorMessage').innerText = errorMessage;
        document.getElementById('errorModal').classList.remove('hidden');
    }

    // Function to close the modal
    function closeModal() {
        document.getElementById('errorModal').classList.add('hidden');
    }

    // Show modal if there is an error in the URL
    window.onload = function() {
        var errorMessage = getUrlParameter('ERROR');
        console.log("URL Parameter 'ERROR':", errorMessage); // Display error value in console
        if (errorMessage) {
            openModal(errorMessage);
        }

        // Add click event listener to close button
        document.getElementById('closeModal').onclick = closeModal;
    }
</script>


<!---RETURN MESSAGE START--->
<!---RETURN MESSAGE START--->
<!---RETURN MESSAGE START--->	
	
	
<meta name="viewport" content="width=device-width, initial-scale=1">
 

<!-- Page -->

<div class="page">
  <div class="flex flex-col">
    <div class="card p-8"> 
    <form id="form1" name="form1" method="post" action="sppb_tetapan_pengguna.cfm" class="flex flex-col space-y-4">
        <div class="flex flex-col shadow-md">    
            <div class="flex items-center justify-between py-4 px-4 bg-[#580588] rounded-t-lg" data-plugin="appear" data-animate="fade">
              <h1 class="text-lg font-semibold text-gray-100">
                TETAPAN - PENGGUNA - CARIAN
              </h1>
              <div class="flex items-center space-x-3">  
				<cfif #SESSION.USR_CTL_TETAPAN_PENGGUNA# CONTAINS 'C'> 
                <a class="animsition-link" href="sppb_tetapan_pengguna_daftar.cfm">
                    <button type="button" class="flex items-center justify-center gap-2 bg-green-500 text-white font-medium py-2 px-4 rounded hover:bg-green-700 focus:outline-none">
                        Daftar
                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" class="size-5">
                            <path fill-rule="evenodd" d="M10 18a8 8 0 1 0 0-16 8 8 0 0 0 0 16Zm.75-11.25a.75.75 0 0 0-1.5 0v2.5h-2.5a.75.75 0 0 0 0 1.5h2.5v2.5a.75.75 0 0 0 1.5 0v-2.5h2.5a.75.75 0 0 0 0-1.5h-2.5v-2.5Z" clip-rule="evenodd" />
                        </svg>
                    </button>
                </a>
  				</cfif>
              </div>
            </div> 
            <cfoutput query="RS_ORGANISASI"> 

                <div class="m-2">
                    <table class="table-fixed w-full"> 
                        <tr>
                            <td class="px-2 py-4" width="15%">  
                                <div class="flex items-center">
                                    <span class="font-medium text-gray-800">No. Kakitangan</span> 
                                </div> 
                            </td> 
                            <td class="px-2 py-4" width="5%">  
                                <div class="flex items-center"> 
                                    <span class="text-left">:</span> 
                                </div> 
                            </td> 
                            <td>  
                                <div class="flex items-center">  
                                    <input name="USR_PEGKOD" class="w-full text-gray-800 border border-gray-400 rounded-md px-2 py-1" type="text"/>
                                    <input name="ACT_CODE" type="hidden" value="ACT_CARIAN_PENGGUNA">
                                    <!---<input name="USR_PEGKOD" type="hidden" value="USR_PEGKOD">--->
                                </div> 
                            </td> 
                        </tr>
                        <tr>
                            <td class="px-2 py-4" width="15%">   
                                <div class="flex items-center">
                                    <span class="font-medium text-gray-800">Nama</span> 
                                </div> 
                            </td> 
                            <td class="px-2 py-4" width="5%">  
                                <div class="flex items-center"> 
                                    <span class="text-left">:</span> 
                                </div> 
                            </td> 
                            <td>  
                                <div class="flex items-center">  
                                    <input name="USR_PEGNAMA" class="w-full text-gray-800 border border-gray-400 rounded-md px-2 py-1" type="text" />
                                </div> 
                            </td> 
                        </tr>
                        <tr>
                            <td class="px-2 py-4" width="15%">  
                                <div class="flex items-center">
                                    <span class="font-medium text-gray-800">Jabatan</span> 
                                </div> 
                            </td> 
                            <td class="px-2 py-4" width="5%">   
                                <div class="flex items-center"> 
                                    <span class="text-left">:</span> 
                                </div> 
                            </td> 
                            <td>  
                                <div class="flex items-center">  
                                    <input name="JAB_NAMA" class="w-full text-gray-800 border border-gray-400 rounded-md px-2 py-1" type="text" />
                                </div> 
                            </td> 
                        </tr>
                    </table>
                </div>  

                <div class="flex justify-end border-none m-4">
                    <div class="flex items-center w-1/6">
                        <button type="submit" class="flex items-center justify-center gap-2 w-full bg-blue-500 text-white font-medium py-2 rounded hover:bg-blue-700"> 
                            Cari
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
                                <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001q.044.06.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1 1 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0"/>
                            </svg>
                        </button>
                    </div>
                </div>

            </cfoutput> 
        </div> 
    </form>
		
 
</div>
</div>
</div>

<!-- End Page -->