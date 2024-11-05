
<script>
document.addEventListener("DOMContentLoaded", function(event) { 
var scrollpos = localStorage.getItem('scrollpos');
if (scrollpos) window.scrollTo(0, scrollpos);
});

window.onbeforeunload = function(e) {
localStorage.setItem('scrollpos', window.scrollY);
};
</script>

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
	
<cfstoredproc procedure="[SP_System_Akses_Pengguna_Login]" datasource="LPN_0SYS"> 
<cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@LPN_KOD"  value="#Session.LPN_CODE#" null="No">  
<cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@PAGE_URL"  value="sppb_tetapan_organisasi_kemaskini.cfm" null="No"> 
<cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@LOGIN_ID"  value="#Session.SS_USR_ID#" null="No"> 
<cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@LOGIN_PWD"  value="ELIX1833" null="No"> 
<cfprocresult name = RS_AKSES_PENGGUNA> 
</cfstoredproc>
	
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


	
	
	
<meta name="viewport" content="width=device-width, initial-scale=1">
 

<!-- Page -->

<div class="page">
<div class="container mx-auto">
  <div class="flex flex-col">
      <form id="form1" name="form1" method="post" action="" class="flex flex-col space-y-4">
        <div class="flex flex-col shadow-md bg-white pb-4">
 
	
            <div class="py-2 px-4 bg-[#580588] rounded-t-lg" data-plugin="appear" data-animate="fade">
                <table class="w-full border-collapse">
                <tbody>
                    <tr>
                    <td class="text-white">
                        <h4 class="text-lg font-medium">TETAPAN - ORGANISASI - KEMASKINI</h4>
                    </td>
                    <td class="w-1/10"></td>
                    <td class="w-1/10"></td>
                    </tr>
                </tbody>
                </table>
            </div>  
	 
            <cfoutput query="RS_ORGANISASI"> 
                <div class="w-full border-none mt-2 px-4">
                    <div class="w-full border-none mt-2 p-4 space-y-2">
                        <div class="grid lg:grid-cols-2 md:grid-cols-1 sm:grid-cols-1 gap-4">
                            <div class="space-y-2 col-span-2">
                                <div class="grid lg:grid-cols-6 md:grid-cols-6 sm:grid-cols-1 gap-2">
                                    <div class="col-span-6 sm:col-span-3">
                                        <label for="LPN_NAMA" class="block text-sm font-medium text-gray-700">
                                        Nama Penuh
                                        </label>

                                        <cfif #RS_AKSES_PENGGUNA.USR_ROLES_SUPER# EQ 'Y'>
                                            <input name="LPN_NAMA" class="w-full text-gray-800 border border-gray-300 rounded-md px-4 py-2" type="text" value="#LPN_NAMA#"/>
                                        <cfelse>
                                            <input disabled name="LPN_NAMA" class="w-full text-gray-800 border border-gray-300 rounded-md px-4 py-2" type="text" value="#LPN_NAMA#"/>
                                        </cfif>
                                    </div>

                                    <div class="col-span-6 sm:col-span-3">
                                        <label for="LPN_NSGKT" class="block text-sm font-medium text-gray-700">
                                            Nama Singkatan
                                        </label>

                                        <cfif #RS_AKSES_PENGGUNA.USR_ROLES_SUPER# EQ 'Y'>
                                            <input name="LPN_NSGKT" class="w-full text-gray-800 border border-gray-300 rounded-md px-4 py-2" type="text" value="#LPN_NSGKT#"/>
                                        <cfelse>
                                            <input disabled name="LPN_NSGKT" class="w-full text-gray-800 border border-gray-300 rounded-md px-4 py-2" type="text" value="#LPN_NSGKT#"/>
                                        </cfif> 
                                    </div>

                                    <div class="col-span-6 sm:col-span-3 space-y-2">
                                        <div>
                                            <label for="LPN_ALAMAT1" class="block text-sm font-medium text-gray-700">
                                                Alamat
                                            </label>

                                            <input name="LPN_ALAMAT1" class="w-full text-gray-800 border border-gray-300 rounded-md px-4 py-2" type="text" value="#LPN_ALAMAT1#"/>
                                        </div>

                                        <div>
                                            <label for="LPN_ALAMAT2" class="block text-sm font-medium text-gray-700">
                                            </label>

                                            <input name="LPN_ALAMAT2" class="w-full text-gray-800 border border-gray-300 rounded-md px-4 py-2" type="text" value="#LPN_ALAMAT2#"/>
                                        </div>

                                        <div>
                                            <label for="LPN_ALAMAT3" class="block text-sm font-medium text-gray-700">
                                            </label>

                                            <input name="LPN_ALAMAT3" class="w-full text-gray-800 border border-gray-300 rounded-md px-4 py-2" type="text" value="#LPN_ALAMAT3#"/>
                                        </div>

                                        <div>
                                            <label for="LPN_ALAMAT4" class="block text-sm font-medium text-gray-700">
                                            </label>

                                            <input name="LPN_ALAMAT4" class="w-full text-gray-800 border border-gray-300 rounded-md px-4 py-2" type="text" value="#LPN_ALAMAT4#"/>
                                        </div>
                                    </div>

                                    <div class="col-span-6 sm:col-span-3 lg:order-fourth sm:order-last">
                                        <label for="Negeri" class="block text-sm font-medium text-gray-700">
                                            Negeri
                                        </label>

                                        <select class="w-full text-gray-800 border border-gray-300 rounded-md px-4 py-2 h-10" name="LPN_TMS_KOD" id="LPN_TMS_KOD">
                                            <cfloop query="RS_NEGERI">
                                                <cfif TMS_KOD EQ RS_ORGANISASI.LPN_TMS_KOD>
                                                    <option value="#TMS_KOD#">#TMS_NAMA#</option>
                                                </cfif>
                                            </cfloop>
                                            <cfloop query="RS_NEGERI">
                                                <cfif TMS_KOD NEQ RS_ORGANISASI.LPN_TMS_KOD>
                                                    <option value="#TMS_KOD#">#TMS_NAMA#</option>
                                                </cfif>
                                            </cfloop>
                                        </select>
                                    
                                    </div>

                                </div>
                                <div class="grid lg:grid-cols-4 md:grid-cols-4 sm:grid-cols-1 gap-2">
                                    <div class="col-span-4 sm:col-span-1">
                                    <label for="LPN_TELNO" class="block text-sm font-medium text-gray-700">
                                        No. Telefon
                                    </label>

                                    <input name="LPN_TELNO" class="w-full text-gray-800 border border-gray-300 rounded-md px-4 py-2 text-gray-800" type="text" value="#LPN_TELNO#" />

                                    </div>

                                    <div class="col-span-4 sm:col-span-1">
                                    <label for="LPN_FAXNO" class="block text-sm font-medium text-gray-700">
                                        No. Fax
                                    </label>

                                    <input name="LPN_FAXNO" class="w-full text-gray-800 border border-gray-300 rounded-md px-2 py-1px-4 py-2 text-gray-800" type="text" value="#LPN_FAXNO#" />

                                    </div>
                                    
                                    <div class="col-span-4 sm:col-span-1">
                                    <label for="LPN_EMEL" class="block text-sm font-medium text-gray-700">
                                        E-mel
                                    </label>

                                    <input name="LPN_EMEL" class="w-full text-gray-800 border border-gray-300 rounded-md px-4 py-2 text-gray-800" type="email" value="#LPN_EMEL#" />

                                    </div>

                                    <div class="col-span-4 sm:col-span-1">
                                    <label for="LPN_WSURL" class="block text-sm font-medium text-gray-700">
                                        Website URL
                                    </label>

                                    <input name="LPN_WSURL" class="w-full text-gray-800 border border-gray-300 rounded-md px-4 py-2  text-gray-800" type="text" value="#LPN_WSURL#" />

                                    </div>

                                    <div class="col-span-4 sm:col-span-4">
                                        <label for="LPN_SETT_AYT_PETIKAN1" class="block text-sm font-medium text-gray-700">
                                            Ayat Petikan
                                        </label>
                                        <input name="LPN_SETT_AYT_PETIKAN1" class="w-full text-gray-800 border border-gray-300 rounded-md px-4 py-2" type="text" value="#LPN_SETT_AYT_PETIKAN1#"/> 
                                    </div>
                                    <div class="col-span-4 sm:col-span-4">
                                        <label for="LPN_SETT_AYT_PETIKAN2" class="block text-sm font-medium text-gray-700">
                                        </label>
                                        <input name="LPN_SETT_AYT_PETIKAN2" class="w-full text-gray-800 border border-gray-300 rounded-md px-4 py-2" type="text" value="#LPN_SETT_AYT_PETIKAN2#"/> 
                                    </div>
                                    <div class="col-span-4 sm:col-span-4">
                                        <label for="LPN_SETT_AYT_PETIKAN3" class="block text-sm font-medium text-gray-700">
                                        </label>
                                        <input name="LPN_SETT_AYT_PETIKAN3" class="w-full text-gray-800 border border-gray-300 rounded-md px-4 py-2" type="text" value="#LPN_SETT_AYT_PETIKAN3#"/> 
                                    </div>
                                    <div class="col-span-4 sm:col-span-4">
                                        <label for="LPN_SETT_AYT_PETIKAN4" class="block text-sm font-medium text-gray-700">
                                        </label>
                                        <input name="LPN_SETT_AYT_PETIKAN4" class="w-full text-gray-800 border border-gray-300 rounded-md px-4 py-2" type="text" value="#LPN_SETT_AYT_PETIKAN4#"/> 
                                    </div>
                                    <div class="mt-2 space-y-4 col-span-4">
                                        <div class="flex items-center">
                                            <div class="bg-red-50 flex-grow border border-red-400 px-2 py-1">
                                                PENGESAHAN: <br>
                                                <input type="checkbox" name="chkbx" onClick="goFurther(this)">
                                                <label>&nbsp;Saya sahkan maklumat yang diberikan adalah benar</label>
                                            </div> 
                                        </div>
                                    </div>  
                                </div>
                            </div>
                            
                        
                    </div>
                </div>



