<cfparam name="FORM.TMP_KOD" default="">
<cfparam name="FORM.TMP_NAMA" default="">

<cfstoredproc procedure="[SP_System_Akses_Pengguna_Login]" datasource="LPN_0SYS"> 
<cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@LPN_KOD"  value="#Session.LPN_CODE#" null="No">  
<cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@PAGE_URL"  value="sppb_tetapan_tempat_parlimen.cfm" null="No"> 
<cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@LOGIN_ID"  value="#Session.SS_USR_ID#" null="No"> 
<cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@LOGIN_PWD"  value="#Session.SS_USR_PWD#" null="No"> 
<cfprocresult name = RS_AKSES_PENGGUNA> 
</cfstoredproc>

<cfstoredproc procedure="SP_TETAPAN_TEMPAT_PARLIMEN_CARIAN" datasource="LPN_0SYS"> 
<cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@LPN_KOD"  value="#Session.LPN_CODE#" null="No"> 
<cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@USER_ID"  value="#Session.SS_USR_ID#" null="No"> 
<cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@PAGE_URL"  value="sppb_tetapan_tempat_parlimen.cfm" null="No"> 
<cfprocresult name = RS_PARLIMEN> 
</cfstoredproc> 

<cfstoredproc procedure="SP_TETAPAN_LPN_CARIAN" datasource="LPN_0SYS"> 
<cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@LPN_KOD"  value="#Session.LPN_CODE#" null="No"> 
<cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@USER_ID"  value="#Session.SS_USR_ID#" null="No"> 
<cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@PAGE_URL"  value="sppb_tetapan_tempat_parlimen.cfm" null="No"> 
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
  <div class="container mx-auto mt-12">
    <div class="flex flex-col">
      <div class="card p-8"> 
        <cfform id="form1" name="form1" method="post" action="" class="flex flex-col space-y-4">
            <div class="flex flex-col shadow-md pb-8 h-auto">
                <div class="flex items-center justify-between py-2 px-4 bg-[#580588] rounded-t-lg" data-plugin="appear" data-animate="fade">
                    <h1 class="text-2xl font-semibold text-gray-100 sm:text-2xl md:text-2xl">
                        TETAPAN - TEMPAT - PARLIMEN
                    </h1>
                </div>  
                <div class="block p-2">
                    <ul class="flex flex-wrap border-b border-gray-200 space-x-3 transition-all duration-300 -mb-px">
                        <li>
                            <a class="inline-block py-2 px-3 text-gray-500 hover:text-gray-800 font-medium border-b-2 border-transparent tab-active:border-b-indigo-600 tab-active:text-indigo-600  tablink whitespace-nowrap cursor-pointer" data-tab="tabs-with-underline-1" role="tab" href="sppb_tetapan_tempat_daerah.cfm">Daerah</a>
                        </li>
                        <li>
                            <a class="inline-block py-2 px-3 text-gray-500 hover:text-gray-800 font-medium border-b-2 border-transparent tab-active:border-b-indigo-600 tab-active:text-indigo-600  tablink whitespace-nowrap cursor-pointer" data-tab="tabs-with-underline-2" role="tab" href="sppb_tetapan_tempat_mukim.cfm">Mukim</a>
                        </li>
                        <li>
                        <a class="inline-block py-2 px-3 text-gray-500 hover:text-gray-800 font-medium border-b-2 border-transparent tab-active:border-b-indigo-600 tab-active:text-indigo-600  tablink whitespace-nowrap cursor-pointer" data-tab="tabs-with-underline-3" role="tab" href="sppb_tetapan_tempat_adun.cfm">ADUN</a>
                        </li>
                        <li>
                        <a class="inline-block py-2 px-3 text-gray-500 hover:text-gray-800 font-medium border-b-2 border-transparent tab-active:border-b-indigo-600 tab-active:text-indigo-600 active tablink whitespace-nowrap cursor-pointer" data-tab="tabs-with-underline-4" role="tab" href="sppb_tetapan_tempat_parlimen.cfm">Parlimen</a>
                        </li>
                        <li>
                        <a class="inline-block py-2 px-3 text-gray-500 hover:text-gray-800 font-medium border-b-2 border-transparent tab-active:border-b-indigo-600 tab-active:text-indigo-600 tablink whitespace-nowrap cursor-pointer" data-tab="tabs-with-underline-5" role="tab" href="sppb_tetapan_tempat_pbt.cfm">PBT</a>
                        </li>
                    </ul>
                </div>
                <div class="w-full py-2 px-4 border-b border-gray-300">
                    <div class="flex justify-between items-center">
                        <h1 class="text-2xl font-semibold text-gray-900 sm:text-2xl md:text-2xl">
                            PARLIMEN - Senarai Tetapan Parlimen
                        </h1>
                        <cfif #RS_AKSES_PENGGUNA.USR_CTL_TETAPAN_SISTEM# CONTAINS 'E'> 
                            <button id="openDaftar" type="button" class="bg-green-500 hover:bg-green-600 text-white py-2 px-4 rounded w-32">
                            Daftar
                            </button>
                        </cfif>
                    </div>
                </div>  
                
                <div class="flex items-center justify-end px-4 py-2">
                    Bilangan Rekod : <cfoutput>#RS_PARLIMEN.RecordCount#</cfoutput>
                </div>

        
                <div class="min-w-full panel-body-12 px-4">
                    <div class="overflow-x-auto">
                        <table class="min-w-full border border-gray-300">
                            <thead class="bg-gray-200">
                            <tr align="center">
                                <th class="border border-gray-300 py-2 px-4 font-medium" style="width: 5%;">No.</th>
                                <th class="border border-gray-300 py-2 px-4 font-medium" style="width: 15%;">Kod</th>
                                <th class="border border-gray-300 py-2 px-4 font-medium" style="width: 30%;">Parlimen</th>
                                <th class="border border-gray-300 py-2 px-4 font-medium" style="width: 30%;">Y.B.</th>
                                <th class="border border-gray-300 py-2 px-4 font-medium" style="width: 30%;">Tindakan</th>
                            </tr>
                            </thead>

                            <tbody>
                            <cfoutput query="RS_PARLIMEN">
                                <tr class="border-t">
                                <td class="border border-gray-300 text-center py-2"><p>#CurrentRow#.</p></td>
                                <td class="border border-gray-300 py-2 px-4">#TMP_KOD#</td>
                                <td class="border border-gray-300 py-2 px-4">#TMP_NAMA#</td>
                                <td class="border border-gray-300 py-2 px-4 flex flex-col"><p>#TMP_YB_NAMA#</p> <p>#TMP_YB_TELNO#</p> <p>#TMP_YB_EMEL#</p></td>
                                <td class="border border-gray-300 py-2 px-4 text-center"> 
                                    <button id="openKemaskini#TMP_KOD#" type="button" class="bg-green-500 hover:bg-green-600 text-white py-2 px-4 rounded">
                                    Kemaskini
                                    </button>  
                                    <button id="openHapus#TMP_KOD#" type="button" class="bg-red-500 text-white py-2 px-4 rounded hover:bg-red-700 transition duration-200">
                                        Hapus 
                                    </button> 
                                </td>
                                </tr>
                            </cfoutput>
                            </tbody>
                        </table>  
                    </div>
                </div> 
            </div> 
		  

