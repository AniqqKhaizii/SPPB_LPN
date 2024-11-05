<cfparam name="FORM.USR_PEGKOD" default="">
<cfparam name="FORM.USR_NAMA" default="">
<cfparam name="FORM.USR_KP" default="">
<cfparam name="FORM.USR_TELNO" default="">
<cfparam name="FORM.USR_EMEL" default="">
<cfparam name="FORM.USR_LOGIN_PWD" default=""> 

<cfstoredproc procedure="SP_Tetapan_LPN_Carian" datasource="LPN_0SYS"> 
    <cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@USER_ID" value="#Session.SS_USR_ID#" null="No"> 
    <cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@LPN_KOD" value="#Session.LPN_CODE#" null="No"> 
    <cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@CARI_LPN_KOD" value="#Session.LPN_CODE#" null="No"> 
    <cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@PAGE_URL" value="admin/index.cfm" null="No"> 
    <cfprocresult name="RS_Tetapan_LPN"> 
</cfstoredproc>	

<cfstoredproc procedure="SP_TETAPAN_PENGGUNA_CARIAN" datasource="LPN_0SYS"> 
<cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@LPN_KOD"  value="#Session.LPN_CODE#" null="No"> 
<cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@USER_ID"  value="#Session.SS_USR_ID#" null="No"> 
<cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@PAGE_URL"  value="sppb_tetapan_pengguna_kemaskini.cfm" null="No"> 
<cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@USR_PEGKOD"  value="#FORM.USR_PEGKOD#" null="No"> 
<cfprocresult name = RS_PENGGUNA> 
</cfstoredproc> 

<!doctype html>
<html>

<cfinclude template="./head.cfm">
<header class="bg-[url('./assets/Background.jpg')] bg-cover bg-center fixed left-0 top-0 lg:z-20 w-screen text-white">
  <div class="max-w-screen px-4 sm:px-6 lg:px-8">
    <div class="flex h-16 items-center justify-between">
      <div class="md:flex md:items-center flex sm:justify-between justify-start sm:items-center items-start gap-20">
        <div class="md:flex md:items-center flex justify-start items-center gap-4 hidden sm:flex">
          <a class="block text-teal-600" href="./main.cfm">
            <span class="sr-only">Home</span>
            <img src="../../public/assets/SPPB.png" class="h-16 w-auto drop-shadow-2xl " />
          </a>
          <h1 class="text-2xl font-semibold">SPPB</h1>
        </div>
        <div class="md:flex md:items-center flex justify-start items-center gap-4 ">
          <a class="block text-teal-600" href="./utama.cfm">
            <span class="sr-only">Home</span>
            <cfoutput>
              <img class="mx-auto h-14 w-auto drop-shadow-2xl" src="../../LOGO/#Session.LPN_CODE#.png" alt="Organization Logo" height="285" width="285">
            </cfoutput>
          </a>
          <cfoutput>
          <h1 class="text-2xl font-semibold sm:flex hidden">#RS_Tetapan_LPN.LPN_NAMA#</h1>
          <h1 class="text-2xl font-semibold sm:hidden flex">#RS_Tetapan_LPN.LPN_NSGKT#</h1>
          </cfoutput>
        </div>
      </div>

      


      <div class="flex items-center">
        <div class="flex items-center sm:gap-4 gap-2">
          <div class="relative inline-block">
            <button
              class="flex items-center rounded-md bg-green-600 px-5 py-2.5 text-sm font-medium text-white shadow-xl"
              id="openProfail"
              data-tooltip-target="bottom-tooltip">
              Profail
              <svg class="w-6 h-6 text-gray-800 dark:text-white" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" viewBox="0 0 24 24">
                <path fill-rule="evenodd" d="M12 4a4 4 0 1 0 0 8 4 4 0 0 0 0-8Zm-2 9a4 4 0 0 0-4 4v1a2 2 0 0 0 2 2h8a2 2 0 0 0 2-2v-1a4 4 0 0 0-4-4h-4Z" clip-rule="evenodd"/>
              </svg>
            </button>
            <div
              class="absolute top-full invisible left-1/2 z-20 mt-3 border border-gray-300 -translate-x-1/2 whitespace-nowrap rounded-md bg-white py-2 px-4 text-xs text-gray-800 font-medium transition-opacity duration-300 shadow-[0px_-12px_30px_-4px_rgba(16,24,40,0.08)]"
              role="tooltip" id="bottom-tooltip">
            <span
              class="absolute -top-1.5 left-1/2 -z-10 h-3 w-3  border-t border-l rounded-sm border-gray-300 -translate-x-1/2 rotate-45 bg-white"></span>
                Profail Pengguna
            </div>  
          </div>
          
          <div class="hidden sm:flex">
            <a
              class="flex items-center rounded-md bg-red-600 px-5 py-2.5 text-sm font-medium text-white shadow-xl"
              href="../Admin/logout.cfm">
              Log Keluar
              <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" class="bi bi-power" viewBox="0 0 16 16">
                    <path d="M7.5 1v7h1V1z"/>
                    <path d="M3 8.812a5 5 0 0 1 2.578-4.375l-.485-.874A6 6 0 1 0 11 3.616l-.501.865A5 5 0 1 1 3 8.812"/>
                </svg>
            </a>
          </div>
          <button class="lg:hidden bg-transparent text-white p-2 rounded-sm" id="sidebarToggle">
              <svg class="w-6 h-6 text-gray-800 dark:text-white" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="none" viewBox="0 0 24 24">
                <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M18 6H6m12 4H6m12 4H6m12 4H6"/>
              </svg>
          </button>
        </div>
      </div>
    </div>
  </div>