<div class="grid grid-cols-2 gap-4 mt-2">
    <div class="space-y-4 col-span-1">
        <div class="flex items-center justify-start">
            <button disabled type="submit" class="flex gap-2 items-center justify-center w-1/2 bg-blue-200 text-white font-medium py-2 px-4 rounded cursor-not-allowed" name="SIMPAN" id="SIMPAN"> 
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
            <button type="button" class="flex gap-2 items-center justify-center w-1/2 bg-gray-500 text-white font-medium py-2 px-4 rounded hover:bg-gray-700 focus:outline-none" onclick="openModal()"> 
                Kembali
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" class="size-5">
                    <path fill-rule="evenodd" d="M7.793 2.232a.75.75 0 0 1-.025 1.06L3.622 7.25h10.003a5.375 5.375 0 0 1 0 10.75H10.75a.75.75 0 0 1 0-1.5h2.875a3.875 3.875 0 0 0 0-7.75H3.622l4.146 3.957a.75.75 0 0 1-1.036 1.085l-5.5-5.25a.75.75 0 0 1 0-1.085l5.5-5.25a.75.75 0 0 1 1.06.025Z" clip-rule="evenodd" />
                </svg>

            </button>
        </div>
    </div>
</div>
	
</div>
</cfoutput>
<cfif isdefined("form.SIMPAN" )> 
   <cfstoredproc procedure="[SP_TETAPAN_LPN_SIMPAN]" datasource="LPN_0SYS"> 
	<cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@LPN_KOD"  value="#Session.LPN_CODE#"> 
	<cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@USER_ID"  value="#Session.SS_USR_ID#">
	<cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@PAGE_URL"  value="sppb_tetapan_organisasi_kemaskini.cfm">  
	<cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@LPN_NAMA"  value="#FORM.LPN_NAMA#">
	<cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@LPN_NSGKT"  value="#FORM.LPN_NSGKT#">
	<cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@LPN_ALAMAT1"  value="#FORM.LPN_ALAMAT1#"> 
	<cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@LPN_ALAMAT2"  value="#FORM.LPN_ALAMAT2#"> 
	<cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@LPN_ALAMAT3"  value="#FORM.LPN_ALAMAT3#">
	<cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@LPN_ALAMAT4"  value="#FORM.LPN_ALAMAT4#">
	<cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@LPN_TMS_KOD"  value="#FORM.LPN_TMS_KOD#">
	<cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@LPN_TELNO"  value="#FORM.LPN_TELNO#">
	<cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@LPN_FAXNO"  value="#FORM.LPN_FAXNO#">
	<cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@LPN_EMEL"  value="#FORM.LPN_EMEL#">
	<cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@LPN_WSURL"  value="#FORM.LPN_WSURL#">
	<cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@LPN_SETT_AYT_PETIKAN1"  value="#FORM.LPN_SETT_AYT_PETIKAN1#">
	<cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@LPN_SETT_AYT_PETIKAN2"  value="#FORM.LPN_SETT_AYT_PETIKAN2#">
	<cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@LPN_SETT_AYT_PETIKAN3"  value="#FORM.LPN_SETT_AYT_PETIKAN3#">
	<cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@LPN_SETT_AYT_PETIKAN4"  value="#FORM.LPN_SETT_AYT_PETIKAN4#">
	<cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@LPN_TEST"  value="">
	<cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@LPN_HENTI_TKH"  value="">
  <cfprocresult name = RS_MASUK_DATA>		
  </cfstoredproc>

  <cfif isdefined("RS_MASUK_DATA.RETURN_MESSAGE") AND #RS_MASUK_DATA.RETURN_CODE# LT 0>
  <p><cfoutput>#RS_MASUK_DATA.RETURN_MESSAGE#</cfoutput></p>
  <cflocation url="sppb_tetapan_organisasi.cfm?ERROR=#RS_MASUK_DATA.RETURN_MESSAGE#">
  <cfelse>
  <cflocation url="sppb_tetapan_organisasi.cfm">
  </cfif>		
  </cfif>	 


  