<!---DAFTAR MODAL---> 
<!---DAFTAR MODAL--->
<div id="DAFTAR" class="fixed inset-0 flex items-center justify-center bg-gray-800 bg-opacity-50 hidden">
    <div class="bg-white rounded-lg shadow-lg w-1/2 p-0">
        <!-- Header with background color -->
        <div class="bg-[url('./assets/Background.jpg')] bg-cover bg-center text-white p-6 rounded-t-lg">
            <h2 class="text-lg font-medium text-left">Daftar Parlimen</h2>
        </div>
        <div class="p-6">
            <form id="form2" name="form2" method="post" action="">
                <div class="space-y-4 col-span-1"> 
                    <div class="flex items-center">
                        <span class="w-1/4 font-medium text-gray-800">Kod</span>
                        <span class="w-1/12 text-left">:</span>
                        <input name="TMP_KOD" class="w-full text-gray-800 border border-gray-400 rounded-md px-2 py-1" type="text"/>
                    </div>
                    <div class="flex items-center">
                        <span class="w-1/4 font-medium text-gray-800">Nama Parlimen</span>
                        <span class="w-1/12 text-left">:</span>
                        <input name="TMP_NAMA" class="w-full text-gray-800 border border-gray-400 rounded-md px-2 py-1" type="text"/>
                    </div>
                    <div class="flex items-center">
                        <span class="w-1/4 font-medium text-gray-800">Nama Y.B.</span>
                        <span class="w-1/12 text-left">:</span>
                        <input name="TMP_YB_NAMA" class="w-full text-gray-800 border border-gray-400 rounded-md px-2 py-1" type="text"/>
                    </div>
                    <div class="flex items-center">
                        <span class="w-1/4 font-medium text-gray-800">Tel No. Y.B.</span>
                        <span class="w-1/12 text-left">:</span>
                        <input name="TMP_YB_TELNO" class="w-full text-gray-800 border border-gray-400 rounded-md px-2 py-1" type="text"/>
                    </div>
                    <div class="flex items-center">
                        <span class="w-1/4 font-medium text-gray-800">E-mel Y.B.</span>
                        <span class="w-1/12 text-left">:</span>
                        <input name="TMP_YB_EMEL" class="w-full text-gray-800 border border-gray-400 rounded-md px-2 py-1" type="text"/>
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
                    <cfstoredproc procedure="SP_TETAPAN_TEMPAT_PARLIMEN_SIMPAN" datasource="LPN_0SYS"> 
                        <cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@LPN_KOD"  value="#Session.LPN_CODE#"> 
                        <cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@USER_ID"  value="ELIXTECH">  
                        <cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@PAGE_URL"  value="sppb_tetapan_tempat_parlimen.cfm">
                        <cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@ADD_NEW"  value="Y">
                        <cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@TMP_KOD"  value="#FORM.TMP_KOD#">
                        <cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@TMP_NAMA"  value="#FORM.TMP_NAMA#">
                        <cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@TMP_YB_NAMA"  value="#FORM.TMP_YB_NAMA#">
                        <cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@TMP_YB_TELNO"  value="#FORM.TMP_YB_TELNO#">
                        <cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@TMP_YB_EMEL"  value="#FORM.TMP_YB_EMEL#">
                        <cfprocresult name = RS_MASUK_DATA>		
                    </cfstoredproc>

                    <cfif isdefined("RS_MASUK_DATA.RETURN_MESSAGE") AND #RS_MASUK_DATA.RETURN_CODE# LT 0>
                        <cflocation url="sppb_tetapan_tempat_parlimen.cfm?ERROR=#RS_MASUK_DATA.RETURN_MESSAGE#">
                    <cfelse>
                        <cflocation url="sppb_tetapan_tempat_parlimen.cfm">
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
</script>
<!---DAFTAR MODAL--->
<!---DAFTAR MODAL--->
							
 <cfoutput query="RS_PARLIMEN">						
