<cfstoredproc procedure="[SP_System_Akses_Pengguna_Login]" datasource="LPN_0SYS"> 
<cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@LPN_KOD"  value="LPNMLK" null="No">  
<cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@PAGE_URL"  value="sppb_tetapan_organisasi.cfm" null="No"> 
<cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@LOGIN_ID"  value="ELIXTECH" null="No"> 
<cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@LOGIN_PWD"  value="ELIX1833" null="No"> 
<cfprocresult name = RS_AKSES_PENGGUNA> 
</cfstoredproc>
	
<cfstoredproc procedure="SP_TETAPAN_JABATAN_CARIAN" datasource="LPN_0SYS"> 
<cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@LPN_KOD"  value="LPNMLK" null="No"> 
<cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@USER_ID"  value="ELIXTECH" null="No"> 
<cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@PAGE_URL"  value="sppb_tetapan_organisasi_jabatan.cfm" null="No"> 
<cfprocresult name = RS_JABATAN> 
</cfstoredproc> 

<cfstoredproc procedure="SP_TETAPAN_LPN_CARIAN" datasource="LPN_0SYS"> 
<cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@LPN_KOD"  value="LPNMLK" null="No"> 
<cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@USER_ID"  value="ELIXTECH" null="No"> 
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
                        TETAPAN - JABATAN
                    </h1>
                    <div class="flex items-center space-x-3">
                        <a href="sppb_tetapan_organisasi.cfm">
                            <button type="button" class="bg-transparent border border-pink-500 rounded text-gray-100 font-regular py-2 px-4 hover:bg-gray-400 transition duration-200 focus:outline-none focus:ring focus:ring-gray-300">
                            Organisasi
                            </button>
                        </a>
                        <a href="sppb_tetapan_organisasi_jabatan.cfm">
                            <button type="button" class="bg-purple-600 border border-pink-500 rounded text-gray-100 font-regular py-2 px-4  hover:bg-gray-400 transition duration-200 focus:outline-none focus:ring focus:ring-gray-300">
                            Jabatan/Unit
                            </button>
                        </a>
                    </div>
                </div>  
                <div class="w-full py-2 px-4 border-b border-gray-300">
                    <div class="flex justify-between items-center">
                        <h1 class="text-2xl font-semibold text-gray-900 sm:text-2xl md:text-2xl">
                            Jabatan - Senarai Tetapan Jabatan
                        </h1>
                        <cfif #RS_AKSES_PENGGUNA.USR_CTL_TETAPAN_SISTEM# CONTAINS 'E'> 
                            <button id="openDaftar" type="button" class="bg-green-500 hover:bg-green-600 text-white py-2 px-4 rounded w-32">
                            Daftar
                            </button>
                        </cfif>
                    </div>
                </div>  
                
                <div class="flex items-center justify-end px-4 py-2">
                    Bilangan Rekod : <cfoutput>#RS_JABATAN.RecordCount#</cfoutput>
                </div>

        
                <div class="panel-body-12 px-4">
                <table class="min-w-full border border-gray-300">
                    <thead class="bg-gray-200">
                    <tr align="center">
                        <th class="border border-gray-300 py-2 px-4" style="width: 5%;">No.</th>
                        <th class="border border-gray-300 py-2 px-4" style="width: 30%;">Jabatan / Unit</th>
                        <th class="border border-gray-300 py-2 px-4" style="width: 15%;">Kod</th>
                        <th class="border border-gray-300 py-2 px-4" style="width: 30%;">Catatan</th>
                        <th class="border border-gray-300 py-2 px-4" style="width: 20%;">Tindakan</th>
                    </tr>
                    </thead>

                    <tbody>
                    <cfoutput query="RS_JABATAN">
                        <tr class="border-t">
                        <td class="border border-gray-300 text-center py-2"><p>#CurrentRow#.</p></td>
                        <td class="border border-gray-300 py-2 px-4">#JAB_NAMA#</td>
                        <td class="border border-gray-300 py-2 px-4"><p>#JAB_KOD#</p></td>
                        <td class="border border-gray-300 py-2 px-4">#JAB_CATATAN#</td>
                        <td class="border border-gray-300 py-2 px-4 text-center"> 
                            <button id="openKemaskini#JAB_KOD#" type="button" class="bg-green-500 hover:bg-green-600 text-white py-2 px-4 rounded">
                            Kemaskini
                            </button>  
                            <button id="openHapus#JAB_KOD#" type="button" class="bg-red-500 text-white py-2 px-4 rounded hover:bg-red-700 transition duration-200 mt-2">
                                Hapus 
                            </button> 
                        </td>
                        </tr>
                    </cfoutput>
                    </tbody>
                </table>  
                </div> 
            </div> 
		  

<!---DAFTAR MODAL---> 
<!---DAFTAR MODAL--->
<div id="DAFTAR" class="fixed inset-0 flex items-center justify-center bg-gray-800 bg-opacity-50 hidden">
    <div class="bg-white rounded-lg shadow-lg w-1/2 p-0">
        <!-- Header with background color -->
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
</script>
<!---DAFTAR MODAL--->
<!---DAFTAR MODAL--->
							
 <cfoutput query="RS_JABATAN">						