<!---PROFAIL MODAL---> 
<!---PROFAIL MODAL--->
<cfoutput query="RS_PENGGUNA">

<div id="PROFAIL" class="fixed inset-0 flex items-center justify-center bg-gray-800 bg-opacity-50 hidden">
    <div class="bg-white rounded-lg shadow-lg w-1/2 p-0">
        <!-- Header with background color -->
        <div class="bg-[url('./assets/Background.jpg')] bg-cover bg-center text-white p-6 rounded-t-lg">
            <h2 class="text-lg font-medium text-left">PENGGUNA - PROFIL</h2>
        </div>
        <div class="p-6">
            <form id="form2" name="form2" method="post" action="">
				<div class="grid grid-cols-10">
					<div class="space-y-4 col-span-3 p-2">  
						<div class="flex items-center">
							<span class="font-medium text-gray-800">No. Kakitangan</span> 
						</div> 
					</div> 
					<div class="space-y-4 col-span-1 p-2">  
						<div class="flex items-center"> 
							<span class="text-left">:</span> 
						</div> 
					</div> 
					<div class="space-y-4 col-span-6 p-2">  
						<div class="flex items-center">  
							<input disabled name="USR_PEGKOD" class="w-full bg-gray-200 text-gray-800 rounded-md px-2 py-1" type="text" value="#USR_PEGKOD#"/>
						</div> 
					</div>
					<div class="space-y-4 col-span-3 p-2">  
						<div class="flex items-center">
							<span class="font-medium text-gray-800">Nama</span> 
						</div> 
					</div> 
					<div class="space-y-4 col-span-1 p-2">  
						<div class="flex items-center"> 
							<span class="text-left">:</span> 
						</div> 
					</div> 
					<div class="space-y-4 col-span-6 p-2">  
						<div class="flex items-center"> 
							<cfif #Session.USR_CTL_DATA_PROFIL# NEQ 'Y'>
							<input disabled name="USR_NAMA" class="w-full bg-gray-200 text-gray-800 rounded-md px-2 py-1" type="text" value="#USR_NAMA#"/>
							<cfelse>
							<input name="USR_NAMA" class="w-full text-gray-800 border border-gray-400 rounded-md px-2 py-1" type="text" value="#USR_NAMA#"/>
							</cfif>
						</div> 
					</div>
					<div class="space-y-4 col-span-3 p-2">  
						<div class="flex items-center">
							<span class="font-medium text-gray-800">No. Kad Pengenalan</span> 
						</div> 
					</div> 
					<div class="space-y-4 col-span-1 p-2">  
						<div class="flex items-center"> 
							<span class="text-left">:</span> 
						</div> 
					</div> 
					<div class="space-y-4 col-span-6 p-2">  
						<div class="flex items-center">  
							<cfif Session.USR_CTL_DATA_PROFIL NEQ 'Y'>
							<input disabled name="USR_KP" class="w-full bg-gray-200 text-gray-800 rounded-md px-2 py-1" type="text" value="#USR_KP#"/>
							<cfelse>
							<input name="USR_KP" class="w-full text-gray-800 border border-gray-400 rounded-md px-2 py-1" type="text" value="#USR_KP#"/>
							</cfif> 
						</div> 
					</div>
					<div class="space-y-4 col-span-3 p-2">  
						<div class="flex items-center">
							<span class="font-medium text-gray-800">Tel. No.</span> 
						</div> 
					</div> 
					<div class="space-y-4 col-span-1 p-2">  
						<div class="flex items-center"> 
							<span class="text-left">:</span> 
						</div> 
					</div> 
					<div class="space-y-4 col-span-6 p-2">  
						<div class="flex items-center">  
							<cfif Session.USR_CTL_DATA_PROFIL NEQ 'Y'>
							<input disabled name="USR_TELNO" class="w-full bg-gray-200 text-gray-800 rounded-md px-2 py-1" type="text" value="#USR_TELNO#"/>
							<cfelse>
							<input name="USR_TELNO" class="w-full text-gray-800 border border-gray-400 rounded-md px-2 py-1" type="text" value="#USR_TELNO#"/>
							</cfif>  
						</div> 
					</div>
					<div class="space-y-4 col-span-3 p-2">  
						<div class="flex items-center">
							<span class="font-medium text-gray-800">E-mel</span> 
						</div> 
					</div> 
					<div class="space-y-4 col-span-1 p-2">  
						<div class="flex items-center"> 
							<span class="text-left">:</span> 
						</div> 
					</div> 
					<div class="space-y-4 col-span-6 p-2">  
						<div class="flex items-center">  
							<cfif Session.USR_CTL_DATA_PROFIL NEQ 'Y'>
							<input disabled name="USR_EMEL" class="w-full bg-gray-200 text-gray-800 rounded-md px-2 py-1" type="text" value="#USR_EMEL#"/>
							<cfelse>
							<input name="USR_EMEL" class="w-full text-gray-800 border border-gray-400 rounded-md px-2 py-1" type="text" value="#USR_EMEL#"/>
							</cfif>   
						</div> 
					</div>
					<div class="space-y-4 col-span-3 p-2">  
						<div class="flex items-center">
							<span class="font-medium text-gray-800">Kata Laluan</span> 
						</div> 
					</div> 
					<div class="space-y-4 col-span-1 p-2">  
						<div class="flex items-center"> 
							<span class="text-left">:</span> 
						</div> 
					</div> 
					<div class="space-y-4 col-span-6 p-2">  
						<div class="flex items-center">   
							<input name="USR_LOGIN_PWD" class="w-full text-gray-800 border border-gray-400 rounded-md px-2 py-1" type="text" value="#USR_LOGIN_PWD#"/>  
						</div> 
					</div> 
				</div>
                <div class="grid grid-cols-3 mt-12">
                    <div class="space-y-4 col-span-3">
                        <div class="flex items-center">
                            <div class="bg-red-50 flex-grow border border-red-400 px-2 py-1 text-black">
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
                            <button type="submit" class="flex items-center justify-center gap-2 w-1/2 bg-blue-200 text-white font-medium py-2 px-4 rounded cursor-not-allowed" name="MASUK_DATA" id="MASUK_DATA" disabled> 
                                Simpan
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-floppy2" viewBox="0 0 16 16">
                                  <path d="M1.5 0h11.586a1.5 1.5 0 0 1 1.06.44l1.415 1.414A1.5 1.5 0 0 1 16 2.914V14.5a1.5 1.5 0 0 1-1.5 1.5h-13A1.5 1.5 0 0 1 0 14.5v-13A1.5 1.5 0 0 1 1.5 0M1 1.5v13a.5.5 0 0 0 .5.5H2v-4.5A1.5 1.5 0 0 1 3.5 9h9a1.5 1.5 0 0 1 1.5 1.5V15h.5a.5.5 0 0 0 .5-.5V2.914a.5.5 0 0 0-.146-.353l-1.415-1.415A.5.5 0 0 0 13.086 1H13v3.5A1.5 1.5 0 0 1 11.5 6h-7A1.5 1.5 0 0 1 3 4.5V1H1.5a.5.5 0 0 0-.5.5m9.5-.5a.5.5 0 0 0-.5.5v3a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-3a.5.5 0 0 0-.5-.5z"/>
                                </svg>
                            </button>
                        </div>
                    </div>
                    <div class="space-y-4 col-span-1">
                        <div class="flex items-center justify-end"> 
                            <button type="button" id="closeProfil" class="flex items-center justify-center gap-2 w-1/2 bg-gray-500 text-white font-medium py-2 px-4 rounded hover:bg-gray-700 focus:outline-none" onclick="closeProfil()"> 
                                Kembali
                                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" class="size-5">
                                  <path fill-rule="evenodd" d="M7.793 2.232a.75.75 0 0 1-.025 1.06L3.622 7.25h10.003a5.375 5.375 0 0 1 0 10.75H10.75a.75.75 0 0 1 0-1.5h2.875a3.875 3.875 0 0 0 0-7.75H3.622l4.146 3.957a.75.75 0 0 1-1.036 1.085l-5.5-5.25a.75.75 0 0 1 0-1.085l5.5-5.25a.75.75 0 0 1 1.06.025Z" clip-rule="evenodd" />
                                </svg>
                            </button>
                        </div>
                    </div>
                </div>		 

                <cfif isdefined("form.MASUK_DATA")>
                    <cfstoredproc procedure="SP_TETAPAN_PENGGUNA_UBAH_PROFILE" datasource="LPN_0SYS"> 
                        <cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@LPN_KOD"  value="#Session.LPN_CODE#"> 
                        <cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@USER_ID"  value="#Session.SS_USR_ID#">  
                        <cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@PAGE_URL"  value="header.cfm">
                        <cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@USR_PEGKOD"  value="#FORM.USR_PEGKOD#">
                        <cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@USR_NAMA"  value="#FORM.USR_NAMA#">
                        <cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@USR_KP"  value="#FORM.USR_KP#">
                        <cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@USR_FONE"  value="#FORM.USR_TELNO#"> 
                        <cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@USR_EMEL"  value="#FORM.USR_EMEL#"> 
                        <cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@USR_PWD"  value="#FORM.USR_LOGIN_PWD#"> 
                        <cfprocresult name = RS_MASUK_DATA>		
                    </cfstoredproc>
                    <cfoutput>
                        <script type="text/javascript">
                            location.reload();
                        </script>
                    </cfoutput>

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

    document.getElementById('openProfail').addEventListener('click', function() {
        document.getElementById('PROFAIL').classList.remove('hidden');
    });

    document.getElementById('closeProfil').addEventListener('click', function() {
        document.getElementById('PROFAIL').classList.add('hidden');
    }); 
</script>
</cfoutput>
<!---PROFAIL MODAL--->
<!---PROFAIL MODAL--->

</header>
</html>

<script>
    // JavaScript to toggle sidebar visibility on mobile
    var sidebar = document.getElementById('sidebar');
    var toggleButton = document.getElementById('sidebarToggle');

    toggleButton.addEventListener('click', () => {
        sidebar.classList.toggle('-translate-x-full');
    });
</script>