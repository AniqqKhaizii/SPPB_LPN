
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
<cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@LPN_KOD"  value="LPNMLK" null="No">  
<cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@PAGE_URL"  value="sppb_tetapan_organisasi_kemaskini.cfm" null="No"> 
<cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@LOGIN_ID"  value="ELIXTECH" null="No"> 
<cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@LOGIN_PWD"  value="ELIX1833" null="No"> 
<cfprocresult name = RS_AKSES_PENGGUNA> 
</cfstoredproc>
	
<cfstoredproc procedure="SP_Senarai_Tempat_Negeri" datasource="LPN_0SYS">
<cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@LPN_KOD" value="LPNMLK">
<cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@USER_ID"  value="ELIXTECH"> 
<cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@PAGE_URL"  value="sppb_tetapan_organisasi.cfm">
<cfprocresult name="RS_NEGERI">
</cfstoredproc>	
	
<cfstoredproc procedure="SP_TETAPAN_LPN_CARIAN" datasource="LPN_0SYS"> 
<cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@LPN_KOD"  value="LPNMLK" null="No"> 
<cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@USER_ID"  value="ELIXTECH" null="No"> 
<cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@PAGE_URL"  value="sppb_tetapan_organisasi.cfm" null="No"> 
<cfprocresult name = RS_ORGANISASI> 
</cfstoredproc> 


	
	
	
<meta name="viewport" content="width=device-width, initial-scale=1">
 

<!-- Page -->

<div class="page">
<div class="container mx-auto">
  <div class="flex flex-col">
    <div class="card p-8 bg-white shadow-md rounded-lg"> 
      <form id="form1" name="form1" method="post" action="" class="flex flex-col space-y-4">
        <div class="flex flex-col">
 
	
          <div class="bg-gray-700 border border-gray-700 p-4 mt-4" data-plugin="appear" data-animate="fade">
            <table class="w-full border-collapse bg-gray-700">
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

<div class="w-full border-none mt-2">
    <div class="grid grid-cols-1">
        <div class="space-y-4 col-span-1">  
            <div class="flex items-center">
                <span class="w-1/4 font-medium text-gray-800">Nama Penuh</span>
                <span class="w-1/12 text-left">:</span>
				<cfif #RS_AKSES_PENGGUNA.USR_ROLES_SUPER# EQ 'Y'>
				<input name="LPN_NAMA" class="w-full text-gray-800 border border-gray-400 rounded-md px-2 py-1" type="text" value="#LPN_NAMA#"/>
                <cfelse>
                <input disabled name="LPN_NAMA" class="w-full text-gray-800 border border-gray-400 rounded-md px-2 py-1" type="text" value="#LPN_NAMA#"/>
				</cfif>
            </div>
            <div class="flex items-center">
                <span class="w-1/4 font-medium text-gray-800">Nama Singkatan</span>
                <span class="w-1/12 text-left">:</span>
				<cfif #RS_AKSES_PENGGUNA.USR_ROLES_SUPER# EQ 'Y'>
                <input name="LPN_NSGKT" class="w-full text-gray-800 border border-gray-400 rounded-md px-2 py-1" type="text" value="#LPN_NSGKT#"/>
                <cfelse>
                <input disabled name="LPN_NSGKT" class="w-full text-gray-800 border border-gray-400 rounded-md px-2 py-1" type="text" value="#LPN_NSGKT#"/>
				</cfif> 
            </div>
            <div class="flex items-center">
                <span class="w-1/4 font-medium text-gray-800">Alamat</span>
                <span class="w-1/12 text-left">:</span>
                <input name="LPN_ALAMAT1" class="w-full text-gray-800 border border-gray-400 rounded-md px-2 py-1" type="text" value="#LPN_ALAMAT1#"/>
            </div>
            <div class="flex items-center">
                <span class="w-1/4 font-medium text-gray-800"></span>
                <span class="w-1/12 text-left"></span>
                <input name="LPN_ALAMAT1" class="w-full text-gray-800 border border-gray-400 rounded-md px-2 py-1" type="text" value="#LPN_ALAMAT2#"/>
            </div>
            <div class="flex items-center">
                <span class="w-1/4 font-medium text-gray-800"></span>
                <span class="w-1/12 text-left"></span>
                <input name="LPN_ALAMAT1" class="w-full text-gray-800 border border-gray-400 rounded-md px-2 py-1" type="text" value="#LPN_ALAMAT3#"/>
            </div>
            <div class="flex items-center">
                <span class="w-1/4 font-medium text-gray-800"></span>
                <span class="w-1/12 text-left"></span>
                <input name="LPN_ALAMAT1" class="w-full text-gray-800 border border-gray-400 rounded-md px-2 py-1" type="text" value="#LPN_ALAMAT4#"/>
            </div> 
        </div> 
</div>
</div>

<div class="w-full border-none mt-4">
    <div class="space-y-2"> 
<div class="flex items-center space-x-4">
    <span class="w-32 font-medium text-gray-800">Negeri</span>
    <span class="w-4 text-left">:</span>
    <select class="flex-grow border border-gray-400 rounded-md px-2 py-1 h-10 text-gray-800" name="LPN_TMS_KOD" id="LPN_TMS_KOD">
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

