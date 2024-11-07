
<cfparam name="FORM.ACT_CODE" default="">

<cfif FORM.ACT_CODE EQ 'ACT_CARIAN_PENGGUNA'>
	
<cfstoredproc procedure="SP_TETAPAN_PENGGUNA_CARIAN" datasource="LPN_0SYS"> 
<cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@LPN_KOD"  value="#Session.LPN_CODE#" null="No"> 
<cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@USER_ID"  value="#Session.SS_USR_ID#" null="No"> 
<cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@PAGE_URL"  value="sppb_tetapan_pengguna.cfm" null="No"> 
<cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@USR_PEGKOD"  value="#FORM.USR_PEGKOD#" null="No"> 
<cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@USR_NAMA"  value="#FORM.USR_PEGNAMA#" null="No"> 
<cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@USR_JAB_KOD"  value="#FORM.JAB_NAMA#" null="No"> 
<cfprocresult name = RS_PENGGUNA> 
</cfstoredproc>
	
<cfelse>
	
<cfstoredproc procedure="SP_TETAPAN_PENGGUNA_CARIAN" datasource="LPN_0SYS"> 
<cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@LPN_KOD"  value="#Session.LPN_CODE#" null="No"> 
<cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@USER_ID"  value="#Session.SS_USR_ID#" null="No"> 
<cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@PAGE_URL"  value="sppb_tetapan_pengguna.cfm" null="No"> 
<cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@USR_PEGKOD"  value="" null="No"> 
<cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@USR_NAMA"  value="" null="No"> 
<cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@USR_JAB_KOD"  value="" null="No"> 
<cfprocresult name = RS_PENGGUNA> 
</cfstoredproc>
	
</cfif>
	
<cfstoredproc procedure="SP_SENARAI_JABATAN" datasource="LPN_0SYS">
<cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@LPN_KOD" value="#Session.LPN_CODE#">
<cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@USER_ID"  value="#Session.SS_USR_ID#"> 
<cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@PAGE_URL"  value="sppb_tetapan_pengguna.cfm">
<cfprocresult name="RS_JABATAN">
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
            <button id="closeError" class="w-1/4 bg-gray-500 text-white px-4 py-2 rounded hover:bg-gray-600">Kembali</button>
        </div>
    </div>
</div>

<script> 
    function getUrlParameter(name) {
        name = name.replace(/[\[\]]/g, '\\$&');
        var regex = new RegExp('[?&]' + name + '(=([^&#]*)|&|#|$)');
        var results = regex.exec(window.location.href);
        if (!results) return null;
        if (!results[2]) return '';
        return decodeURIComponent(results[2].replace(/\+/g, ' '));
    }
 
    function modalError(errorMessage) {
        document.getElementById('errorMessage').innerText = errorMessage;
        document.getElementById('errorModal').classList.remove('hidden');
    }
 
    function closeError() {
        document.getElementById('errorModal').classList.add('hidden');
    }
 
    window.onload = function() {
        var errorMessage = getUrlParameter('ERROR');
        console.log("URL Parameter 'ERROR':", errorMessage);  
        if (errorMessage) {
            modalError(errorMessage);
        }
 
        document.getElementById('closeError').onclick = closeError;
    }
</script>


<!---RETURN MESSAGE START--->
<!---RETURN MESSAGE START--->
<!---RETURN MESSAGE START--->
	
<meta name="viewport" content="width=device-width, initial-scale=1">
 

<!-- Page -->
<!---<cfdump var="#FORM#" label="Form Data">--->