<!---KEMASKINI MODAL---> 
<!---KEMASKINI MODAL--->
<div id="KEMASKINI#TMP_KOD#" class="fixed inset-0 flex items-center justify-center bg-gray-800 bg-opacity-50 hidden">
    <div class="bg-white rounded-lg shadow-lg w-1/2 p-0">
        <!-- Header with background color -->
        <div class="bg-[url('./assets/Background.jpg')] bg-cover bg-center text-white p-6 rounded-t-lg">
            <h2 class="text-lg font-medium text-left">Kemaskini PARLIMEN</h2>
        </div>
        <div class="p-6">
            <form id="form2" name="form2" method="post" action="">
                <div class="space-y-4 col-span-1"> 
                    <div class="flex items-center">
                        <span class="w-1/4 font-medium text-gray-800">Kod</span>
                        <span class="w-1/12 text-left">:</span>
                        <input readonly name="TMP_KOD" value="#TMP_KOD#" class="w-full bg-gray-200 text-gray-800 border border-gray-400 rounded-md px-2 py-1" type="text"/>
                    </div>
                    <div class="flex items-center">
                        <span class="w-1/4 font-medium text-gray-800">Nama PARLIMEN</span>
                        <span class="w-1/12 text-left">:</span>
                        <input name="TMP_NAMA" value="#TMP_NAMA#" class="w-full text-gray-800 border border-gray-400 rounded-md px-2 py-1" type="text"/>
                    </div>
                    <div class="flex items-center">
                        <span class="w-1/4 font-medium text-gray-800">Nama Y.B.</span>
                        <span class="w-1/12 text-left">:</span>
                        <input name="TMP_YB_NAMA" value="#TMP_YB_NAMA#" class="w-full text-gray-800 border border-gray-400 rounded-md px-2 py-1" type="text"/>
                    </div>
                    <div class="flex items-center">
                        <span class="w-1/4 font-medium text-gray-800">Tel No. Y.B.</span>
                        <span class="w-1/12 text-left">:</span>
                        <input name="TMP_YB_TELNO" value="#TMP_YB_TELNO#" class="w-full text-gray-800 border border-gray-400 rounded-md px-2 py-1" type="text"/>
                    </div>
                    <div class="flex items-center">
                        <span class="w-1/4 font-medium text-gray-800">E-mel Y.B.</span>
                        <span class="w-1/12 text-left">:</span>
                        <input name="TMP_YB_EMEL" value="#TMP_YB_EMEL#" class="w-full text-gray-800 border border-gray-400 rounded-md px-2 py-1" type="text"/>
                    </div>
                </div>
 
                <div class="grid grid-cols-3 mt-12">
                    <div class="space-y-4 col-span-3">
                        <div class="flex items-center">
                            <div class="bg-red-50 flex-grow border border-red-400 px-2 py-1">
                                PENGESAHAN: <br>
                                <input type="checkbox" name="chkbx" onClick="goFurtherKemaskini(this)" data-TMPkod="#TMP_KOD#">
                                <label>&nbsp;Saya sahkan maklumat yang diberikan adalah benar</label>
                            </div> 
                        </div>
                    </div>
                </div>
                <div class="grid grid-cols-2 gap-4 mt-12">
                    <div class="space-y-4 col-span-1">
                        <div class="flex items-center justify-start">
                            <button type="submit" class="w-1/2 bg-blue-200 text-white font-medium py-2 px-4 rounded cursor-not-allowed" name="KEMASKINI_DATA" id="KEMASKINI_DATA#TMP_KOD#" disabled> 
                                Simpan
                            </button>
                        </div>
                    </div>
                    <div class="space-y-4 col-span-1">
                        <div class="flex items-center justify-end"> 
                            <button type="button" id="closeKemaskini#TMP_KOD#" class="w-1/2 bg-gray-500 text-white font-medium py-2 px-4 rounded hover:bg-gray-700 focus:outline-none" onclick="closeKemaskini#TMP_KOD#()"> 
                                Kembali
                            </button>
                        </div>
                    </div>
                </div>		 
						
				
                <cfif isdefined("form.KEMASKINI_DATA")>
                    <cfstoredproc procedure="SP_TETAPAN_TEMPAT_PARLIMEN_SIMPAN" datasource="LPN_0SYS"> 
                        <cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@LPN_KOD"  value="LPNMLK"> 
                        <cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@USER_ID"  value="ELIXTECH">  
                        <cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@PAGE_URL"  value="sppb_tetapan_tempat_PARLIMEN.cfm">
                        <cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@TMP_KOD"  value="#FORM.TMP_KOD#">
                        <cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@TMP_NAMA"  value="#FORM.TMP_NAMA#">
                        <cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@TMP_YB_NAMA"  value="#FORM.TMP_YB_NAMA#">
                        <cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@TMP_YB_TELNO"  value="#FORM.TMP_YB_TELNO#">
                        <cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@TMP_YB_EMEL"  value="#FORM.TMP_YB_EMEL#">
                        <cfprocresult name = RS_KEMASKINI_DATA>		
                    </cfstoredproc>

                    <cfif isdefined("RS_KEMASKINI_DATA.RETURN_MESSAGE") AND #RS_KEMASKINI_DATA.RETURN_CODE# LT 0>
                        <cflocation url="sppb_tetapan_tempat_PARLIMEN.cfm?ERROR=#RS_KEMASKINI_DATA.RETURN_MESSAGE#">
                    <cfelse>
                        <cflocation url="sppb_tetapan_tempat_PARLIMEN.cfm">
                    </cfif>
                </cfif>
            </form>
        </div>
    </div>
