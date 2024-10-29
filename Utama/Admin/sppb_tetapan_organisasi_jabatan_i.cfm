
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
            <button id="closeModal" class="w-1/4 bg-gray-500 text-white px-4 py-2 rounded hover:bg-gray-600">Kembali</button>
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
 
    function openModal(errorMessage) {
        document.getElementById('errorMessage').innerText = errorMessage;
        document.getElementById('errorModal').classList.remove('hidden');
    }
 
    function closeModal() {
        document.getElementById('errorModal').classList.add('hidden');
    }
 
    window.onload = function() {
        var errorMessage = getUrlParameter('ERROR');
        console.log("URL Parameter 'ERROR':", errorMessage);  
        if (errorMessage) {
            openModal(errorMessage);
        }
 
        document.getElementById('closeModal').onclick = closeModal;
    }
</script>


<!---RETURN MESSAGE START--->
<!---RETURN MESSAGE START--->
<!---RETURN MESSAGE START--->
	
<meta name="viewport" content="width=device-width, initial-scale=1">
 

<!-- Page -->

<div class="page">
  <div class="container mx-auto">
    <div class="flex flex-col">
      <div class="card p-8"> 
        <form id="form1" name="form1" method="post" action="" class="flex flex-col space-y-4">
          <div class="flex flex-col">
            <div class="flex justify-start w-full border-b border-gray-300">
              <table class="border-collapse">
                <tbody>
                  <tr>
                    <td>
                    <a href="sppb_tetapan_organisasi.cfm">
                      <button type="button" class="bg-transparent border-b  rounded border-gray-500 text-gray-500 font-regular py-2 px-4 hover:bg-gray-400 transition duration-200 focus:outline-none focus:ring focus:ring-gray-300">
                        Organisasi
                      </button>
                    </a>
                  </td>
                  <td>
                    <a href="sppb_tetapan_organisasi_jabatan.cfm">
                      <button type="button" class="bg-transparent border-b-4  rounded border-gray-500 text-gray-500 font-regular py-2 px-4  hover:bg-gray-400 transition duration-200 focus:outline-none focus:ring focus:ring-gray-300">
                        Jabatan/Unit
                      </button>
                    </a>
                  </td>
                  </tr>
                </tbody>
              </table>
            </div>
              
            <div class="bg-gray-700 border border-gray-700 p-4 mt-4" data-plugin="appear" data-animate="fade">
              <table class="w-full border-collapse bg-gray-700">
                <tbody>
                  <tr>
                    <td class="text-white">
                      <h4 class="text-lg font-regular">TETAPAN - JABATAN</h4>
                    </td>
                    <td class="w-1/10"></td>
                    <td class="text-right">
                      <div class="flex justify-end">
                        <cfif #RS_AKSES_PENGGUNA.USR_CTL_TETAPAN_SISTEM# CONTAINS 'E'> 
                          <button class="bg-green-500 text-white font-regular py-2 px-4 rounded hover:bg-green-700 focus:outline-none" style="width: 100px; height: 40px;" data-target="#MODAL_DAFTAR" data-toggle="modal">
                            Daftar
                          </button>
                        </cfif>
                      </div>
                    </td>
                  </tr>
                </tbody>
              </table>
            </div>   
            
            <div class="flex items-center justify-end py-2">
                    Bilangan Rekod : <cfoutput>#RS_JABATAN.RecordCount#</cfoutput>
            
            </div>

			   
            <div class="panel-body-12">
              <table class="w-full border border-gray-300 overflow-x-auto">
                <thead class="bg-indigo-600">
                  <tr align="center">
                    <th class="border border-gray-300 py-2 px-4 text-white font-medium" style="width: 5%;">No.</th>
                    <th class="border border-gray-300 py-2 px-4 text-white font-medium" style="width: 30%;">Jabatan / Unit</th>
                    <th class="border border-gray-300 py-2 px-4 text-white font-medium" style="width: 15%;">Kod</th>
                    <th class="border border-gray-300 py-2 px-4 text-white font-medium" style="width: 30%;">Catatan</th>
                    <th class="border border-gray-300 py-2 px-4 text-white font-medium" style="width: 20%;">Tindakan</th>
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
                        <a class="animsition-link" href="sppb_tetapan_organisasi_jabatan_maklumat.cfm"> 
                          <button type="button" class="daftar-button">
                            Kemaskini&nbsp;<span class="fas fa-pencil-alt"></span> 
                          </button>
                        </a>
                        <a class="animsition-link" href="sppb_tetapan_organisasi_jabatan_maklumat.cfm"> 
                          <button type="button" class="bg-red-500 text-white px-4 rounded hover:bg-red-700 transition duration-200 mt-2" style="width: 100px; height: 40px;">
                            Hapus&nbsp;<span class="icon ion-md-clipboard"></span> 
                          </button>
                        </a>
                      </td>
                    </tr>
                  </cfoutput>
                </tbody>
              </table>  
            </div> 
 
 


</div> 
</form>
		  
<div class="fixed inset-0 flex items-center justify-center bg-gray-800 bg-opacity-50 hidden" id="MODAL_DAFTAR" aria-hidden="true" role="dialog" tabindex="-1">
    <div class="bg-white rounded-lg shadow-lg w-1/3 p-0">
        <form id="form2" name="form2" method="post">
            <div class="bg-gray-500 text-white p-4 rounded-t-lg">
                <h2 class="text-lg font-regular">Tambah Peralatan</h2>
            </div> 
            <div class="p-6">  
                <div class="flex items-center mt-4">
                    <label class="w-1/3 text-gray-700">No. Unit:</label>
                    <input type="text" name="HHR_UNIT_ID" class="form-control w-2/3 border-gray-300 rounded-lg px-2 py-1" required>
                </div>
                <div class="flex items-center mt-4">
                    <label class="w-1/3 text-gray-700">No. Siri:</label>
                    <input type="text" name="HHR_UNIT_SN" class="form-control w-2/3 border-gray-300 rounded-lg px-2 py-1" required>
                </div>
                <div class="flex justify-between mt-5">
                    <input type="submit" class="bg-blue-500 text-white py-2 px-4 rounded hover:bg-blue-700 w-1/3" id="submitBtn" value="Simpan" />
                    <button type="button" class="bg-green-500 text-white py-2 px-4 rounded hover:bg-green-700 w-1/3" data-dismiss="modal">Kembali</button>
                </div>
            </div>
        </form>
    </div>
</div> 

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
    document.querySelectorAll('.fixed').forEach(modal => {
        modal.addEventListener('click', (e) => {
            if (e.target === modal) {
                modal.classList.add('hidden');
            }
        });
    });

    // Handle form submission with AJAX
    document.getElementById('form2').addEventListener('submit', function(event) {
        console.log("Form submitted!"); // Debugging log
        event.preventDefault(); // Prevent default form submission

        // Gather form data
        const formData = new FormData(this);

        // Send data using fetch API
        fetch('your_endpoint_here', { // Replace with your endpoint
            method: 'POST',
            body: formData
        })
        .then(response => response.json()) // Assuming the server returns JSON
        .then(data => {
            console.log('Success:', data);
            document.querySelector('#MODAL_DAFTAR').classList.add('hidden'); // Hide modal after successful submission
        })
        .catch(error => {
            console.error('Error:', error);
        });
    });
</script>
	  
</div>
</div>
</div>
</div>

</div>

<!-- End Page -->