<div class="page">
    <div class="flex flex-col">
      <div class="card p-8"> 
        <cfform id="form1" name="form1" method="post" action="" class="flex flex-col space-y-4">
            <div class="flex flex-col shadow-md pb-8 h-auto">
                <div class="flex items-center justify-between py-2 px-4 bg-[#580588] rounded-t-lg" data-plugin="appear" data-animate="fade">
                    <h1 class="font-semibold text-gray-100 text-lg">
                        TETAPAN - PENGGUNA
                    </h1>
					<div class="flex space-x-2"> 
						<a class="animsition-link" href="sppb_tetapan_pengguna_cari.cfm">
							<button type="button" class="flex items-center justify-center gap-2 bg-blue-500 text-white font-medium py-2 px-4 rounded hover:bg-blue-700 focus:outline-none w-full">
								Carian Semula
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
                                    <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001q.044.06.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1 1 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0"/>
                                </svg>
							</button>
						</a>  
                    </div>
                </div>  
                <div class="w-full py-2 px-4 border-b border-gray-300">
                    <div class="flex justify-between items-center">
                        <h1 class="text-2xl font-semibold text-gray-900 sm:text-2xl md:text-2xl">
                            Senarai Tetapan Pengguna
                        </h1>
						<cfif #SESSION.USR_CTL_TETAPAN_PENGGUNA# CONTAINS 'C'> 
						<a class="animsition-link" href="sppb_tetapan_pengguna_daftar.cfm">
							<button type="button" class="flex items-center justify-center gap-2 bg-green-500 text-white font-medium py-2 px-4 rounded hover:bg-green-700 focus:outline-none w-full">
								Daftar
                                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" class="size-5">
                                    <path fill-rule="evenodd" d="M10 18a8 8 0 1 0 0-16 8 8 0 0 0 0 16Zm.75-11.25a.75.75 0 0 0-1.5 0v2.5h-2.5a.75.75 0 0 0 0 1.5h2.5v2.5a.75.75 0 0 0 1.5 0v-2.5h2.5a.75.75 0 0 0 0-1.5h-2.5v-2.5Z" clip-rule="evenodd" />
                                </svg>
							</button>
						</a>
						</cfif> 
                    </div>
                </div>  
                
                <div class="flex items-center justify-end px-4 py-2">
                    Bilangan Rekod : <cfoutput>#RS_PENGGUNA.RecordCount#</cfoutput>
                </div>

        
                <div class="panel-body-12 px-4">
                <table class="min-w-full border border-gray-300">
                    <thead class="bg-gray-200">
                    <tr align="center">
                        <th class="border border-gray-300 py-2 px-4" style="width: 5%;">No.</th>
                        <th class="border border-gray-300 py-2 px-4" style="width: 30%;">Nama</th>
                        <th class="border border-gray-300 py-2 px-4" style="width: 15%;">No. Kakitangan</th>
                        <th class="border border-gray-300 py-2 px-4" style="width: 30%;">Jabatan</th>
                        <th class="border border-gray-300 py-2 px-4" style="width: 20%;">Tindakan</th>
                    </tr>
                    </thead>

                    <tbody>
                        <!--- <cfdump var="#RS_PENGGUNA#"> --->
                    <cfoutput query="RS_PENGGUNA">
                        <tr class="border-t">
                        <td class="border border-gray-300 text-center py-2"><p>#CurrentRow#.</p></td>
                        <td class="border border-gray-300 py-2 px-4">#USR_NAMA#</td>
                        <td class="border border-gray-300 py-2 px-4"><p>#USR_PEGKOD#</p></td>
                        <td class="border border-gray-300 py-2 px-4">#USR_JAB_NAMA#</td>
                        <td class="border border-gray-300 py-2 px-4 text-center">
                            <div class=" flex gap-2 items-center justify-center">
                                <a class="animsition-link" href="sppb_tetapan_pengguna_papar.cfm?USR_PEGKOD=#USR_PEGKOD#">
                                    <button type="button" class="flex items-center justify-center gap-2 bg-green-500 text-white font-medium py-2 px-4 rounded hover:bg-green-700 focus:outline-none w-32">
                                        Papar
                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-clipboard2" viewBox="0 0 16 16">
                                            <path d="M3.5 2a.5.5 0 0 0-.5.5v12a.5.5 0 0 0 .5.5h9a.5.5 0 0 0 .5-.5v-12a.5.5 0 0 0-.5-.5H12a.5.5 0 0 1 0-1h.5A1.5 1.5 0 0 1 14 2.5v12a1.5 1.5 0 0 1-1.5 1.5h-9A1.5 1.5 0 0 1 2 14.5v-12A1.5 1.5 0 0 1 3.5 1H4a.5.5 0 0 1 0 1z"/>
                                            <path d="M10 .5a.5.5 0 0 0-.5-.5h-3a.5.5 0 0 0-.5.5.5.5 0 0 1-.5.5.5.5 0 0 0-.5.5V2a.5.5 0 0 0 .5.5h5A.5.5 0 0 0 11 2v-.5a.5.5 0 0 0-.5-.5.5.5 0 0 1-.5-.5"/>
                                        </svg>
                                    </button>
                                </a> 
                            </div>
                        </td>
                        </tr>
                    </cfoutput>
                    </tbody>
                </table>  
                </div> 
            </div> 
		  