<script>
    function openModal() {
    document.getElementById("MODAL_KELUAR_PAGE").classList.remove("hidden");
    }
    function closeModal() {
        console.log('masuk');
        document.getElementById("MODAL_KELUAR_PAGE").classList.add("hidden");
    }
    function redirectAndCloseModal() {
            closeModal();
            setTimeout(function() {
            window.location.href = "sppb_tetapan_organisasi.cfm";
            }, 100); 
    }
</script>
</div> 
</form>
</div>
</div>
</div>
</div>
<div id="MODAL_KELUAR_PAGE" class="fixed inset-0 flex items-center justify-center bg-gray-800 bg-opacity-50 hidden">
    <div class="bg-white  rounded-lg shadow-lg sm:w-1/2 lg:w-1/3 p-0"> <!-- Removed p-6 for tighter spacing -->
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
                <button type="button" id="confirmExitButton" class="flex gap-2 items-center justify-center bg-green-500 text-white font-medium py-2 px-4 rounded hover:bg-green-700 w-1/3" onclick="redirectAndCloseModal()">
                    Ya
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" class="size-5">
                        <path fill-rule="evenodd" d="M10 18a8 8 0 1 0 0-16 8 8 0 0 0 0 16Zm3.857-9.809a.75.75 0 0 0-1.214-.882l-3.483 4.79-1.88-1.88a.75.75 0 1 0-1.06 1.061l2.5 2.5a.75.75 0 0 0 1.137-.089l4-5.5Z" clip-rule="evenodd" />
                    </svg>

                </button>
                <button type="button" class="flex gap-2 items-center justify-center bg-red-500 text-white font-medium py-2 px-4 rounded hover:bg-red-700 w-1/3" onclick="closeModal()">
                    Tidak
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" class="size-5">
                        <path fill-rule="evenodd" d="M10 18a8 8 0 1 0 0-16 8 8 0 0 0 0 16ZM8.28 7.22a.75.75 0 0 0-1.06 1.06L8.94 10l-1.72 1.72a.75.75 0 1 0 1.06 1.06L10 11.06l1.72 1.72a.75.75 0 1 0 1.06-1.06L11.06 10l1.72-1.72a.75.75 0 0 0-1.06-1.06L10 8.94 8.28 7.22Z" clip-rule="evenodd" />
                    </svg>

                </button>
            </div>
        </div>
    </div>
</div>
<!-- End Page -->