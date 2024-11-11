<cfif isDefined("URL.MJK_KOD")>
<cfparam name="FORM.MJK_KOD" default="#URL.MJK_KOD#">
<cfelse>
<cfparam name="FORM.MJK_KOD" default="">
</cfif>
<cfparam name="FORM.TMD_NAMA" default="">

<cfstoredproc procedure="[SP_System_Akses_Pengguna_Login]" datasource="LPN_0SYS"> 
<cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@LPN_KOD"  value="#Session.LPN_CODE#" null="No">  
<cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@PAGE_URL"  value="sppb_tetapan_tempat_daerah.cfm" null="No"> 
<cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@LOGIN_ID"  value="#Session.SS_USR_ID#" null="No"> 
<cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@LOGIN_PWD"  value="#Session.SS_USR_PWD#" null="No"> 
<cfprocresult name = RS_AKSES_PENGGUNA> 
</cfstoredproc>
<cfstoredproc procedure="SP_TETAPAN_PEMAJU_KATEGORI_CARIAN" datasource="LPN_0SYS"> 
<cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@LPN_KOD"  value="#Session.LPN_CODE#" null="No"> 
<cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@USER_ID"  value="#Session.SS_USR_ID#" null="No"> 
<cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@PAGE_URL"  value="sppb_tetapan_tempat_daerah.cfm" null="No">

<cfprocresult name = RS_PEMAJU> 
</cfstoredproc> 