<!---DAFTAR MODAL---> 
<!---DAFTAR MODAL--->
<!---<div id="DAFTAR" class="fixed inset-0 flex items-center justify-center bg-gray-800 bg-opacity-50 hidden">
    <div class="bg-white rounded-lg shadow-lg w-1/2 p-0"> 
        <div class="bg-[url('./assets/Background.jpg')] bg-cover bg-center text-white p-6 rounded-t-lg">
            <h2 class="text-lg font-medium text-left">Daftar Jabatan</h2>
        </div>
        <div class="p-6">
            <form id="form2" name="form2" method="post" action="">
                <div class="space-y-4 col-span-1"> 
                    <div class="flex items-center">
                        <span class="w-1/4 font-medium text-gray-800">Kod</span>
                        <span class="w-1/12 text-left">:</span>
                        <input name="JAB_KOD" class="w-full text-gray-800 border border-gray-400 rounded-md px-2 py-1" type="text"/>
                    </div>
                    <div class="flex items-center">
                        <span class="w-1/4 font-medium text-gray-800">Nama</span>
                        <span class="w-1/12 text-left">:</span>
                        <input name="JAB_NAMA" class="w-full text-gray-800 border border-gray-400 rounded-md px-2 py-1" type="text"/>
                    </div>
                    <div class="flex items-center">
                        <span class="w-1/4 font-medium text-gray-800">Catatan</span>
                        <span class="w-1/12 text-left">:</span>
                        <input name="JAB_CATATAN" class="w-full text-gray-800 border border-gray-400 rounded-md px-2 py-1" type="text"/>
                    </div> 
                </div>
 
                <div class="grid grid-cols-3 mt-12">
                    <div class="space-y-4 col-span-3">
                        <div class="flex items-center">
                            <div class="bg-red-50 flex-grow border border-red-400 px-2 py-1">
                                PENGESAHAN: <br>
                                <input type="checkbox" name="chkbx" onClick="goFurther(this)">
                                <label>&nbsp;Saya sahkan maklumat yang diberikan adalah benar</label>
                            </div> 
                        </div>
                    </div>
                </div>
                <div class="grid grid-cols-2 gap-4 mt-12">
                    <div class="space-y-4 col-span-1">
                        <div class="flex items-center justify-start">
                            <button type="submit" class="w-1/2 bg-blue-200 text-white font-medium py-2 px-4 rounded cursor-not-allowed" name="MASUK_DATA" id="MASUK_DATA" disabled> 
                                Simpan
                            </button>
                        </div>
                    </div>
                    <div class="space-y-4 col-span-1">
                        <div class="flex items-center justify-end"> 
                            <button type="button" id="closeDaftar" class="w-1/2 bg-gray-500 text-white font-medium py-2 px-4 rounded hover:bg-gray-700 focus:outline-none" onclick="closeDaftar()"> 
                                Kembali
                            </button>
                        </div>
                    </div>
                </div>		 

                <cfif isdefined("form.MASUK_DATA")>
                    <cfstoredproc procedure="SP_TETAPAN_JABATAN_SIMPAN" datasource="LPN_0SYS"> 
                        <cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@LPN_KOD"  value="LPNMLK"> 
                        <cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@USER_ID"  value="ELIXTECH">  
                        <cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@PAGE_URL"  value="sppb_tetapan_organisasi_jabatan.cfm">
                        <cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@ADD_NEW"  value="Y">
                        <cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@JAB_KOD"  value="#FORM.JAB_KOD#">
                        <cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@JAB_NAMA"  value="#FORM.JAB_NAMA#">
                        <cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@JAB_CATATAN"  value="#FORM.JAB_CATATAN#"> 
                        <cfprocresult name = RS_MASUK_DATA>		
                    </cfstoredproc>

                    <cfif isdefined("RS_MASUK_DATA.RETURN_MESSAGE") AND #RS_MASUK_DATA.RETURN_CODE# LT 0>
                        <cflocation url="sppb_tetapan_organisasi_jabatan.cfm?ERROR=#RS_MASUK_DATA.RETURN_MESSAGE#">
                    <cfelse>
                        <cflocation url="sppb_tetapan_organisasi_jabatan.cfm">
                    </cfif>
                </cfif>
            </form>
        </div>
    </div>
</div>

<script>
    function goFurther(elem) {
        const saveButton = document.getElementById("MASUK_DATA");
        if (elem.checked) {
            saveButton.disabled = false;
            saveButton.classList.remove('bg-blue-200', 'cursor-not-allowed');
            saveButton.classList.add('bg-blue-500', 'hover:bg-blue-700');
        } else {
            saveButton.disabled = true;
            saveButton.classList.add('bg-blue-200', 'cursor-not-allowed');
            saveButton.classList.remove('bg-blue-500', 'hover:bg-blue-700');
        }
    }

    document.getElementById('openDaftar').addEventListener('click', function() {
        document.getElementById('DAFTAR').classList.remove('hidden');
    });

    document.getElementById('closeDaftar').addEventListener('click', function() {
        document.getElementById('DAFTAR').classList.add('hidden');
    }); 
</script>--->
<!---DAFTAR MODAL--->
<!---DAFTAR MODAL--->
							
 						
							
							
</cfform>
</div>
</div>
</div>


<!-- End Page -->