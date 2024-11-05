
<script>
document.addEventListener("DOMContentLoaded", function(event) { 
var scrollpos = localStorage.getItem('scrollpos');
if (scrollpos) window.scrollTo(0, scrollpos);
});

window.onbeforeunload = function(e) {
localStorage.setItem('scrollpos', window.scrollY);
};
</script>

<!---<cfstoredproc procedure="[SP_System_Akses_Pengguna_Login]" datasource="LPN_0SYS"> 
<cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@LPN_KOD"  value="LPNMLK" null="No">  
<cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@PAGE_URL"  value="sppb_tetapan_organisasi.cfm" null="No"> 
<cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@LOGIN_ID"  value="ELIXTECH" null="No"> 
<cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@LOGIN_PWD"  value="ELIX1833" null="No"> 
<cfprocresult name = RS_AKSES_PENGGUNA> 
</cfstoredproc>--->
 
<cfparam name="FORM.USR_PEGKOD" default="">
<cfparam name="FORM.USR_NAMA" default="">
<cfparam name="FORM.USR_JAB_KOD" default="">
<cfparam name="FORM.USR_JAWATAN" default=""> 
<cfparam name="FORM.USR_PWD_RESET" default=""> 


<cfstoredproc procedure="SP_SENARAI_JABATAN" datasource="LPN_0SYS">
<cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@LPN_KOD" value="#Session.LPN_CODE#">
<cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@USER_ID"  value="#Session.SS_USR_ID#"> 
<cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@PAGE_URL"  value="sppb_tetapan_pengguna_kemaskini.cfm">
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
            <button id="closeModal" class="w-1/4 bg-gray-500 text-white px-4 py-2 rounded hover:bg-gray-600">Kembali</button>
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
      <form id="form1" name="form1" method="post" action="" class="flex flex-col space-y-4">
        <div class="flex flex-col">  
        <div class="w-full bg-[#580588] rounded-t-lg p-4 mt-4">
            <div class="flex justify-between items-center">
                <h4 class="text-white font-medium">TETAPAN - PENGGUNA - DAFTAR</h4>
                
                <div class="flex space-x-2">    
                </div>
            </div>
        </div>

        <div class="w-full border border-gray-300"> 
            <div class="grid grid-cols-1">
                <div class="col-span-1"> 
                    <div class="m-2">
                        <div class="grid grid-cols-10">
                            <div class="space-y-4 col-span-2 p-2">  
                                <div class="flex items-center">
                                    <span class="font-medium text-gray-800 py-3">No. Kakitangan</span> 
                                </div> 
                            </div> 
                            <div class="space-y-4 col-span-1 p-2">  
                                <div class="flex items-center"> 
                                    <span class="text-left py-3">:</span> 
                                </div> 
                            </div> 
                            <div class="space-y-4 col-span-7 p-2">  
                                <div class="flex items-center">  
                                    <input name="USR_PEGKOD" class="w-full text-gray-800 border border-gray-400 rounded-md px-2 py-3" type="text"/>
                                </div> 
                            </div>  
                            <div class="space-y-4 col-span-2 p-2">  
                                <div class="flex items-center">
                                    <span class="font-medium text-gray-800 py-3">Nama</span> 
                                </div> 
                            </div> 
                            <div class="space-y-4 col-span-1 p-2">  
                                <div class="flex items-center"> 
                                    <span class="text-left py-3">:</span> 
                                </div> 
                            </div> 
                            <div class="space-y-4 col-span-7 p-2">  
                                <div class="flex items-center">  
                                    <input name="USR_NAMA" class="w-full text-gray-800 border border-gray-400 rounded-md px-2 py-3" type="text"/>
                                </div> 
                            </div>  	
                            <div class="space-y-4 col-span-2 p-2">
                                <div class="flex items-center">
                                    <span class="font-medium text-gray-800">Jabatan</span>
                                </div>
                            </div>
                            <div class="space-y-4 col-span-1 p-2">
                                <div class="flex items-center">
                                    <span class="text-left">:</span>
                                </div>
                            </div>
                            <div class="space-y-4 col-span-7 p-2">
                                <div class="flex items-center"> 
                                    <select name="USR_JAB_KOD" id="USR_JAB_KOD" class="w-full text-gray-800 bg-white border border-gray-400 rounded-md px-5 py-1">
                                        <option value=""> -- Sila Pilih -- </option>
                                        <cfoutput query="RS_JABATAN">
                                            <option value="#JAB_KOD#" 
                                                <cfif isdefined("form.USR_JAB_KOD") and 
                                                form.USR_JAB_KOD eq '#JAB_KOD#'>selected="selected"
                                                </cfif>>
                                                #JAB_KOD# - #JAB_NAMA#
                                            </option>
                                        </cfoutput>
                                    </select>
                                </div>
                            </div>
			
 
                            <div class="space-y-4 col-span-2 p-2">  
                                <div class="flex items-center">
                                    <span class="font-medium text-gray-800 py-3">Jawatan</span> 
                                </div> 
                            </div> 
                            <div class="space-y-4 col-span-1 p-2">  
                                <div class="flex items-center"> 
                                    <span class="text-left py-3">:</span> 
                                </div> 
                            </div> 
                            <div class="space-y-4 col-span-7 p-2">  
                                <div class="flex items-center">  
                                    <input name="USR_JAWATAN" class="w-full text-gray-800 border border-gray-400 rounded-md px-2 py-3" type="text"/>
                                </div> 
                            </div>  
                        </div> 
                    </div> 
                            <div class="bg-gray-700 mx-2 rounded-t-md py-3">
                                <div class="flex justify-between items-center mx-4">
                                    <h4 class="text-white font-medium">Daftar Masuk</h4>  
                                </div>    	
                            </div>

                    
                            <div class="border border-gray-300 mx-2 rounded-b-md">
                                <div class="grid grid-cols-10">  
                                    <div class="space-y-4 col-span-2 p-2">  
                                        <div class="flex items-center">
                                            <span class="font-medium text-gray-800 py-3">Kata laluan</span> 
                                        </div> 
                                    </div> 
                                    <div class="space-y-4 col-span-1 p-2">  
                                        <div class="flex items-center"> 
                                            <span class="text-left py-3">:</span> 
                                        </div> 
                                    </div> 
                                    <div class="space-y-4 col-span-7 p-2">  
                                        <div class="flex items-center">  
                                            <input name="USR_LOGIN_PWD" class="w-full text-gray-800 border border-gray-400 rounded-md px-2 py-3" type="text"/>
                                        </div> 
                                    </div> 
                                    <div class="space-y-4 col-span-2 p-2">  
                                        <div class="flex items-center">
                                            <span class="font-medium text-gray-800 py-3">Kegunaan Sementara</span> 
                                        </div> 
                                    </div> 
                                    <div class="space-y-4 col-span-1 p-2">  
                                        <div class="flex items-center"> 
                                            <span class="text- py-3">:</span> 
                                        </div> 
                                    </div> 
                                    <div class="space-y-4 col-span-2 p-2">  
                                        <div class="flex items-center">  
                                            <input type="checkbox" name="USR_OWD_RESET" value="Y" class="w-4 h-4 my-3">&nbsp;Ya (Pengguna perlu ubah)
                                        </div> 
                                    </div> 
                                    <div class="space-y-4 col-span-6 p-2">  
                                        <div class="flex items-center">  
                                            
                                        </div> 
                                    </div>
                                </div> 
                            </div>
                        </div>
                                    
                            
                                </div>
                                
                            <div class="grid grid-cols-3 mt-12">
                                <div class="space-y-4 col-span-3">
                                    <div class="flex items-center">
                                        <div class="bg-red-50 flex-grow border border-red-400 px-2 py-1 m-4">
                                            PENGESAHAN: <br>
                                            <input type="checkbox" name="chkbx" onClick="goFurther(this)">
                                            <label>&nbsp;Saya sahkan maklumat yang diberikan adalah benar</label>
                                        </div> 
                                    </div>
                                </div>
                            </div>

                            <div class="grid grid-cols-2 gap-4 m-4">
                                <div class="space-y-4 col-span-1">
                                    <div class="flex items-center justify-start">
                                        <button disabled type="submit" class="flex items-center justify-center gap-2 w-1/2 bg-blue-200 text-white font-medium py-2 px-4 rounded cursor-not-allowed" name="SIMPAN" id="SIMPAN"> 
                                            Simpan
                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-floppy2" viewBox="0 0 16 16">
                                                <path d="M1.5 0h11.586a1.5 1.5 0 0 1 1.06.44l1.415 1.414A1.5 1.5 0 0 1 16 2.914V14.5a1.5 1.5 0 0 1-1.5 1.5h-13A1.5 1.5 0 0 1 0 14.5v-13A1.5 1.5 0 0 1 1.5 0M1 1.5v13a.5.5 0 0 0 .5.5H2v-4.5A1.5 1.5 0 0 1 3.5 9h9a1.5 1.5 0 0 1 1.5 1.5V15h.5a.5.5 0 0 0 .5-.5V2.914a.5.5 0 0 0-.146-.353l-1.415-1.415A.5.5 0 0 0 13.086 1H13v3.5A1.5 1.5 0 0 1 11.5 6h-7A1.5 1.5 0 0 1 3 4.5V1H1.5a.5.5 0 0 0-.5.5m9.5-.5a.5.5 0 0 0-.5.5v3a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-3a.5.5 0 0 0-.5-.5z"/>
                                            </svg>
                                        </button>
                                    </div>
                                    <script>
                                        function goFurther(elem) {
                                            const saveButton = document.getElementById("SIMPAN");
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
                                    </script>
                                </div>
                                <div class="space-y-4 col-span-1">
                                    <div class="flex items-center justify-end"> 
                                        <button type="button" class="flex items-center justify-center gap-2 w-1/2 bg-gray-500 text-white font-medium py-2 px-4 rounded hover:bg-gray-700 focus:outline-none" onclick="keluarPage()"> 
                                            Kembali
                                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" class="size-5">
                                                <path fill-rule="evenodd" d="M7.793 2.232a.75.75 0 0 1-.025 1.06L3.622 7.25h10.003a5.375 5.375 0 0 1 0 10.75H10.75a.75.75 0 0 1 0-1.5h2.875a3.875 3.875 0 0 0 0-7.75H3.622l4.146 3.957a.75.75 0 0 1-1.036 1.085l-5.5-5.25a.75.75 0 0 1 0-1.085l5.5-5.25a.75.75 0 0 1 1.06.025Z" clip-rule="evenodd" />
                                            </svg>
                                        </button>
                                    </div>
                                </div>
                            </div>	
                                
                        </div> 
 		
        <cfif isdefined("form.SIMPAN" )> 
        <cfstoredproc procedure="[SP_TETAPAN_PENGGUNA_DAFTAR]" datasource="LPN_0SYS"> 
            <cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@LPN_KOD"  value="#Session.LPN_CODE#"> 
            <cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@USER_ID"  value="#Session.SS_USR_ID#">
            <cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@PAGE_URL"  value="sppb_tetapan_pengguna_daftar.cfm">  
            <cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@USR_PEGKOD"  value="#FORM.USR_PEGKOD#">
            <cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@USR_NAMA"  value="#FORM.USR_NAMA#">
            <cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@USR_JAB_KOD"  value="#FORM.USR_JAB_KOD#"> 
            <cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@USR_JAWATAN"  value="#FORM.USR_JAWATAN#"> 
            <cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@USR_LOGIN_PWD"  value="#FORM.USR_LOGIN_PWD#">
            <cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@USR_PWD_RESET"  value="#FORM.USR_PWD_RESET#">  
        <cfprocresult name = RS_MASUK_DATA>		
        </cfstoredproc>

        <cfif isdefined("RS_MASUK_DATA.RETURN_MESSAGE") AND #RS_MASUK_DATA.RETURN_CODE# LT 0>
        <p><cfoutput>#RS_MASUK_DATA.RETURN_MESSAGE#</cfoutput></p>
        <cflocation url="sppb_tetapan_pengguna_cari.cfm?ERROR=#RS_MASUK_DATA.RETURN_MESSAGE#">
        <cfelse>
        <cflocation url="sppb_tetapan_pengguna_kemaskini.cfm?USR_PEGKOD=#USR_PEGKOD#">
        </cfif>		
        </cfif>	 
        <div id="MODAL_KELUAR_PAGE" class="fixed inset-0 flex items-center justify-center bg-gray-800 bg-opacity-50 hidden">
            <div class="bg-white rounded-lg shadow-lg lg:w-1/3 p-0"> <!-- Removed p-6 for tighter spacing -->
                <!-- Header with background color -->
                <div class="bg-[url('./assets/Background.jpg')] bg-cover bg-center text-white p-4 rounded-t-lg">
                    <h2 class="text-lg font-medium">Kembali Ke Halaman Sebelum</h2>
                </div>
                <div class="p-6"> <!-- Added padding for body content -->
                    <p class="text-center">Adakah anda pasti untuk keluar dari halaman ini?</p>
                    <div class="flex items-center mt-5">
                        <div class="bg-red-50 flex-grow border border-red-400 px-2 py-2">
                            Maklumat yang telah dimasukkan tidak akan disimpan!
                        </div>
                    </div>
                    <div class="flex justify-between mt-5">
                        <button id="confirmExitButton" class="flex items-center justify-center gap-2 bg-green-500 text-white font-medium py-2 px-4 rounded hover:bg-green-700 w-1/3" onclick="redirectAndCloseModal()">
                            Ya
                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" class="size-5">
                                <path fill-rule="evenodd" d="M10 18a8 8 0 1 0 0-16 8 8 0 0 0 0 16Zm3.857-9.809a.75.75 0 0 0-1.214-.882l-3.483 4.79-1.88-1.88a.75.75 0 1 0-1.06 1.061l2.5 2.5a.75.75 0 0 0 1.137-.089l4-5.5Z" clip-rule="evenodd" />
                            </svg>
                        </button>
                        <button type="button" class="flex items-center justify-center gap-2 bg-red-500 text-white font-medium py-2 px-4 rounded hover:bg-red-700 w-1/3" onclick="closeModal1()">
                            Tidak
                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" class="size-5">
                                <path fill-rule="evenodd" d="M10 18a8 8 0 1 0 0-16 8 8 0 0 0 0 16ZM8.28 7.22a.75.75 0 0 0-1.06 1.06L8.94 10l-1.72 1.72a.75.75 0 1 0 1.06 1.06L10 11.06l1.72 1.72a.75.75 0 1 0 1.06-1.06L11.06 10l1.72-1.72a.75.75 0 0 0-1.06-1.06L10 8.94 8.28 7.22Z" clip-rule="evenodd" />
                            </svg>
                        </buttontypeclass=>
                    </div>
                </div>
            </div>
        </div>

        <script>
            function keluarPage() {
            document.getElementById("MODAL_KELUAR_PAGE").classList.remove("hidden");
            }
            function closeModal1() {
            document.getElementById("MODAL_KELUAR_PAGE").classList.add("hidden");
            }
            function redirectAndCloseModal() {
            closeModal1();
            setTimeout(function() {
            window.location.href = "sppb_tetapan_pengguna.cfm";
            }, 100); 
            }
        </script>
        </div>  					
      </form>
    </div>
</div>

<!-- End Page -->