</div>

<script>
    function goFurtherKemaskini(elem) {
        const TMPkod = elem.getAttribute('data-TMPkod');
        const saveButton = document.getElementById("KEMASKINI_DATA" + TMPkod);
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

    document.getElementById('openKemaskini#TMP_KOD#').addEventListener('click', function() {
        document.getElementById('KEMASKINI#TMP_KOD#').classList.remove('hidden');
    });

    document.getElementById('closeKemaskini#TMP_KOD#').addEventListener('click', function() {
        document.getElementById('KEMASKINI#TMP_KOD#').classList.add('hidden');
    }); 
</script>
<!---KEMASKINI MODAL--->
<!---KEMASKINI MODAL--->
							
							
<!---HAPUS MODAL---> 
<!---HAPUS MODAL--->
<div id="HAPUS#TMP_KOD#" class="fixed inset-0 flex items-center justify-center bg-gray-800 bg-opacity-50 hidden">
    <div class="bg-white rounded-lg shadow-lg w-1/2 p-0">
        <!-- Header with background color -->
        <div class="bg-[url('./assets/Background.jpg')] bg-cover bg-center text-white p-6 rounded-t-lg">
            <h2 class="text-lg font-medium text-left">Hapus PARLIMEN</h2>
        </div>
        <div class="p-6">
            <form id="form2" name="form2" method="post" action="">
                <div class="space-y-4 col-span-1"> 
                    <div class="flex items-center">
                        <span class="w-1/4 font-medium text-gray-800">Kod</span>
                        <span class="w-1/12 text-left">:</span> 
 						<input readonly name="TMP_KOD" class="w-full bg-gray-200 text-gray-800 border border-gray-400 rounded-md px-2 py-1 focus:outline-none focus:border-gray-400" type="text" value="#TMP_KOD#"/>
                    </div>
                    <div class="flex items-center">
                        <span class="w-1/4 font-medium text-gray-800">Nama</span>
                        <span class="w-1/12 text-left">:</span>
                        <input readonly name="TMP_NAMA" value="#TMP_NAMA#" class="w-full bg-gray-200 text-gray-800 border border-gray-400 rounded-md px-2 py-1 focus:outline-none focus:border-gray-400" type="text"/>
                    </div> 
                </div>
 
                <div class="grid grid-cols-3 mt-12">
                    <div class="space-y-4 col-span-3">
                        <div class="flex items-center">
                            <div class="bg-red-50 flex-grow border border-red-400 px-2 py-1">
                                PENGESAHAN: <br>
                                <input type="checkbox" name="chkbx" onClick="goFurtherHapus(this)" data-TMPkod="#TMP_KOD#">
                                <label>&nbsp;Saya sahkan maklumat yang diberikan adalah benar</label>
                            </div> 
                        </div>
                    </div>
                </div>
                <div class="grid grid-cols-2 gap-4 mt-12">
                    <div class="space-y-4 col-span-1">
                        <div class="flex items-center justify-start">
                            <button type="submit" class="w-1/2 bg-blue-200 text-white font-medium py-2 px-4 rounded cursor-not-allowed" name="HAPUS_DATA" id="HAPUS_DATA#TMP_KOD#" disabled> 
                                Simpan
                            </button>
                        </div>
                    </div>
                    <div class="space-y-4 col-span-1">
                        <div class="flex items-center justify-end"> 
                            <button type="button" id="closeHapus#TMP_KOD#" class="w-1/2 bg-gray-500 text-white font-medium py-2 px-4 rounded hover:bg-gray-700 focus:outline-none" onclick="closeHapus#TMP_KOD#()"> 
                                Kembali
                            </button>
                        </div>
                    </div>
                </div>		 
						
				
                <cfif isdefined("form.HAPUS_DATA")>
                    <cfstoredproc procedure="SP_TETAPAN_TEMPAT_PARLIMEN_HAPUS" datasource="LPN_0SYS"> 
                        <cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@LPN_KOD"  value="LPNMLK"> 
                        <cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@USER_ID"  value="ELIXTECH">  
                        <cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@PAGE_URL"  value="sppb_tetapan_tempat_PARLIMEN.cfm">
                        <cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@TMP_KOD"  value=#FORM.TMP_KOD#> 
                        <cfprocresult name = RS_HAPUS_DATA>		
                    </cfstoredproc>
                    <cfif isdefined("RS_HAPUS_DATA.RETURN_MESSAGE") AND #RS_HAPUS_DATA.RETURN_CODE# LT 0>
                        <cflocation url="sppb_tetapan_tempat_PARLIMEN.cfm?ERROR=#RS_HAPUS_DATA.RETURN_MESSAGE#">
                    <cfelse>
                        <cflocation url="sppb_tetapan_tempat_PARLIMEN.cfm">
                    </cfif>
                </cfif>
            </form>
        </div>
    </div>
</div>

<script>
    function goFurtherHapus(elem) {
        const TMPkod = elem.getAttribute('data-TMPkod');
        const saveButton = document.getElementById("HAPUS_DATA" + TMPkod);
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

    document.getElementById('openHapus#TMP_KOD#').addEventListener('click', function() {
        document.getElementById('HAPUS#TMP_KOD#').classList.remove('hidden');
    });

    document.getElementById('closeHapus#TMP_KOD#').addEventListener('click', function() {
        document.getElementById('HAPUS#TMP_KOD#').classList.add('hidden');
    }); 
</script>
<!---HAPUS MODAL--->
<!---HAPUS MODAL--->
</cfoutput>							
							
							
</cfform>
</div>
</div>
</div>
</div>

</div>

<!-- End Page -->