<!---KEMASKINI MODAL---> 
<!---KEMASKINI MODAL--->
<div id="KEMASKINI#JAB_KOD#" class="fixed inset-0 flex items-center justify-center bg-gray-800 bg-opacity-50 hidden">
    <div class="bg-white rounded-lg shadow-lg w-1/2 p-0">
        <!-- Header with background color -->
        <div class="bg-[url('./assets/Background.jpg')] bg-cover bg-center text-white p-6 rounded-t-lg">
            <h2 class="text-lg font-medium text-left">Kemaskini Jabatan</h2>
        </div>
        <div class="p-6">
            <form id="form2" name="form2" method="post" action="">
                <div class="space-y-4 col-span-1"> 
                    <div class="flex items-center">
                        <span class="w-1/4 font-medium text-gray-800">Kod</span>
                        <span class="w-1/12 text-left">:</span> 
 						<input readonly name="JAB_KOD" class="w-full bg-gray-200 text-gray-800 border border-gray-400 rounded-md px-2 py-1 focus:outline-none focus:border-gray-400" type="text" value="#JAB_KOD#"/>
                    </div>
                    <div class="flex items-center">
                        <span class="w-1/4 font-medium text-gray-800">Nama</span>
                        <span class="w-1/12 text-left">:</span>
                        <input name="JAB_NAMA" value="#JAB_NAMA#" class="w-full text-gray-800 border border-gray-400 rounded-md px-2 py-1" type="text"/>
                    </div>
                    <div class="flex items-center">
                        <span class="w-1/4 font-medium text-gray-800">Catatan</span>
                        <span class="w-1/12 text-left">:</span>
                        <input name="JAB_CATATAN" value="#JAB_CATATAN#" class="w-full text-gray-800 border border-gray-400 rounded-md px-2 py-1" type="text"/>
                    </div> 
                </div>
 
                <div class="grid grid-cols-3 mt-12">
                    <div class="space-y-4 col-span-3">
                        <div class="flex items-center">
                            <div class="bg-red-50 flex-grow border border-red-400 px-2 py-1">
                                PENGESAHAN: <br>
                                <input type="checkbox" name="chkbx" onClick="goFurtherKemaskini(this)" data-jabkod="#JAB_KOD#">
                                <label>&nbsp;Saya sahkan maklumat yang diberikan adalah benar</label>
                            </div> 
                        </div>
                    </div>
                </div>
                <div class="grid grid-cols-2 gap-4 mt-12">
                    <div class="space-y-4 col-span-1">
                        <div class="flex items-center justify-start">
                            <button type="submit" class="w-1/2 bg-blue-200 text-white font-medium py-2 px-4 rounded cursor-not-allowed" name="KEMASKINI_DATA" id="KEMASKINI_DATA#JAB_KOD#" disabled> 
                                Simpan
                            </button>
                        </div>
                    </div>
                    <div class="space-y-4 col-span-1">
                        <div class="flex items-center justify-end"> 
                            <button type="button" id="closeKemaskini#JAB_KOD#" class="w-1/2 bg-gray-500 text-white font-medium py-2 px-4 rounded hover:bg-gray-700 focus:outline-none" onclick="closeKemaskini#JAB_KOD#()"> 
                                Kembali
                            </button>
                        </div>
                    </div>
                </div>		 
						
					<input type="hidden" name="JAB_KOD" value="#RS_JABATAN.JAB_KOD#">
				
                <cfif isdefined("form.KEMASKINI_DATA")>
                    <cfstoredproc procedure="SP_TETAPAN_JABATAN_SIMPAN" datasource="LPN_0SYS"> 
                        <cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@LPN_KOD"  value="LPNMLK"> 
                        <cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@USER_ID"  value="ELIXTECH">  
                        <cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@PAGE_URL"  value="sppb_tetapan_organisasi_jabatan.cfm">
                        <cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@JAB_KOD"  value="#FORM.JAB_KOD#">
                        <cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@JAB_NAMA"  value="#FORM.JAB_NAMA#">
                        <cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@JAB_CATATAN"  value="#FORM.JAB_CATATAN#"> 
                        <cfprocresult name = RS_KEMASKINI_DATA>		
                    </cfstoredproc>

                    <cfif isdefined("RS_KEMASKINI_DATA.RETURN_MESSAGE") AND #RS_KEMASKINI_DATA.RETURN_CODE# LT 0>
                        <cflocation url="sppb_tetapan_organisasi_jabatan.cfm?ERROR=#RS_KEMASKINI_DATA.RETURN_MESSAGE#">
                    <cfelse>
                        <cflocation url="sppb_tetapan_organisasi_jabatan.cfm">
                    </cfif>
                </cfif>
            </form>
        </div>
    </div>
</div>