<cfstoredproc procedure="SP_TETAPAN_LPN_CARIAN" datasource="LPN_0SYS"> 
<cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@LPN_KOD"  value="#Session.LPN_CODE#" null="No"> 
<cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@USER_ID"  value="#Session.SS_USR_ID#" null="No"> 
<cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@PAGE_URL"  value="sppb_tetapan_tempat_daerah.cfm" null="No"> 
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
    <div class="flex flex-col">
      <div class="card p-8"> 
        <cfform id="form1" name="form1" method="post" action="" class="flex flex-col space-y-4">
            <div class="flex flex-col shadow-md pb-8 h-auto">
                <div class="flex items-center justify-between py-2 px-4 bg-[#580588] rounded-t-lg" data-plugin="appear" data-animate="fade">
                    <h1 class="text-lg font-semibold text-gray-100 sm:text-lg md:text-lg">
                        TETAPAN - PEMAJU - KATEGORI
                    </h1>
                </div>  
                <div class="w-full py-2 px-4 border-b border-gray-300">
                    <div class="flex justify-between items-center">
                        <h1 class="text-2xl font-semibold text-gray-900 sm:text-2xl md:text-2xl">
                            Senarai Tetapan Daerah
                        </h1>
                        <cfif #RS_AKSES_PENGGUNA.USR_CTL_TETAPAN_SISTEM# CONTAINS 'E'> 
                            <button id="openDaftar" type="button" class="flex gap-2 items-center justify-center bg-green-500 hover:bg-green-600 text-white py-2 px-4 rounded w-32">
                            Daftar
                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" class="size-5">
                                <path fill-rule="evenodd" d="M10 18a8 8 0 1 0 0-16 8 8 0 0 0 0 16Zm.75-11.25a.75.75 0 0 0-1.5 0v2.5h-2.5a.75.75 0 0 0 0 1.5h2.5v2.5a.75.75 0 0 0 1.5 0v-2.5h2.5a.75.75 0 0 0 0-1.5h-2.5v-2.5Z" clip-rule="evenodd" />
                            </svg>
                            </button>
                        </cfif>
                    </div>
                </div>  
                
                <div class="flex items-center justify-end px-4 py-2">
                    Bilangan Rekod : <cfoutput>#RS_PEMAJU.RecordCount#</cfoutput>
                </div>

        
                <div class="min-w-full panel-body-12 px-4">
                    <div class="overflow-x-auto">
                        <table class="min-w-full border border-gray-300">
                            <thead class="bg-gray-200">
                                <tr align="center">
                                    <th class="border border-gray-300 py-2 px-4 font-medium" style="width: 5%;">No.</th>
                                    <th class="border border-gray-300 py-2 px-4 font-medium" style="width: 30%;">Kategori</th>
                                    <th class="border border-gray-300 py-2 px-4 font-medium" style="width: 20%;">Tamat</th>
                                    <th class="border border-gray-300 py-2 px-4 font-medium" style="width: 20%;">Tindakan</th>
                                </tr>
                            </thead>
                            <tbody>
                                <cfoutput query="RS_PEMAJU">
                                    <tr class="border-t">
                                        <td class="border border-gray-300 text-center py-2">
                                            <p>#CurrentRow#.</p>
                                        </td>
                                        <td class="border border-gray-300 py-2 px-4">
                                            #MJK_KETER# <cfif #RS_AKSES_PENGGUNA.USR_ROLES_SUPER# EQ 'Y'>(#MJK_KOD#)</cfif>
                                        </td>
                                        <td class="border border-gray-300 py-2 px-4">
                                            #dateFormat(MJK_TAMAT_TKH, "dd/mm/yyyy")#
                                        </td>
                                        <td class="border border-gray-300 py-2 px-2 text-center"> 
                                            <div class="flex flex-row justify-center items-center gap-2">
                                                <div class="flex flex-col items-center">
                                                    <!-- Toggle Button -->
                                                    <button 
                                                        type="button"
                                                        id="ubahButton" 
                                                        class="flex items-center justify center gap-2 relative ubahButton bg-blue-500 hover:bg-blue-600 text-white py-2 px-4 rounded transition duration-300"
                                                        data-kod="#MJK_KOD#">
                                                        Ubah
                                                        <svg class="w-6 h-6 text-gray-800 dark:text-white" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="none" viewBox="0 0 24 24">
                                                            <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="m8 10 4 4 4-4"/>
                                                        </svg>

                                                    </button>

                                                    <!-- Container for the hidden buttons -->
                                                    <div 
                                                        id="actionButtons-#MJK_KOD#" 
                                                        class="absolute mt-12 z-[100] flex flex-col  items-center justify-center hidden bg-gray-200 rounded transition-all duration-300 opacity-0 transform scale-95 shadow-lg">
                                                        
                                                        <!-- Kemaskini Button -->
                                                        <button 
                                                            id="openKemaskini#MJK_KOD#" 
                                                            type="button" 
                                                            class="w-full flex gap-2 items-center justify-start text-gray-700 py-2 px-4 rounded transition duration-300 hover:bg-gray-300">
                                                            Kemaskini
                                                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" class="w-5 h-5">
                                                                <path d="M5.433 13.917l1.262-3.155a4 4 0 0 1 0.885-1.342l6.92-6.918a2.121 2.121 0 0 1 3 3l-6.92 6.918c-.383.383-.84.685-1.343.886l-3.154 1.262a.5.5 0 0 1-.65-.65Z" />
                                                            </svg>
                                                        </button>
                                                        <button 
                                                            id="openTamat#MJK_KOD#" 
                                                            type="button" 
                                                            class="w-full flex gap-2 items-center justify-start text-gray-700 py-2 px-4 rounded transition duration-300 hover:bg-gray-300">
                                                            Tamat
                                                            <svg class="w-5 h-5 text-gray-700" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" viewBox="0 0 24 24">
                                                                <path fill-rule="evenodd" d="M6 5V4a1 1 0 1 1 2 0v1h3V4a1 1 0 1 1 2 0v1h3V4a1 1 0 1 1 2 0v1h1a2 2 0 0 1 2 2v2H3V7a2 2 0 0 1 2-2h1ZM3 19v-8h18v8a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2Zm5-6a1 1 0 1 0 0 2h8a1 1 0 1 0 0-2H8Z" clip-rule="evenodd"/>
                                                            </svg>

                                                        </button>
                                                        
                                                    
                                                    </div>
                                                </div>
                                                 <!-- Hapus Button -->
                                                    <button 
                                                        id="openHapus#MJK_KOD#" 
                                                        type="button" 
                                                        class="flex gap-2 items-center justify-start text-white py-2 px-4 rounded transition duration-300 bg-red-500 hover:bg-red-600">
                                                        Hapus
                                                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" class="w-5 h-5">
                                                            <path fill-rule="evenodd" d="M8.75 1A2.75 2.75 0 0 0 6 3.75v0.443c-.795 0.077-1.584 0.176-2.365 0.298a.75.75 0 1 0 0.23 1.482l0.841 10.518A2.75 2.75 0 0 0 7.596 19h4.807a2.75 2.75 0 0 0 2.742-2.53l0.841-10.52 0.149 0.023a.75.75 0 0 0 0.23-1.482A41.03 41.03 0 0 0 14 4.193V3.75A2.75 2.75 0 0 0 11.25 1h-2.5ZM10 4c0.84 0 1.673 0.025 2.5 0.075V3.75c0-0.69-0.56-1.25-1.25-1.25h-2.5c-0.69 0-1.25 0.56-1.25 1.25v0.325C8.327 4.025 9.16 4 10 4ZM8.58 7.72a.75.75 0 0 0-1.5 0.06l0.3 7.5a.75.75 0 0 0 1.5-0.06l-0.3-7.5Zm4.34 0.06a.75.75 0 1 0-1.5 0l-0.3 7.5a.75.75 0 1 0 1.5 0.06l0.3-7.5Z" clip-rule="evenodd" />
                                                        </svg>
                                                    </button>
                                            </div>

                                        </td>
                                    </tr>
                                </cfoutput>
                            </tbody>
                        </table>
                    </div>
                </div>

            </div> 
            <script>
                document.querySelectorAll('.ubahButton').forEach(button => {
                    button.addEventListener('click', (event) => {
                        const mjkKod = event.currentTarget.getAttribute('data-kod');
                        const actionButtons = document.getElementById(`actionButtons-${mjkKod}`);

                        // Check if the action buttons are already visible
                        const isVisible = !actionButtons.classList.contains('hidden');

                        // Hide all action buttons with a fade-out effect
                        document.querySelectorAll('[id^="actionButtons-"]').forEach(div => {
                            div.classList.add('opacity-0', 'scale-95', 'pointer-events-none'); // Fade-out & scale down
                            div.classList.remove('opacity-100', 'scale-100');
                        });

                        if (isVisible) {
                            // If already visible, hide the clicked action buttons
                            setTimeout(() => actionButtons.classList.add('hidden'), 300); // Hide after transition
                        } else {
                            // Show the selected action buttons with a fade-in effect
                            actionButtons.classList.remove('hidden', 'pointer-events-none');
                            setTimeout(() => {
                                actionButtons.classList.remove('opacity-0', 'scale-95');
                                actionButtons.classList.add('opacity-100', 'scale-100');
                            }, 10); // Delay slightly to allow the transition to apply
                        }
                    });
                });

                document.querySelectorAll('[id^="openKemaskini"], [id^="openTamat"]').forEach(button => {
                    button.addEventListener('click', (event) => {
                        // Get the mjkKod from the button's id
                        const mjkKod = event.currentTarget.id.replace(/\D*(\d+)$/, '$1');
                        const actionButtons = document.getElementById(`actionButtons-${mjkKod}`);
                        // Hide the action buttons when either Kemaskini or Tamat is clicked
                        actionButtons.classList.add('opacity-0', 'scale-95', 'pointer-events-none');
                        actionButtons.classList.remove('opacity-100', 'scale-100');
                        
                        setTimeout(() => {
                            actionButtons.classList.add('hidden'); // Hide after transition
                        }, 300); // Wait for the fade-out transition
                    });
                });
            </script>

            <!---DAFTAR MODAL---> 
            <!---DAFTAR MODAL--->
            <div id="DAFTAR" class="fixed inset-0 flex items-center justify-center bg-gray-800 bg-opacity-50 hidden">
                <div class="bg-white rounded-lg shadow-lg w-1/2 p-0">
                    <!-- Header with background color -->
                    <div class="bg-[url('./assets/Background.jpg')] bg-cover bg-center text-white p-6 rounded-t-lg">
                        <h2 class="text-lg font-medium text-left">Daftar Kategori Pemaju</h2>
                    </div>
                    <div class="p-6">
                        <form id="form2" name="form2" method="post" action="">
                            <div class="space-y-4 col-span-1"> 
                                <div class="flex items-center">
                                    <span class="w-1/4 font-medium text-gray-800">Nama</span>
                                    <span class="w-1/12 text-left">:</span>
                                    <input name="MJK_KETER" class="w-full text-gray-800 border border-gray-400 rounded-md px-2 py-1" type="text"/>
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
                                        <button type="submit" class="flex gap-2 items-center justify-center w-1/2 bg-blue-200 text-white font-medium py-2 px-4 rounded cursor-not-allowed" name="DAFTAR_DATA" id="DAFTAR_DATA" disabled> 
                                            Simpan
                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-floppy2" viewBox="0 0 16 16">
                                                <path d="M1.5 0h11.586a1.5 1.5 0 0 1 1.06.44l1.415 1.414A1.5 1.5 0 0 1 16 2.914V14.5a1.5 1.5 0 0 1-1.5 1.5h-13A1.5 1.5 0 0 1 0 14.5v-13A1.5 1.5 0 0 1 1.5 0M1 1.5v13a.5.5 0 0 0 .5.5H2v-4.5A1.5 1.5 0 0 1 3.5 9h9a1.5 1.5 0 0 1 1.5 1.5V15h.5a.5.5 0 0 0 .5-.5V2.914a.5.5 0 0 0-.146-.353l-1.415-1.415A.5.5 0 0 0 13.086 1H13v3.5A1.5 1.5 0 0 1 11.5 6h-7A1.5 1.5 0 0 1 3 4.5V1H1.5a.5.5 0 0 0-.5.5m9.5-.5a.5.5 0 0 0-.5.5v3a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-3a.5.5 0 0 0-.5-.5z"/>
                                            </svg>
                                        </button>
                                    </div>
                                </div>
                                <div class="space-y-4 col-span-1">
                                    <div class="flex items-center justify-end"> 
                                        <button type="button" id="closeDaftar" class="flex gap-2 items-center justify-center w-1/2 bg-gray-500 text-white font-medium py-2 px-4 rounded hover:bg-gray-700 focus:outline-none" onclick="closeDaftar()"> 
                                            Kembali
                                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" class="size-5">
                                                <path fill-rule="evenodd" d="M7.793 2.232a.75.75 0 0 1-.025 1.06L3.622 7.25h10.003a5.375 5.375 0 0 1 0 10.75H10.75a.75.75 0 0 1 0-1.5h2.875a3.875 3.875 0 0 0 0-7.75H3.622l4.146 3.957a.75.75 0 0 1-1.036 1.085l-5.5-5.25a.75.75 0 0 1 0-1.085l5.5-5.25a.75.75 0 0 1 1.06.025Z" clip-rule="evenodd" />
                                            </svg>
                                        </button>
                                    </div>
                                </div>
                            </div>		 

                            <cfif isdefined("form.DAFTAR_DATA")>
                                <cfstoredproc procedure="SP_TETAPAN_PEMAJU_KATEGORI_SIMPAN" datasource="LPN_0SYS"> 
                                    <cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@LPN_KOD"  value="#Session.LPN_CODE#"> 
                                    <cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@USER_ID"  value="#Session.SS_USR_ID#">  
                                    <cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@PAGE_URL"  value="sppb_tetapan_tempat_daerah.cfm">
                                    <cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@ADD_NEW"  value="Y">
                                    <cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@MJK_KETER"  value="#FORM.MJK_KETER#">
                                    <cfprocresult name = RS_MASUK_DATA>		
                                </cfstoredproc>

                                <cfif isdefined("RS_MASUK_DATA.RETURN_MESSAGE") AND #RS_MASUK_DATA.RETURN_CODE# LT 0>
                                    <cflocation url="sppb_tetapan_pemaju.cfm?ERROR=#RS_MASUK_DATA.RETURN_MESSAGE#">
                                <cfelse>
                                    <cflocation url="sppb_tetapan_pemaju.cfm">
                                </cfif>
                            </cfif>
                        </form>
                    </div>
                </div>
            </div>

            <script>
                function goFurther(elem) {
                    const saveButton = document.getElementById("DAFTAR_DATA");
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
                                    
            <cfoutput query="RS_PEMAJU">						
                <!---KEMASKINI MODAL---> 
                <!---KEMASKINI MODAL--->
                <div id="KEMASKINI#MJK_KOD#" class="fixed inset-0 flex items-center justify-center bg-gray-800 bg-opacity-50 hidden">
                    <div class="bg-white rounded-lg shadow-lg w-1/2 p-0">
                        <!-- Header with background color -->
                        <div class="bg-[url('./assets/Background.jpg')] bg-cover bg-center text-white p-6 rounded-t-lg">
                            <h2 class="text-lg font-medium text-left">Kemaskini Daerah</h2>
                        </div>
                        <div class="p-6">
                            <form id="form2" name="form2" method="post" action="">
                                <div class="space-y-4 col-span-1"> 
                                    <div class="flex items-center">
                                        <span class="w-1/4 font-medium text-gray-800">Kod</span>
                                        <span class="w-1/12 text-left">:</span> 
                                        <input readonly name="MJK_KOD" class="w-full bg-gray-200 text-gray-800 border border-gray-400 rounded-md px-2 py-1 focus:outline-none focus:border-gray-400" type="number" value="#MJK_KOD#"/>
                                    </div>
                                    <div class="flex items-center">
                                        <span class="w-1/4 font-medium text-gray-800">Nama</span>
                                        <span class="w-1/12 text-left">:</span>
                                        <input name="MJK_KETER" value="#MJK_KETER#" class="w-full text-gray-800 border border-gray-400 rounded-md px-2 py-1" type="text"/>
                                    </div>
                                </div>
                
                                <div class="grid grid-cols-3 mt-12">
                                    <div class="space-y-4 col-span-3">
                                        <div class="flex items-center">
                                            <div class="bg-red-50 flex-grow border border-red-400 px-2 py-1">
                                                PENGESAHAN: <br>
                                                <input type="checkbox" name="chkbx" onClick="goFurtherKemaskini(this)" data-mjkkod="#MJK_KOD#">
                                                <label>&nbsp;Saya sahkan maklumat yang diberikan adalah benar</label>
                                            </div> 
                                        </div>
                                    </div>
                                </div>
                                <div class="grid grid-cols-2 gap-4 mt-12">
                                    <div class="space-y-4 col-span-1">
                                        <div class="flex items-center justify-start">
                                            <button type="submit" class="flex gap-2 items-center justify-center w-1/2 bg-blue-200 text-white font-medium py-2 px-4 rounded cursor-not-allowed" name="KEMASKINI_DATA" id="KEMASKINI_DATA#MJK_KOD#" disabled> 
                                                Simpan
                                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-floppy2" viewBox="0 0 16 16">
                                                    <path d="M1.5 0h11.586a1.5 1.5 0 0 1 1.06.44l1.415 1.414A1.5 1.5 0 0 1 16 2.914V14.5a1.5 1.5 0 0 1-1.5 1.5h-13A1.5 1.5 0 0 1 0 14.5v-13A1.5 1.5 0 0 1 1.5 0M1 1.5v13a.5.5 0 0 0 .5.5H2v-4.5A1.5 1.5 0 0 1 3.5 9h9a1.5 1.5 0 0 1 1.5 1.5V15h.5a.5.5 0 0 0 .5-.5V2.914a.5.5 0 0 0-.146-.353l-1.415-1.415A.5.5 0 0 0 13.086 1H13v3.5A1.5 1.5 0 0 1 11.5 6h-7A1.5 1.5 0 0 1 3 4.5V1H1.5a.5.5 0 0 0-.5.5m9.5-.5a.5.5 0 0 0-.5.5v3a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-3a.5.5 0 0 0-.5-.5z"/>
                                                </svg>
                                            </button>
                                        </div>
                                    </div>
                                    <div class="space-y-4 col-span-1">
                                        <div class="flex items-center justify-end"> 
                                            <button type="button" id="closeKemaskini#MJK_KOD#" class="flex gap-2 items-center justify-center w-1/2 bg-gray-500 text-white font-medium py-2 px-4 rounded hover:bg-gray-700 focus:outline-none" onclick="closeKemaskini#MJK_KOD#()"> 
                                                Kembali
                                                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" class="size-5">
                                                    <path fill-rule="evenodd" d="M7.793 2.232a.75.75 0 0 1-.025 1.06L3.622 7.25h10.003a5.375 5.375 0 0 1 0 10.75H10.75a.75.75 0 0 1 0-1.5h2.875a3.875 3.875 0 0 0 0-7.75H3.622l4.146 3.957a.75.75 0 0 1-1.036 1.085l-5.5-5.25a.75.75 0 0 1 0-1.085l5.5-5.25a.75.75 0 0 1 1.06.025Z" clip-rule="evenodd" />
                                                </svg>  
                                            </button>
                                        </div>
                                    </div>
                                </div>		 
                                        
                                
                                <cfif isdefined("form.KEMASKINI_DATA")>
                                    <cfstoredproc procedure="SP_TETAPAN_PEMAJU_KATEGORI_SIMPAN" datasource="LPN_0SYS"> 
                                        <cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@LPN_KOD"  value="#Session.LPN_CODE#"> 
                                        <cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@USER_ID"  value="#Session.SS_USR_ID#">  
                                        <cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@PAGE_URL"  value="sppb_tetapan_tempat_daerah.cfm">
                                        <cfprocparam cfsqltype="CF_SQL_INTEGER" dbvarname="@MJK_KOD"  value=#FORM.MJK_KOD#>
                                        <cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@MJK_KETER"  value="#FORM.MJK_KETER#">
                                        <cfprocresult name = RS_KEMASKINI_DATA>		
                                    </cfstoredproc>

                                    <cfif isdefined("RS_KEMASKINI_DATA.RETURN_MESSAGE") AND #RS_KEMASKINI_DATA.RETURN_CODE# LT 0>
                                        <cflocation url="sppb_tetapan_pemaju.cfm?ERROR=#RS_KEMASKINI_DATA.RETURN_MESSAGE#">
                                    <cfelse>
                                        <cflocation url="sppb_tetapan_pemaju.cfm">
                                    </cfif>
                                </cfif>
                            </form>
                        </div>
                    </div>
                </div>

                <script>
                    function goFurtherKemaskini(elem) {
                        const mjkkod = elem.getAttribute('data-mjkkod');
                        const saveButton = document.getElementById("KEMASKINI_DATA" + mjkkod);
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

                    document.getElementById('openKemaskini#MJK_KOD#').addEventListener('click', function() {
                        document.getElementById('KEMASKINI#MJK_KOD#').classList.remove('hidden');
                    });

                    document.getElementById('closeKemaskini#MJK_KOD#').addEventListener('click', function() {
                        document.getElementById('KEMASKINI#MJK_KOD#').classList.add('hidden');
                    }); 
                </script>
                <!---KEMASKINI MODAL--->
                <!---KEMASKINI MODAL--->
                                            
                                            
                <!---HAPUS MODAL---> 
                <!---HAPUS MODAL--->
                <div id="HAPUS#MJK_KOD#" class="fixed inset-0 flex items-center justify-center bg-gray-800 bg-opacity-50 hidden">
                    <div class="bg-white rounded-lg shadow-lg w-1/2 p-0">
                        <!-- Header with background color -->
                        <div class="bg-[url('./assets/Background.jpg')] bg-cover bg-center text-white p-6 rounded-t-lg">
                            <h2 class="text-lg font-medium text-left">Hapus Daerah</h2>
                        </div>
                        <div class="p-6">
                            <form id="form2" name="form2" method="post" action="">
                                <div class="space-y-4 col-span-1"> 
                                    <div class="flex items-center">
                                        <span class="w-1/4 font-medium text-gray-800">Kod</span>
                                        <span class="w-1/12 text-left">:</span> 
                                        <input readonly name="MJK_KOD" class="w-full bg-gray-200 text-gray-800 border border-gray-400 rounded-md px-2 py-1 focus:outline-none focus:border-gray-400" type="text" value="#MJK_KOD#"/>
                                    </div>
                                    <div class="flex items-center">
                                        <span class="w-1/4 font-medium text-gray-800">Nama</span>
                                        <span class="w-1/12 text-left">:</span>
                                        <input readonly name="MJK_KETER" value="#MJK_KETER#" class="w-full bg-gray-200 text-gray-800 border border-gray-400 rounded-md px-2 py-1 focus:outline-none focus:border-gray-400" type="text"/>
                                    </div> 
                                </div>
                
                                <div class="grid grid-cols-3 mt-12">
                                    <div class="space-y-4 col-span-3">
                                        <div class="flex items-center">
                                            <div class="bg-red-50 flex-grow border border-red-400 px-2 py-1">
                                                PENGESAHAN: <br>
                                                <input type="checkbox" name="chkbx" onClick="goFurtherHapus(this)" data-mjkkod="#MJK_KOD#">
                                                <label>&nbsp;Saya sahkan maklumat yang diberikan adalah benar</label>
                                            </div> 
                                        </div>
                                    </div>
                                </div>
                                <div class="grid grid-cols-2 gap-4 mt-12">
                                    <div class="space-y-4 col-span-1">
                                        <div class="flex items-center justify-start">
                                            <button type="submit" class="flex gap-2 items-center justify-center w-1/2 bg-red-200 text-white font-medium py-2 px-4 rounded cursor-not-allowed" name="HAPUS_DATA" id="HAPUS_DATA#MJK_KOD#" disabled> 
                                                Hapus
                                                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" class="size-5">
                                                    <path fill-rule="evenodd" d="M8.75 1A2.75 2.75 0 0 0 6 3.75v.443c-.795.077-1.584.176-2.365.298a.75.75 0 1 0 .23 1.482l.149-.022.841 10.518A2.75 2.75 0 0 0 7.596 19h4.807a2.75 2.75 0 0 0 2.742-2.53l.841-10.52.149.023a.75.75 0 0 0 .23-1.482A41.03 41.03 0 0 0 14 4.193V3.75A2.75 2.75 0 0 0 11.25 1h-2.5ZM10 4c.84 0 1.673.025 2.5.075V3.75c0-.69-.56-1.25-1.25-1.25h-2.5c-.69 0-1.25.56-1.25 1.25v.325C8.327 4.025 9.16 4 10 4ZM8.58 7.72a.75.75 0 0 0-1.5.06l.3 7.5a.75.75 0 1 0 1.5-.06l-.3-7.5Zm4.34.06a.75.75 0 1 0-1.5-.06l-.3 7.5a.75.75 0 1 0 1.5.06l.3-7.5Z" clip-rule="evenodd" />
                                                </svg>
                                            </button>
                                        </div>
                                    </div>
                                    <div class="space-y-4 col-span-1">
                                        <div class="flex items-center justify-end"> 
                                            <button type="button" id="closeHapus#MJK_KOD#" class="flex gap-2 items-center justify-center w-1/2 bg-gray-500 text-white font-medium py-2 px-4 rounded hover:bg-gray-700 focus:outline-none" onclick="closeHapus#MJK_KOD#()"> 
                                                Kembali
                                                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" class="size-5">
                                                    <path fill-rule="evenodd" d="M7.793 2.232a.75.75 0 0 1-.025 1.06L3.622 7.25h10.003a5.375 5.375 0 0 1 0 10.75H10.75a.75.75 0 0 1 0-1.5h2.875a3.875 3.875 0 0 0 0-7.75H3.622l4.146 3.957a.75.75 0 0 1-1.036 1.085l-5.5-5.25a.75.75 0 0 1 0-1.085l5.5-5.25a.75.75 0 0 1 1.06.025Z" clip-rule="evenodd" />
                                                </svg>
                                            </button>
                                        </div>
                                    </div>
                                </div>		 
                                        
                                
                                <cfif isdefined("form.HAPUS_DATA")>
                                    <cfstoredproc procedure="SP_TETAPAN_PEMAJU_KATEGORI_HAPUS" datasource="LPN_0SYS"> 
                                        <cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@LPN_KOD"  value="#Session.LPN_CODE#"> 
                                        <cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@USER_ID"  value="#Session.SS_USR_ID#">  
                                        <cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@PAGE_URL"  value="sppb_tetapan_tempat_daerah.cfm">
                                        <cfprocparam cfsqltype="CF_SQL_INTEGER" dbvarname="@MJK_KOD"  value=#FORM.MJK_KOD#> 
                                        <cfprocresult name = RS_HAPUS_DATA>		
                                    </cfstoredproc>
                                    <cfif isdefined("RS_HAPUS_DATA.RETURN_MESSAGE") AND #RS_HAPUS_DATA.RETURN_CODE# LT 0>
                                        <cflocation url="sppb_tetapan_pemaju.cfm?ERROR=#RS_HAPUS_DATA.RETURN_MESSAGE#">
                                    <cfelse>
                                        <cflocation url="sppb_tetapan_pemaju.cfm">
                                    </cfif>
                                </cfif>
                            </form>
                        </div>
                    </div>
                </div>

                <script>
                    function goFurtherHapus(elem) {
                        const mjkkod = elem.getAttribute('data-mjkkod');
                        const saveButton = document.getElementById("HAPUS_DATA" + mjkkod);
                        if (elem.checked) {
                            saveButton.disabled = false;
                            saveButton.classList.remove('bg-red-200', 'cursor-not-allowed');
                            saveButton.classList.add('bg-red-500', 'hover:bg-red-700');
                        } else {
                            saveButton.disabled = true;
                            saveButton.classList.add('bg-blue-200', 'cursor-not-allowed');
                            saveButton.classList.remove('bg-red-500', 'hover:bg-red-700');
                        }
                    }

                    document.getElementById('openHapus#MJK_KOD#').addEventListener('click', function() {
                        document.getElementById('HAPUS#MJK_KOD#').classList.remove('hidden');
                    });

                    document.getElementById('closeHapus#MJK_KOD#').addEventListener('click', function() {
                        document.getElementById('HAPUS#MJK_KOD#').classList.add('hidden');
                    }); 
                </script>
                <!---HAPUS MODAL--->
                <!---HAPUS MODAL--->

                <!---TAMAT MODAL---> 
                <!---TAMAT MODAL--->
                <div id="TAMAT#MJK_KOD#" class="fixed inset-0 flex items-center justify-center bg-gray-800 bg-opacity-50 hidden">
                    <div class="bg-white rounded-lg shadow-lg w-1/2 p-0">
                        <!-- Header with background color -->
                        <div class="bg-[url('./assets/Background.jpg')] bg-cover bg-center text-white p-6 rounded-t-lg">
                            <h2 class="text-lg font-medium text-left">Hapus Daerah</h2>
                        </div>
                        <div class="p-6">
                            <form id="form2" name="form2" method="post" action="">
                                <div class="space-y-4 col-span-1"> 
                                    <div class="flex items-center">
                                        <span class="w-1/4 font-medium text-gray-800">Kod</span>
                                        <span class="w-1/12 text-left">:</span> 
                                        <input readonly name="MJK_KOD" class="w-full bg-gray-200 text-gray-800 border border-gray-400 rounded-md px-2 py-1 focus:outline-none focus:border-gray-400" type="text" value="#MJK_KOD#"/>
                                    </div>
                                    <div class="flex items-center">
                                        <span class="w-1/4 font-medium text-gray-800">Nama</span>
                                        <span class="w-1/12 text-left">:</span>
                                        <input readonly name="MJK_KETER" value="#MJK_KETER#" class="w-full bg-gray-200 text-gray-800 border border-gray-400 rounded-md px-2 py-1 focus:outline-none focus:border-gray-400" type="text"/>
                                    </div>
                                    <div class="flex items-center">
                                        <span class="w-1/4 font-medium text-gray-800">Tamat</span>
                                        <span class="w-1/12 text-left">:</span>
                                        <input name="MJK_TAMAT_TKH" value="#MJK_TAMAT_TKH#" class="w-full bg-white text-gray-800 border border-gray-400 rounded-md px-2 py-1 focus:outline-none focus:border-gray-400" type="date"/>
                                    </div>  
                                </div>
                
                                <div class="grid grid-cols-3 mt-12">
                                    <div class="space-y-4 col-span-3">
                                        <div class="flex items-center">
                                            <div class="bg-red-50 flex-grow border border-red-400 px-2 py-1">
                                                PENGESAHAN: <br>
                                                <input type="checkbox" name="chkbx" onClick="goFurtherTamat(this)" data-mjkkod="#MJK_KOD#">
                                                <label>&nbsp;Saya sahkan maklumat yang diberikan adalah benar</label>
                                            </div> 
                                        </div>
                                    </div>
                                </div>
                                <div class="grid grid-cols-2 gap-4 mt-12">
                                    <div class="space-y-4 col-span-1">
                                        <div class="flex items-center justify-start">
                                            <button type="submit" class="flex gap-2 items-center justify-center w-1/2 bg-red-200 text-white font-medium py-2 px-4 rounded cursor-not-allowed" name="TAMAT_DATA" id="TAMAT_DATA#MJK_KOD#" disabled> 
                                                Hapus
                                                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" class="size-5">
                                                    <path fill-rule="evenodd" d="M8.75 1A2.75 2.75 0 0 0 6 3.75v.443c-.795.077-1.584.176-2.365.298a.75.75 0 1 0 .23 1.482l.149-.022.841 10.518A2.75 2.75 0 0 0 7.596 19h4.807a2.75 2.75 0 0 0 2.742-2.53l.841-10.52.149.023a.75.75 0 0 0 .23-1.482A41.03 41.03 0 0 0 14 4.193V3.75A2.75 2.75 0 0 0 11.25 1h-2.5ZM10 4c.84 0 1.673.025 2.5.075V3.75c0-.69-.56-1.25-1.25-1.25h-2.5c-.69 0-1.25.56-1.25 1.25v.325C8.327 4.025 9.16 4 10 4ZM8.58 7.72a.75.75 0 0 0-1.5.06l.3 7.5a.75.75 0 1 0 1.5-.06l-.3-7.5Zm4.34.06a.75.75 0 1 0-1.5-.06l-.3 7.5a.75.75 0 1 0 1.5.06l.3-7.5Z" clip-rule="evenodd" />
                                                </svg>
                                            </button>
                                        </div>
                                    </div>
                                    <div class="space-y-4 col-span-1">
                                        <div class="flex items-center justify-end"> 
                                            <button type="button" id="closeTamat#MJK_KOD#" class="flex gap-2 items-center justify-center w-1/2 bg-gray-500 text-white font-medium py-2 px-4 rounded hover:bg-gray-700 focus:outline-none" onclick="closeHapus#MJK_KOD#()"> 
                                                Kembali
                                                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" class="size-5">
                                                    <path fill-rule="evenodd" d="M7.793 2.232a.75.75 0 0 1-.025 1.06L3.622 7.25h10.003a5.375 5.375 0 0 1 0 10.75H10.75a.75.75 0 0 1 0-1.5h2.875a3.875 3.875 0 0 0 0-7.75H3.622l4.146 3.957a.75.75 0 0 1-1.036 1.085l-5.5-5.25a.75.75 0 0 1 0-1.085l5.5-5.25a.75.75 0 0 1 1.06.025Z" clip-rule="evenodd" />
                                                </svg>
                                            </button>
                                        </div>
                                    </div>
                                </div>		 
                                        
                                
                                <cfif isdefined("form.HAPUS_DATA")>
                                    <cfstoredproc procedure="SP_TETAPAN_PEMAJU_KATEGORI_UBAH_TAMAT" datasource="LPN_0SYS"> 
                                        <cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@LPN_KOD"  value="#Session.LPN_CODE#"> 
                                        <cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@USER_ID"  value="#Session.SS_USR_ID#">  
                                        <cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@PAGE_URL"  value="sppb_tetapan_tempat_daerah.cfm">
                                        <cfprocparam cfsqltype="CF_SQL_INTEGER" dbvarname="@MJK_KOD"  value=#FORM.MJK_KOD#> 
                                        <cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@MJK_TAMAT_TKH"  value=#FORM.MJK_TAMAT_TKH#> 
                                        <cfprocresult name = RS_TAMAT_DATA>		
                                    </cfstoredproc>
                                    <cfif isdefined("RS_TAMAT_DATA.RETURN_MESSAGE") AND #RS_TAMAT_DATA.RETURN_CODE# LT 0>
                                        <cflocation url="sppb_tetapan_pemaju.cfm?ERROR=#RS_TAMAT_DATA.RETURN_MESSAGE#">
                                    <cfelse>
                                        <cflocation url="sppb_tetapan_pemaju.cfm">
                                    </cfif>
                                </cfif>
                            </form>
                        </div>
                    </div>
                </div>

                <script>
                    function goFurtherTamat(elem) {
                        const mjkkod = elem.getAttribute('data-mjkkod');
                        const saveButton = document.getElementById("TAMAT_DATA" + mjkkod);
                        if (elem.checked) {
                            saveButton.disabled = false;
                            saveButton.classList.remove('bg-red-200', 'cursor-not-allowed');
                            saveButton.classList.add('bg-red-500', 'hover:bg-red-700');
                        } else {
                            saveButton.disabled = true;
                            saveButton.classList.add('bg-blue-200', 'cursor-not-allowed');
                            saveButton.classList.remove('bg-red-500', 'hover:bg-red-700');
                        }
                    }

                    document.getElementById('openTamat#MJK_KOD#').addEventListener('click', function() {
                        document.getElementById('TAMAT#MJK_KOD#').classList.remove('hidden');
                    });

                    document.getElementById('closeTamat#MJK_KOD#').addEventListener('click', function() {
                        document.getElementById('TAMAT#MJK_KOD#').classList.add('hidden');
                    }); 
                </script>
                <!---TAMAT MODAL--->
                <!---TAMAT MODAL--->
            </cfoutput>							
							
							
        </cfform>
      </div>
    </div>
</div>


<!-- End Page -->