<div class="flex items-center space-x-4 mt-4">
    <span class="w-32 font-medium text-gray-800">Tel No.</span>
    <span class="w-4 text-left">:</span>
    <input name="LPN_TELNO" class="flex-grow border border-gray-400 rounded-md px-2 py-1 h-10 text-gray-800" type="text" value="#LPN_TELNO#" />

    <span class="w-32 font-medium text-gray-800">Fax No.</span>
    <span class="w-4 text-left">:</span>
    <input name="LPN_FAXNO" class="flex-grow border border-gray-400 rounded-md px-2 py-1 h-10 text-gray-800" type="text" value="#LPN_FAXNO#" />
</div>


        <div class="flex items-center space-x-4">
            <span class="w-32 font-medium text-gray-800">E-mel</span>
            <span class="w-4 text-left">:</span>
            <input name="LPN_EMEL" class="flex-grow text-gray-800 border border-gray-400 rounded-md px-2 py-1" type="text" value="#LPN_EMEL#"/>

            <span class="w-32 font-medium text-gray-800">Website URL</span>
            <span class="w-4 text-left">:</span>
            <input name="LPN_WSURL" class="flex-grow text-gray-800 border border-gray-400 rounded-md px-2 py-1" type="text" value="#LPN_WSURL#"/>
        </div>
        <div class="flex items-center space-x-4">
            <span class="w-32 font-medium text-gray-800">Ayat Petikan</span>
            <span class="w-4 text-left">:</span>
            <input name="LPN_SETT_AYT_PETIKAN1" class="flex-grow text-gray-800 border border-gray-400 rounded-md px-2 py-1" type="text" value="#LPN_SETT_AYT_PETIKAN1#"/> 
        </div>
        <div class="flex items-center space-x-4">
            <span class="w-32 font-medium text-gray-800"></span>
            <span class="w-4 text-left"></span> 
            <input name="LPN_SETT_AYT_PETIKAN2" class="flex-grow text-gray-800 border border-gray-400 rounded-md px-2 py-1 ml-2" type="text" value="#LPN_SETT_AYT_PETIKAN2#"/> 
        </div>
        <div class="flex items-center space-x-4">
            <span class="w-32 font-medium text-gray-800"></span>
            <span class="w-4 text-left"></span> 
            <input name="LPN_SETT_AYT_PETIKAN3" class="flex-grow text-gray-800 border border-gray-400 rounded-md px-2 py-1 ml-2" type="text" value="#LPN_SETT_AYT_PETIKAN3#"/> 
        </div>
        <div class="flex items-center space-x-4">
            <span class="w-32 font-medium text-gray-800"></span>
            <span class="w-4 text-left"></span> 
            <input name="LPN_SETT_AYT_PETIKAN4" class="flex-grow text-gray-800 border border-gray-400 rounded-md px-2 py-1 ml-2" type="text" value="#LPN_SETT_AYT_PETIKAN4#"/>
        </div>
    </div>
<div class="grid grid-cols-3 gap-4 mt-12">
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
            <button disabled type="submit" class="w-1/2 bg-blue-200 text-white font-medium py-2 px-4 rounded cursor-not-allowed" name="SIMPAN" id="SIMPAN"> 
                Simpan
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
            <button type="button" class="w-1/2 bg-gray-500 text-white font-medium py-2 px-4 rounded hover:bg-gray-700 focus:outline-none" onclick="openModal()"> 
                Kembali
            </button>
        </div>
    </div>
</div>
	
</div>
</cfoutput>
<cfif isdefined("form.SIMPAN" )> 
   <cfstoredproc procedure="[SP_TETAPAN_LPN_SIMPAN]" datasource="LPN_0SYS"> 
	<cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@LPN_KOD"  value="LPNMLK"> 
	<cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@USER_ID"  value="ELIXTECH">
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
<div id="MODAL_KELUAR_PAGE" class="fixed inset-0 flex items-center justify-center bg-gray-800 bg-opacity-50 hidden">
    <div class="bg-white rounded-lg shadow-lg w-1/3 p-0"> <!-- Removed p-6 for tighter spacing -->
        <!-- Header with background color -->
        <div class="bg-gray-500 text-white p-4 rounded-t-lg">
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
                <button id="confirmExitButton" class="bg-green-500 text-white font-medium py-2 px-4 rounded hover:bg-green-700 w-1/3" onclick="redirectAndCloseModal()">
                    Ya
                </button>
                <button class="bg-red-500 text-white font-medium py-2 px-4 rounded hover:bg-red-700 w-1/3" onclick="closeModal()">
                    Tidak
                </button>
            </div>
        </div>
    </div>
</div>



<script>
function openModal() {
document.getElementById("MODAL_KELUAR_PAGE").classList.remove("hidden");
}
function closeModal() {
document.getElementById("MODAL_KELUAR_PAGE").classList.add("hidden");
}
function redirectAndCloseModal() {
closeModal();
setTimeout(function() {
window.location.href = "http://localhost:8500/SPPB_LPN/Utama/Admin/sppb_tetapan_organisasi.cfm";
}, 100); 
}
</script>
</div> 
</form>
</div>
</div>
</div>
</div>
</div>

<!-- End Page -->