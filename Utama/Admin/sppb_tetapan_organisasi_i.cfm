
<script>
document.addEventListener("DOMContentLoaded", function(event) { 
var scrollpos = localStorage.getItem('scrollpos');
if (scrollpos) window.scrollTo(0, scrollpos);
});

window.onbeforeunload = function(e) {
localStorage.setItem('scrollpos', window.scrollY);
};
</script>

<cfstoredproc procedure="[SP_System_Akses_Pengguna_Login]" datasource="LPN_0SYS"> 
<cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@LPN_KOD"  value="#Session.LPN_CODE#" null="No">  
<cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@PAGE_URL"  value="sppb_tetapan_organisasi.cfm" null="No"> 
<cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@LOGIN_ID"  value="#Session.SS_USR_ID#" null="No"> 
<cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@LOGIN_PWD"  value="ELIX1833" null="No"> 
<cfprocresult name = RS_AKSES_PENGGUNA> 
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
    <div class="bg-gray-200 rounded-lg shadow-lg p-6 w-1/3">
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
      <div class="card p-8 bg-transparent"> 
        <div class="flex flex-col space-y-4">
          <div class="flex flex-col shadow-md">
            <div class="flex items-center justify-between py-2 px-4 bg-[#580588] rounded-t-lg" data-plugin="appear" data-animate="fade">
              <h1 class="text-lg font-semibold text-gray-100 sm:text-lg md:text-lg">
                TETAPAN - ORGANISASI
              </h1>
              <div class="flex items-center space-x-3">
                  <a href="sppb_tetapan_organisasi.cfm">
                    <button type="button" class="bg-purple-600 border border-pink-500 rounded text-gray-100 font-regular py-2 px-4 hover:bg-gray-400 transition duration-200 focus:outline-none focus:ring focus:ring-gray-300">
                      Organisasi
                    </button>
                  </a>
                  <a href="sppb_tetapan_organisasi_jabatan.cfm">
                    <button type="button" class="bg-transparent border border-pink-500 rounded text-gray-100 font-regular py-2 px-4  hover:bg-gray-400 transition duration-200 focus:outline-none focus:ring focus:ring-gray-300">
                      Jabatan/Unit
                    </button>
                  </a>
              </div>
            </div>  
            <div class="tabs p-2">
              <div class="block">
                <ul class="flex border-b border-gray-200 space-x-3 transition-all duration-300 -mb-px">
                  <li>
                    <a class="inline-block py-2 px-3 text-gray-500 hover:text-gray-800 font-medium border-b-2 border-transparent tab-active:border-b-indigo-600 tab-active:text-indigo-600 active tablink whitespace-nowrap cursor-pointer" data-tab="tabs-with-underline-1" role="tab">Utama</a>
                  </li>
                  <li>
                    <a class="inline-block py-2 px-3 text-gray-500 hover:text-gray-800 font-medium border-b-2 border-transparent tab-active:border-b-indigo-600 tab-active:text-indigo-600 tablink whitespace-nowrap cursor-pointer" data-tab="tabs-with-underline-2" role="tab">Imej/Logo</a>
                  </li>
                  <cfif #RS_AKSES_PENGGUNA.USR_ROLES_SUPER# EQ 'Y'>
                    <li>
                      <a class="inline-block py-2 px-3 text-gray-500 hover:text-gray-800 font-medium border-b-2 border-transparent tab-active:border-b-indigo-600 tab-active:text-indigo-600 tablink whitespace-nowrap cursor-pointer" data-tab="tabs-with-underline-3" role="tab">Tetapan</a>
                    </li>
                  </cfif>
                </ul>
              </div>
              <div class="mt-2">
                <div id="tabs-with-underline-1" role="tabpanel" aria-labelledby="tabs-with-underline-item-1" class="tabcontent">
                  <cfoutput query="RS_ORGANISASI">
                      <div>
                        <div class="w-full p-2">
                            <div class="flex justify-between items-center">
                                <h1 class="text-2xl font-semibold text-gray-900 sm:text-2xl md:text-2xl">
                                  Organisasi - Maklumat Utama
                                </h1>
                                <cfif #RS_AKSES_PENGGUNA.USR_CTL_TETAPAN_SISTEM# CONTAINS 'E'>
                                  <a class="animsition-link" href="sppb_tetapan_organisasi_kemaskini.cfm">
                                    <button type="button" class="flex gap-2 bg-green-500 text-white font-regular py-2 px-4 rounded hover:bg-green-700 focus:outline-none"> 
                                        Kemaskini
                                        <svg xmlns="http://www.w3.org/2000/svg" id="icon-kemaskini" viewBox="0 0 20 20" fill="currentColor" class="size-5">
                                            <path
                                                d="m5.433 13.917 1.262-3.155A4 4 0 0 1 7.58 9.42l6.92-6.918a2.121 2.121 0 0 1 3 3l-6.92 6.918c-.383.383-.84.685-1.343.886l-3.154 1.262a.5.5 0 0 1-.65-.65Z" />
                                            <path
                                                d="M3.5 5.75c0-.69.56-1.25 1.25-1.25H10A.75.75 0 0 0 10 3H4.75A2.75 2.75 0 0 0 2 5.75v9.5A2.75 2.75 0 0 0 4.75 18h9.5A2.75 2.75 0 0 0 17 15.25V10a.75.75 0 0 0-1.5 0v5.25c0 .69-.56 1.25-1.25 1.25h-9.5c-.69 0-1.25-.56-1.25-1.25v-9.5Z" />
                                        </svg>
                                    </button>
                                  </a>
                                </cfif>
                            </div>
                        </div>

                        <div class="w-full border-none mt-2 p-4 space-y-2">
                            <div class="grid lg:grid-cols-3 md:grid-cols-1 sm:grid-cols-1 gap-4">
                                <div class="space-y-2 col-span-2">
                                  <div class="grid lg:grid-cols-6 md:grid-cols-6 sm:grid-cols-1 gap-2">
                                      <div class="col-span-6 sm:col-span-1">
                                        <cfif #RS_AKSES_PENGGUNA.USR_ROLES_SUPER# EQ 'Y'>
                                          <label for="LPN_KOD" class="block text-sm font-medium text-gray-700">
                                              Kod
                                            </label>

                                            <input
                                              type="text"
                                              id="LPN_KOD"
                                              name="LPN_KOD"
                                              value="#LPN_KOD#"
                                              readonly
                                              class=" w-full h-12 rounded-md bg-gray-200 border border-gray-300 text-sm text-gray-700 shadow-sm px-4"
                                            />
                                            <cfif LPN_TEST EQ 'Y'>
                                                <span class="bg-yellow-500 text-white text-sm font-semibold px-3 py-1 rounded-lg inline-block ml-4">DATA UJIAN</span>
                                            </cfif>
                                        </cfif>
                                      </div>
                                      <div class="col-span-6 sm:col-span-3">
                                          <label for="LPN_NAMA" class="block text-sm font-medium text-gray-700">
                                            Nama
                                          </label>

                                          <input
                                            type="text"
                                            id="LPN_NAMA"
                                            name="LPN_NAMA"
                                            value="#LPN_NAMA#"
                                            readonly
                                            class=" w-full h-12 rounded-md border border-gray-300 bg-gray-200 text-sm text-gray-700 shadow-sm px-4"
                                          />
                                      </div>

                                      <div class="col-span-6 sm:col-span-2">
                                        <label for="LPN_NSGKT" class="block text-sm font-medium text-gray-700">
                                          Nama Singkatan
                                        </label>

                                        <input
                                          type="text"
                                          id="LPN_NSGKT"
                                          name="LPN_NSGKT"
                                          value="#LPN_NSGKT#"
                                          readonly
                                          class=" w-full h-12 rounded-md border border-gray-300 bg-gray-200 text-sm text-gray-700 shadow-sm px-4"
                                        />
                                      </div>

                                      <div class="col-span-6 sm:col-span-6">
                                        <label for="LPN_ALAMAT1" class="block text-sm font-medium text-gray-700">
                                          Alamat
                                        </label>

                                        <input
                                          type="text"
                                          id="LPN_ALAMAT1"
                                          name="LPN_ALAMAT1"
                                          value="#LPN_ALAMAT1#"
                                          readonly
                                          class=" w-full h-12 rounded-md border border-gray-300 bg-gray-200 text-sm text-gray-700 shadow-sm px-4"
                                        />
                                      </div>

                                      <div class="col-span-6 sm:col-span-6">
                                        <label for="LPN_ALAMAT2" class="block text-sm font-medium text-gray-700">
                                        
                                        </label>

                                        <input
                                          type="textarea"
                                          id="LPN_ALAMAT2"
                                          name="LPN_ALAMAT2"
                                          value="#LPN_ALAMAT2#"
                                          readonly
                                          class=" w-full h-12 rounded-md border border-gray-300 bg-gray-200 text-sm text-gray-700 shadow-sm px-4"
                                        />
                                      </div>

                                      <div class="col-span-6 sm:col-span-6">
                                        <label for="LPN_ALAMAT3" class="block text-sm font-medium text-gray-700">
                                          
                                        </label>

                                        <input
                                          type="text"
                                          id="LPN_ALAMAT3"
                                          name="LPN_ALAMAT3"
                                          value="#LPN_ALAMAT3#"
                                          readonly
                                          class=" w-full h-12 rounded-md border border-gray-300 bg-gray-200 text-sm text-gray-700 shadow-sm px-4"
                                        />
                                      </div>

                                      <div class="col-span-6 sm:col-span-6">
                                        <label for="LPN_ALAMAT4" class="block text-sm font-medium text-gray-700">
                                        
                                        </label>

                                        <input
                                          type="textarea"
                                          id="LPN_ALAMAT4"
                                          name="LPN_ALAMAT4"
                                          value="#LPN_ALAMAT4#"
                                          readonly
                                          class=" w-full h-12 rounded-md border border-gray-300 bg-gray-200 text-sm text-gray-700 shadow-sm px-4"
                                        />
                                      </div>

                                      <div class="col-span-6 sm:col-span-6">
                                        <label for="Negeri" class="block text-sm font-medium text-gray-700">
                                          Negeri
                                        </label>

                                        <input
                                          type="textarea"
                                          id="TMS_NAMA"
                                          name="TMS_NAMA"
                                          value="#TMS_NAMA#"
                                          readonly
                                          class=" w-full h-12 rounded-md border border-gray-300 bg-gray-200 text-sm text-gray-700 shadow-sm px-4"
                                        />
                                      
                                      </div>
                                  </div>
                                </div>
                                <div class="space-y-2 col-span-1 lg:order-last sm:order-first md:order-first">   
                                  <div class="shadow p-4">
                                      <cfif #LPN_IMEJ_LOGO_STATUS# NEQ ''>
                                          <cfset binaryImageData = toBinary("#LPN_IMEJ_LOGO#")>
                                          <cfset base64ImageData = toBase64(#binaryImageData#)>
                                          
                                          <img class="mx-auto" src="data:image/png;base64,#base64ImageData#" alt="Organization Logo" height="300" width="300">
                                      <cfelse>
                                          <img class="mx-auto" src="../assets/images/no_image.png" alt="No Image Available" height="300" width="300">
                                      </cfif>
                                  </div>
                                  <!-- Button outside the shadow box -->
                                  <div class="mt-6">
                                      <button type="button" class="flex gap-2 items-center justify-center w-full bg-blue-500 text-white font-regular py-2 px-4 rounded hover:bg-blue-700 focus:outline-none focus:ring focus:ring-blue-100" data-target="##MODAL_UPLOAD" data-toggle="modal">
                                          Upload
                                          <svg xmlns="http://www.w3.org/2000/svg" id="icon-upload" viewBox="0 0 20 20" fill="currentColor" class="size-5">
                                              <path
                                                  d="M9.25 13.25a.75.75 0 0 0 1.5 0V4.636l2.955 3.129a.75.75 0 0 0 1.09-1.03l-4.25-4.5a.75.75 0 0 0-1.09 0l-4.25 4.5a.75.75 0 1 0 1.09 1.03L9.25 4.636v8.614Z" />
                                              <path
                                                  d="M3.5 12.75a.75.75 0 0 0-1.5 0v2.5A2.75 2.75 0 0 0 4.75 18h10.5A2.75 2.75 0 0 0 18 15.25v-2.5a.75.75 0 0 0-1.5 0v2.5c0 .69-.56 1.25-1.25 1.25H4.75c-.69 0-1.25-.56-1.25-1.25v-2.5Z" />
                                          </svg>
                                      </button>
                                  </div>
                                      
                                  <!---MODAL_UPLOAD--->
                                  <div class="fixed inset-0 flex items-center justify-center bg-gray-800 bg-opacity-50 hidden" id="MODAL_UPLOAD" aria-hidden="true" role="dialog" tabindex="-1">
                                      <div class="bg-gray-200 rounded-lg shadow-lg sm:w-1/2 lg:w-1/3 p-0">
                                          <form id="form3" name="form3" method="post" action="sppb_tetapan_organisasi_imej_upload_proses.cfm" enctype="multipart/form-data">
                                            <div class="bg-[url('./assets/Background.jpg')] bg-cover bg-center text-white p-4 rounded-t-lg">
                                                <h2 class="text-lg font-regular">Upload Logo</h2>
                                            </div> 
                                            <div class="p-6">  
                                                <div class="flex items-center mt-4">
                                                    <input required name="PIC_1" type="file" id="input-file-now" class="form-control" />
                                                </div>
                                                <div class="flex justify-between mt-5">
                                                    <input name="SIMPAN_PIC_1" type="submit" class="bg-blue-500 text-white py-2 px-4 rounded hover:bg-blue-700 w-1/3" id="SIMPAN_PIC_1" value="Simpan" />
                                                    <button type="button" class="bg-green-500 text-white py-2 px-4 rounded hover:bg-green-700 w-1/3" data-dismiss="modal">Kembali</button>
                                                </div>
                                            </div>
                                          </form>
                                      </div>
                                  </div> 
                                  <!---MODAL_UPLOAD--->
                                    
                                  <script>
                                      // Open modal
                                      document.querySelectorAll('[data-toggle="modal"]').forEach(button => {
                                          button.addEventListener('click', () => {
                                              const modalId = button.getAttribute('data-target');
                                              document.querySelector(modalId).classList.remove('hidden');
                                          });
                                      });

                                      // Close modal
                                      document.querySelectorAll('[data-dismiss="modal"]').forEach(button => {
                                          button.addEventListener('click', () => {
                                              const modal = button.closest('.fixed');
                                              modal.classList.add('hidden');
                                          });
                                      });

                                      // Optional: Close modal when clicking outside of it
                                      // document.querySelectorAll('.fixed').forEach(modal => {
                                      //     modal.addEventListener('click', (e) => {
                                      //         if (e.target === modal) {
                                      //             modal.classList.add('hidden');
                                      //         }
                                      //     });
                                      // });
                                  </script>
                            
                                </div>
                                
                            </div>
                            <div class="grid lg:grid-cols-4 md:grid-cols-4 sm:grid-cols-4 gap-2">
                              <div class="col-span-4 sm:col-span-1">
                                <label for="LPN_TELNO" class="block text-sm font-medium text-gray-700">
                                  No. Telefon
                                </label>

                                <input
                                  type="text"
                                  id="LPN_TELNO"
                                  name="LPN_TELNO"
                                  value="#LPN_TELNO#"
                                  readonly
                                  class=" w-full h-12 rounded-md border border-gray-300 bg-gray-200 text-sm text-gray-700 shadow-sm px-4"
                                />
                              </div>

                              <div class="col-span-4 sm:col-span-1">
                                <label for="LPN_FAXNO" class="block text-sm font-medium text-gray-700">
                                  No. Fax
                                </label>

                                <input
                                  type="text"
                                  id="LPN_FAXNO"
                                  name="LPN_FAXNO"
                                  value="#LPN_FAXNO#"
                                  readonly
                                  class=" w-full h-12 rounded-md border border-gray-300 bg-gray-200 text-sm text-gray-700 shadow-sm px-4"
                                />
                              </div>
                              
                              <div class="col-span-4 sm:col-span-1">
                                <label for="LPN_EMEL" class="block text-sm font-medium text-gray-700">
                                  E-mel
                                </label>

                                <input
                                  type="email"
                                  id="LPN_EMEL"
                                  name="LPN_EMEL"
                                  value="#LPN_EMEL#"
                                  readonly
                                  class=" w-full h-12 rounded-md border border-gray-300 bg-gray-200 text-sm text-gray-700 shadow-sm px-4"
                                />
                              </div>

                              <div class="col-span-4 sm:col-span-1">
                                <label for="LPN_WSURL" class="block text-sm font-medium text-gray-700">
                                  Website URL
                                </label>

                                <input
                                  type="text"
                                  id="LPN_WSURL"
                                  name="LPN_WSURL"
                                  value="#LPN_WSURL#"
                                  readonly
                                  class=" w-full h-12 rounded-md border border-gray-300 bg-gray-200 text-sm text-gray-700 shadow-sm px-4"
                                />
                              </div>

                              <div class="col-span-4 sm:col-span-4">
                                <label for="LPN_SETT_AYT_PETIKAN1" class="block text-sm font-medium text-gray-700">
                                  Ayat Petikan
                                </label>

                                <input
                                  type="text"
                                  id="LPN_SETT_AYT_PETIKAN1"
                                  name="LPN_SETT_AYT_PETIKAN1"
                                  value="#LPN_SETT_AYT_PETIKAN1#"
                                  readonly
                                  class=" w-full h-12 rounded-md border border-gray-300 bg-gray-200 text-sm text-gray-700 shadow-sm px-4"
                                />
                              </div>

                              <div class="col-span-4 sm:col-span-4">
                                <label for="LPN_SETT_AYT_PETIKAN2" class="block text-sm font-medium text-gray-700">
                                </label>

                                <input
                                  type="text"
                                  id="LPN_SETT_AYT_PETIKAN2"
                                  name="LPN_SETT_AYT_PETIKAN2"
                                  value="#LPN_SETT_AYT_PETIKAN2#"
                                  readonly
                                  class=" w-full h-12 rounded-md border border-gray-300 bg-gray-200 text-sm text-gray-700 shadow-sm px-4"
                                />
                              </div>
                              
                              <div class="col-span-4 sm:col-span-4">
                                <label for="LPN_SETT_AYT_PETIKAN3" class="block text-sm font-medium text-gray-700">
                                </label>

                                <input
                                  type="email"
                                  id="LPN_SETT_AYT_PETIKAN3"
                                  name="LPN_SETT_AYT_PETIKAN3"
                                  value="#LPN_SETT_AYT_PETIKAN3#"
                                  readonly
                                  class=" w-full h-12 rounded-md border border-gray-300 bg-gray-200 text-sm text-gray-700 shadow-sm px-4"
                                />
                              </div>

                              <div class="col-span-4 sm:col-span-4">
                                <label for="LPN_SETT_AYT_PETIKAN4" class="block text-sm font-medium text-gray-700">
                                </label>

                                <input
                                  type="text"
                                  id="LPN_SETT_AYT_PETIKAN4"
                                  name="LPN_SETT_AYT_PETIKAN4"
                                  value="#LPN_SETT_AYT_PETIKAN4#"
                                  readonly
                                  class=" w-full h-12 rounded-md border border-gray-300 bg-gray-200 text-sm text-gray-700 shadow-sm px-4"
                                />
                              </div>
                                
                            </div>
                        </div>
                      </div>
                  </cfoutput>
                </div>
                <div id="tabs-with-underline-2" role="tabpanel" aria-labelledby="tabs-with-underline-item-2" class="tabcontent">
                  
                </div>
                <div id="tabs-with-underline-3" role="tabpanel" aria-labelledby="tabs-with-underline-item-3" class="tabcontent">
                </div>
              </div>
            </div>
      
          </div> 
        </div>
      </div>
    </div>
</div>

<!-- End Page -->