<script>
    function goFurtherKemaskini(elem) {
        const jabkod = elem.getAttribute('data-jabkod');
        const saveButton = document.getElementById("KEMASKINI_DATA" + jabkod);
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

    document.getElementById('openKemaskini#JAB_KOD#').addEventListener('click', function() {
        document.getElementById('KEMASKINI#JAB_KOD#').classList.remove('hidden');
    });

    document.getElementById('closeKemaskini#JAB_KOD#').addEventListener('click', function() {
        document.getElementById('KEMASKINI#JAB_KOD#').classList.add('hidden');
    }); 
</script>
<!---KEMASKINI MODAL--->
<!---KEMASKINI MODAL--->
							
							
<!---HAPUS MODAL---> 
<!---HAPUS MODAL--->
<div id="HAPUS#JAB_KOD#" class="fixed inset-0 flex items-center justify-center bg-gray-800 bg-opacity-50 hidden">
    <div class="bg-white rounded-lg shadow-lg w-1/2 p-0">
        <!-- Header with background color -->
        <div class="bg-[url('./assets/Background.jpg')] bg-cover bg-center text-white p-6 rounded-t-lg">
            <h2 class="text-lg font-medium text-left">Hapus Jabatan</h2>
        </div>
        <div class="p-6">
            <form id="form2" name="form2" method="post" action="">
                <div class="space-y-4 col-span-1"> 
                    <div class="flex items-center">
                        <span class="w-1/4 font-medium text-gray-800">Kod</span>
                        <span class="w-1/12 text-left">:</span> 
 						<input readonly name="JAB_KOD" class="w-full bg-gray-200 text-gray-800 border border-gray-400 rounded-md px-2 py-1 focus:outline-none focus:border-gray-400" type="text" value="#JAB_KOD#"/>
                    </div>
                    <div class="flex items-center">
                        <span class="w-1/4 font-medium text-gray-800">Nama</span>
                        <span class="w-1/12 text-left">:</span>
                        <input readonly name="JAB_NAMA" value="#JAB_NAMA#" class="w-full bg-gray-200 text-gray-800 border border-gray-400 rounded-md px-2 py-1 focus:outline-none focus:border-gray-400" type="text"/>
                    </div> 
                </div>
 
                <div class="grid grid-cols-3 mt-12">
                    <div class="space-y-4 col-span-3">
                        <div class="flex items-center">
                            <div class="bg-red-50 flex-grow border border-red-400 px-2 py-1">
                                PENGESAHAN: <br>
                                <input type="checkbox" name="chkbx" onClick="goFurtherHapus(this)" data-jabkod="#JAB_KOD#">
                                <label>&nbsp;Saya sahkan maklumat yang diberikan adalah benar</label>
                            </div> 
                        </div>
                    </div>
                </div>
                <div class="grid grid-cols-2 gap-4 mt-12">
                    <div class="space-y-4 col-span-1">
                        <div class="flex items-center justify-start">
                            <button type="submit" class="w-1/2 bg-blue-200 text-white font-medium py-2 px-4 rounded cursor-not-allowed" name="HAPUS_DATA" id="HAPUS_DATA#JAB_KOD#" disabled> 
                                Simpan
                            </button>
                        </div>
                    </div>
                    <div class="space-y-4 col-span-1">
                        <div class="flex items-center justify-end"> 
                            <button type="button" id="closeHapus#JAB_KOD#" class="w-1/2 bg-gray-500 text-white font-medium py-2 px-4 rounded hover:bg-gray-700 focus:outline-none" onclick="closeHapus#JAB_KOD#()"> 
                                Kembali
                            </button>
                        </div>
                    </div>
                </div>		 
						
					<input type="hidden" name="JAB_KOD" value="#RS_JABATAN.JAB_KOD#">
				
                <cfif isdefined("form.HAPUS_DATA")>
                    <cfstoredproc procedure="SP_TETAPAN_JABATAN_HAPUS" datasource="LPN_0SYS"> 
                        <cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@LPN_KOD"  value="LPNMLK"> 
                        <cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@USER_ID"  value="ELIXTECH">  
                        <cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@PAGE_URL"  value="sppb_tetapan_organisasi_jabatan.cfm">
                        <cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@JAB_KOD"  value="#FORM.JAB_KOD#"> 
                        <cfprocresult name = RS_HAPUS_DATA>		
                    </cfstoredproc>

                    <cfif isdefined("RS_HAPUS_DATA.RETURN_MESSAGE") AND #RS_HAPUS_DATA.RETURN_CODE# LT 0>
                        <cflocation url="sppb_tetapan_organisasi_jabatan.cfm?ERROR=#RS_HAPUS_DATA.RETURN_MESSAGE#">
                    <cfelse>
                        <cflocation url="sppb_tetapan_organisasi_jabatan.cfm">
                    </cfif>
                </cfif>
            </form>
        </div>
    </div>
</div>

<script>
    function goFurtherHapus(elem) {
        const jabkod = elem.getAttribute('data-jabkod');
        const saveButton = document.getElementById("HAPUS_DATA" + jabkod);
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

    document.getElementById('openHapus#JAB_KOD#').addEventListener('click', function() {
        document.getElementById('HAPUS#JAB_KOD#').classList.remove('hidden');
    });

    document.getElementById('closeHapus#JAB_KOD#').addEventListener('click', function() {
        document.getElementById('HAPUS#JAB_KOD#').classList.add('hidden');
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