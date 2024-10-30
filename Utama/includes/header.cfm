<cfstoredproc procedure="SP_Tetapan_LPN_Carian" datasource="LPN_0SYS"> 
    <cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@USER_ID" value="#Session.SS_USR_ID#" null="No"> 
    <cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@LPN_KOD" value="#Session.LPN_CODE#" null="No"> 
    <cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@CARI_LPN_KOD" value="#Session.LPN_CODE#" null="No"> 
    <cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@PAGE_URL" value="admin/index.cfm" null="No"> 
    <cfprocresult name="RS_Tetapan_LPN"> 
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
              onclick="window.location.href='sppb_pengguna_profile.cfm';"
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