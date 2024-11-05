
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

<cfparam name="URL.USR_PEGKOD" default="">
<cfparam name="FORM.USR_PEGKOD" default="#URL.USR_PEGKOD#">
<cfparam name="FORM.USR_NAMA" default="">
<cfparam name="FORM.USR_JAB_KOD" default="">
<cfparam name="FORM.USR_JAWATAN" default="">
<cfparam name="FORM.USR_KP" default="">
<cfparam name="FORM.USR_TELNO" default="">
<cfparam name="FORM.USR_EMEL" default="">
<cfparam name="FORM.USR_CTL_DATA_JABALL" default="">
<cfparam name="FORM.USR_CTL_DATA_PROFIL" default="">
<cfparam name="FORM.USR_CTL_DATA_TEST" default="">
<cfparam name="FORM.USR_CTL_MODUL_PEMAJU" default="">
<cfparam name="FORM.USR_CTL_MODUL_PEMBELI" default="">
<cfparam name="FORM.USR_CTL_TETAPAN_SISTEM" default="">
<cfparam name="FORM.USR_CTL_TETAPAN_PENGGUNA" default="">
<cfparam name="FORM.USR_CTL_TETAPAN_TEMPAT" default="">
<cfparam name="FORM.USR_CTL_TETAPAN_HARTANAH" default=""> 
	
<cfstoredproc procedure="SP_TETAPAN_PENGGUNA_CARIAN" datasource="LPN_0SYS"> 
<cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@LPN_KOD"  value="#Session.LPN_CODE#" null="No"> 
<cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@USER_ID"  value="#Session.SS_USR_ID#" null="No"> 
<cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@PAGE_URL"  value="sppb_tetapan_pengguna_kemaskini.cfm" null="No"> 
<cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@USR_PEGKOD"  value="#URL.USR_PEGKOD#" null="No"> 
<cfprocresult name = RS_PENGGUNA> 
</cfstoredproc> 

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
        <div class="flex flex-col shadow-md">  
	 
<cfoutput query="RS_PENGGUNA">
<div class="w-full bg-[##580588] rounded-t-lg p-4 mt-4">
    <div class="flex justify-between items-center">
        <h4 class="text-white font-medium">TETAPAN - PENGGUNA - KEMASKINI MAKLUMAT</h4>
        
        <div class="flex space-x-2">    
        </div>
    </div>
</div>


<div class="w-full border border-gray-300"> 
    <!---<div class="grid grid-cols-1 sm:grid-cols-2">--->
	<div class="grid grid-cols-1 sm:grid-cols-2">
		<!---<div class="grid grid-cols-1"> --->
		<div class="col-span-1">
			<div class="m-2">
								<table class="w-full border border-gray-300">
									<tr>
										<td class="px-2 py-2" width="25%">  
											<div class="flex items-center">
												<span class="font-medium text-gray-800">No. Kakitangan</span> 
											</div> 
										</td> 
										<td class="px-2 py-2">  
											<div class="flex items-center"> 
												<span class="text-left">:</span> 
											</div> 
										</td> 
										<td class="px-2 py-2">  
											<div class="flex items-center">  
												<input readonly name="USR_PEGKOD" class="w-full bg-gray-200 text-gray-800 border border-gray-300 rounded-sm px-2 py-1 font-light" type="text" value="#USR_PEGKOD#"/>
											</div> 
										</td> 
									</tr>
									<tr> 
										<td class="px-2 py-2" width="25%">  
											<div class="flex items-center">
												<span class="font-medium text-gray-800">Nama</span> 
											</div> 
										</td> 
										<td class="px-2 py-2">  
											<div class="flex items-center"> 
												<span class="text-left">:</span> 
											</div> 
										</td> 
										<td class="px-2 py-2" colspan="2">  
											<div class="flex items-center">  
												<input name="USR_NAMA" class="w-full bg-gray-50 text-gray-800 border border-gray-300 rounded-sm px-2 py-1 font-light" type="text" value="#USR_NAMA#"/>
											</div> 
										</td>
									</tr>
									<tr> 
										<td class="px-2 py-2" width="25%">  
											<div class="flex items-center">
												<span class="font-medium text-gray-800">Jabatan</span> 
											</div> 
										</td> 
										<td class="px-2 py-2">  
											<div class="flex items-center"> 
												<span class="text-left">:</span> 
											</div> 
										</td> 
										<td class="px-2 py-2" colspan="2">  
											<div class="flex items-center">  
												<select name="USR_JAB_KOD" id="USR_JAB_KOD" class="w-full text-gray-800 border border-gray-400 rounded-md px-2 -py-1">
													<option value="">--Sila Pilih--</option>
													<cfloop query="RS_JABATAN">
														<option value="#JAB_KOD#" 
															<cfif isdefined("RS_PENGGUNA.USR_JAB_KOD") and 
															RS_PENGGUNA.USR_JAB_KOD eq '#JAB_KOD#'>selected="selected"
															</cfif>>
															#JAB_KOD# - #JAB_NAMA#
														</option>
													</cfloop>
												</select>
											</div> 
										</td>
									</tr>
									<tr> 
										<td class="px-2 py-2" width="25%">  
											<div class="flex items-center">
												<span class="font-medium text-gray-800">Jawatan</span> 
											</div> 
										</td> 
										<td class="px-2 py-2">  
											<div class="flex items-center"> 
												<span class="text-left">:</span> 
											</div> 
										</td> 
										<td class="px-2 py-2" colspan="2">  
											<div class="flex items-center">  
												<input name="USR_JAWATAN" class="w-full bg-gray-50 text-gray-800 border border-gray-300 rounded-sm px-2 py-1 font-light" type="text" value="#USR_JAWATAN#"/>
											</div> 
										</td> 
									</tr>
									<tr>
										<td class="px-2 py-2" width="25%">  
											<div class="flex items-center">
												<span class="font-medium text-gray-800">No. Kad Pengenalan</span> 
											</div> 
										</td> 
										<td class="px-2 py-2">  
											<div class="flex items-center"> 
												<span class="text-left">:</span> 
											</div> 
										</td> 
										<td class="px-2 py-2" colspan="2">  
											<div class="flex items-center">  
												<input name="USR_KP" class="w-full bg-gray-50 text-gray-800 border border-gray-300 rounded-sm px-2 py-1 font-light" type="text" value="#USR_KP#"/>
											</div> 
										</td> 
									</tr>
									<tr>
										<td class="px-2 py-2" width="25%">  
											<div class="flex items-center">
												<span class="font-medium text-gray-800">Tel No.</span> 
											</div> 
										</td> 
										<td class="px-2 py-2">  
											<div class="flex items-center"> 
												<span class="text-left">:</span> 
											</div> 
										</td> 
										<td class="px-2 py-2" colspan="2">  
											<div class="flex items-center">  
												<input name="USR_TELNO" class="w-full bg-gray-50 text-gray-800 border border-gray-300 rounded-sm px-2 py-1 font-light" type="text" value="#USR_TELNO#"/>
											</div> 
										</td> 
									</tr>
									<tr>
										<td class="px-2 py-2" width="25%">  
											<div class="flex items-center">
												<span class="font-medium text-gray-800">E-mel</span> 
											</div> 
										</td> 
										<td class="px-2 py-2">  
											<div class="flex items-center"> 
												<span class="text-left">:</span> 
											</div> 
										</td> 
										<td class="px-2 py-2" colspan="2">  
											<div class="flex items-center">  
												<input name="USR_EMEL" class="w-full bg-gray-50 text-gray-800 border border-gray-300 rounded-sm px-2 py-1 font-light" type="text" value="#USR_EMEL#"/>
											</div> 
										</td> 
									</tr>
									<tr>
										<td class="px-2 py-2" width="25%">  
											<div class="flex items-center">
												<span class="font-medium text-gray-800">Kategori Pengguna</span> 
											</div> 
										</td> 
										<td class="px-2 py-2">  
											<div class="flex items-center"> 
												<span class="text-left">:</span> 
											</div> 
										</td> 
										<td class="px-2 py-2" colspan="2">  
											<div class="flex justify-start gap-2 sm:gap-6 items-center"> 
												<div class="flex gap-2"> 
													<input  type="radio" name="USR_ROLES_BIASA" value="Y"<cfif USR_ROLES_BIASA EQ 'Y'> checked</cfif>>Biasa
												</div>
												<div class="flex gap-2">
													<input  type="radio" name="USR_ROLES_ADMIN" value="Y"<cfif USR_ROLES_ADMIN EQ 'Y'> checked</cfif>>Admin
												</div>
												<div class="flex gap-2">
													<cfif #Session.USR_ROLES_SUPER# EQ 'Y'>
														<input  type="radio" name="USR_ROLES_SUPER" value="Y"<cfif USR_ROLES_SUPER EQ 'Y'> checked</cfif>>Super
													</cfif>
												</div>
											</div> 
										</td> 
									</tr> 
								</table> 
							</div> 
			<!--- <div class="border border-gray-300 m-2">
				<div class="grid grid-cols-6">
					<div class="space-y-4 col-span-1 p-2">  
						<div class="flex items-center">
							<span class="font-medium text-gray-800">No. Kakitangan</span> 
						</div> 
					</div> 
					<div class="space-y-4 col-span-1 p-2">  
						<div class="flex items-center"> 
							<span class="text-left">:</span> 
						</div> 
					</div> 
					<div class="space-y-4 col-span-4 p-2">  
						<div class="flex items-center">  
							<input  name="USR_PEGKOD" class="w-full text-gray-800 border border-gray-400 rounded-md px-2 py-1" type="text" value="#USR_PEGKOD#"/>
						</div> 
					</div>  
					<div class="space-y-4 col-span-1 p-2">  
						<div class="flex items-center">
							<span class="font-medium text-gray-800">Nama</span> 
						</div> 
					</div> 
					<div class="space-y-4 col-span-1 p-2">  
						<div class="flex items-center"> 
							<span class="text-left">:</span> 
						</div> 
					</div> 
					<div class="space-y-4 col-span-4 p-2">  
						<div class="flex items-center">  
							<input name="USR_NAMA" class="w-full text-gray-800 border border-gray-400 rounded-md px-2 py-1" type="text" value="#USR_NAMA#"/>
						</div> 
					</div> 

				<div class="space-y-4 col-span-1 p-2">
					<div class="flex items-center">
						<span class="font-medium text-gray-800">Jabatan</span>
					</div>
				</div>
				<div class="space-y-4 col-span-1 p-2">
					<div class="flex items-center">
						<span class="text-left">:</span>
					</div>
				</div>
				<div class="space-y-4 col-span-4 p-2">
					<div class="flex items-center"> 
						<select name="USR_JAB_KOD" id="USR_JAB_KOD" class="w-full text-gray-800 border border-gray-400 rounded-md px-2 py-1">
							<option value="">--Sila Pilih--</option>
							<cfloop query="RS_JABATAN">
								<option value="#JAB_KOD#" 
									<cfif isdefined("form.USR_JAB_KOD") and 
									form.USR_JAB_KOD eq '#JAB_KOD#'>selected="selected"
									</cfif>>
									#JAB_KOD# - #JAB_NAMA#
								</option>
							</cfloop>
						</select>
					</div>
				</div>
				
	
				<div class="space-y-4 col-span-1 p-2">  
					<div class="flex items-center">
						<span class="font-medium text-gray-800">Jawatan</span> 
					</div> 
				</div> 
				<div class="space-y-4 col-span-1 p-2">  
					<div class="flex items-center"> 
						<span class="text-left">:</span> 
					</div> 
				</div> 
				<div class="space-y-4 col-span-4 p-2">  
					<div class="flex items-center">  
						<input name="USR_JAWATAN" class="w-full text-gray-800 border border-gray-400 rounded-md px-2 py-1" type="text" value="#USR_JAWATAN#"/>
					</div> 
				</div> 

				<!---					<div class="space-y-4 col-span-3 p-2">  
										<div class="flex items-center">
											<span class="font-medium text-gray-800">Tarikh Berhenti</span> 
										</div> 
									</div> 
									<div class="space-y-4 col-span-1 p-2">  
										<div class="flex items-center"> 
											<span class="text-left">:</span> 
										</div> 
									</div> 
									<div class="space-y-4 col-span-5 p-2">
										<div class="flex items-center space-x-2">
											<input name="USR_HENTI_TKH" id="USR_HENTI_TKH" class="w-full text-gray-800 border border-gray-400 rounded-md px-2 py-1" type="date" value="#USR_HENTI_TKH#"/>

										</div>
									</div> 
									<div class="space-y-4 col-span-1 p-2">  
										<div class="flex items-center">  
											<button type="button" onclick="clearDateField()" class="bg-red-500 text-white px-3 py-1 rounded-md hover:bg-red-600 focus:outline-none">
												X
											</button>
											<script type="text/javascript">
												function clearDateField() {
													document.getElementById("USR_HENTI_TKH").value = "";
												}
											</script>
										</div> 
									</div>  --->
					<div class="space-y-4 col-span-1 p-2">  
						<div class="flex items-center">
							<span class="font-medium text-gray-800">No. Kad Pengenalan</span> 
						</div> 
					</div> 
					<div class="space-y-4 col-span-1 p-2">  
						<div class="flex items-center"> 
							<span class="text-left">:</span> 
						</div> 
					</div> 
					<div class="space-y-4 col-span-4 p-2">  
						<div class="flex items-center">  
							<input name="USR_KP" class="w-full text-gray-800 border border-gray-400 rounded-md px-2 py-1" type="text" value="#USR_KP#"/>
						</div> 
					</div> 
					<div class="space-y-4 col-span-1 p-2">  
						<div class="flex items-center">
							<span class="font-medium text-gray-800">Tel No.</span> 
						</div> 
					</div> 
					<div class="space-y-4 col-span-1 p-2">  
						<div class="flex items-center"> 
							<span class="text-left">:</span> 
						</div> 
					</div> 
					<div class="space-y-4 col-span-4 p-2">  
						<div class="flex items-center">  
							<input name="USR_TELNO" class="w-full text-gray-800 border border-gray-400 rounded-md px-2 py-1" type="text" value="#USR_TELNO#"/>
						</div> 
					</div> 
					<div class="space-y-4 col-span-1 p-2">  
						<div class="flex items-center">
							<span class="font-medium text-gray-800">E-mel</span> 
						</div> 
					</div> 
					<div class="space-y-4 col-span-1 p-2">  
						<div class="flex items-center"> 
							<span class="text-left">:</span> 
						</div> 
					</div> 
					<div class="space-y-4 col-span-4 p-2">  
						<div class="flex items-center">  
							<input name="USR_EMEL" class="w-full text-gray-800 border border-gray-400 rounded-md px-2 py-1" type="text" value="#USR_EMEL#"/>
						</div> 
					</div> 
					<div class="space-y-4 col-span-1 p-2">  
						<div class="flex items-center">
							<span class="font-medium text-gray-800">Kategori Pengguna</span> 
						</div> 
					</div> 
					<div class="space-y-4 col-span-1 p-2">  
						<div class="flex items-center"> 
							<span class="text-left">:</span> 
						</div> 
					</div> 
				<div class="space-y-4 col-span-1 p-2">   
					<div class="flex items-center">
						<input type="radio" name="USR_ROLES" value="Biasa" <cfif USR_ROLES_BIASA EQ 'Y'> checked</cfif>> Biasa
					</div> 
				</div> 
				<div class="space-y-4 col-span-1 p-2">  
					<div class="flex items-center">  
						<input type="radio" name="USR_ROLES" value="Admin" <cfif USR_ROLES_ADMIN EQ 'Y'> checked</cfif>> Admin
					</div> 
				</div> 
				<div class="space-y-4 col-span-1 p-2">  
					<cfif Session.USR_ROLES_SUPER EQ 'Y'>
						<div class="flex items-center">  
							<input type="radio" name="USR_ROLES" value="Super" <cfif USR_ROLES_SUPER EQ 'Y'> checked</cfif>> Super
						</div> 
					</cfif>
				</div>

				</div> 
			</div>  --->
		</div>
         
		<div class="col-span-1"> 
		<!---JANGAN DELETE--->
	<!---<div class="border border-gray-300 m-2">
				<div class="grid grid-cols-10">
					<div class="space-y-4 col-span-3 p-2">  
						<div class="flex items-center">
							<span class="font-medium text-gray-800">Default Page URL</span> 
						</div> 
					</div> 
					<div class="space-y-4 col-span-1 p-2">  
						<div class="flex items-center"> 
							<span class="text-left">:</span> 
						</div> 
					</div> 
					<div class="space-y-4 col-span-4 p-2">  
						<div class="flex items-center">  
							<input name="USR_PAGE_DEFAULT" class="w-full text-gray-800 border border-gray-400 rounded-md px-2 py-1" type="text" value="#USR_PAGE_DEFAULT#"/>
						</div> 
					</div> 
					<div class="space-y-4 col-span-2 p-2"> 
						<div class="flex items-center">  
							<input type="checkbox" name="USR_PAGE_LOCK" value="Y" class="mr-1">Lock
						</div> 
					</div>  
				</div> 
			</div>
			<br>--->

            <div class="tabs p-2">
              <div class="block">
                <ul class="sm:flex flex-wrap border-b border-gray-200 space-x-3 transition-all duration-300 -mb-px">
                  <li>
                    <a class="inline-block py-2 px-3 text-gray-500 hover:text-gray-800 font-medium border-b-2 border-transparent tab-active:border-b-indigo-600 tab-active:text-indigo-600 active tablink whitespace-nowrap cursor-pointer" data-tab="tabs-with-underline-1" role="tab">Akses Data</a>
                  </li>
                  <li>
                    <a class="inline-block py-2 px-3 text-gray-500 hover:text-gray-800 font-medium border-b-2 border-transparent tab-active:border-b-indigo-600 tab-active:text-indigo-600 tablink whitespace-nowrap cursor-pointer" data-tab="tabs-with-underline-2" role="tab">Akses Modul</a>
                  </li>
                  <li>
                    <a class="inline-block py-2 px-3 text-gray-500 hover:text-gray-800 font-medium border-b-2 border-transparent tab-active:border-b-indigo-600 tab-active:text-indigo-600 tablink whitespace-nowrap cursor-pointer" data-tab="tabs-with-underline-3" role="tab">Akses Tetapan</a>
                  </li>
                </ul>
              </div>
              <div class="border border-gray-300 m-2">
                <div id="tabs-with-underline-1" role="tabpanel" aria-labelledby="tabs-with-underline-item-1" class="tabcontent">  
					<div class="w-full border-none space-y-4">
										<table>
											<tr>
												<td class="px-2 py-2">  
													<div class="flex items-center">
														<span class="font-medium text-gray-800">Semua Jabatan / Unit</span> 
													</div> 
												</td> 
												<td class="px-2 py-2">  
													<div class="flex items-center"> 
														<span class="text-left">:</span> 
													</div> 
												</td> 
												<td class="px-2 py-2">  
													<div class="flex items-center">  
														<input type="checkbox" name="USR_CTL_DATA_JABALL" value="Y" class="w-5 h-5 appearance-solid cursor-not-allowed border border-blue-500 bg-blue-300 rounded-md mr-2 checked:bg-no-repeat checked:bg-center"<cfif USR_CTL_DATA_JABALL EQ 'Y'> checked</cfif>>Dibenarkan
													</div>   
												</div> 
											</tr>
											<tr>
												<td class="px-2 py-2">  
													<div class="flex items-center">
														<span class="font-medium text-gray-800">Ubah Profil</span> 
													</div> 
												</td> 
												<td class="px-2 py-2">  
													<div class="flex items-center"> 
														<span class="text-left">:</span> 
													</div> 
												</td> 
												<td class="px-2 py-2">  
													<div class="flex items-center">   
														<input type="checkbox" name="USR_CTL_DATA_PROFIL" value="Y" class="w-5 h-5 appearance-solid cursor-not-allowed border border-blue-500 bg-blue-300  rounded-md mr-2 checked:bg-no-repeat checked:bg-center"<cfif USR_CTL_DATA_PROFIL EQ 'Y'> checked</cfif>>Dibenarkan
													</div> 
												</div>   
											</tr>
											<tr>
												<td class="px-2 py-2">  
													<div class="flex items-center">
														<span class="font-medium text-gray-800">Data Ujian</span> 
													</div> 
												</td> 
												<td class="px-2 py-2">  
													<div class="flex items-center"> 
														<span class="text-left">:</span> 
													</div> 
												</td> 
												<td class="px-2 py-2">  
													<div class="flex items-center">  
														<input type="checkbox" name="USR_CTL_DATA_TEST" value="Y" class="w-5 h-5 appearance-solid cursor-not-allowed border border-blue-500 bg-blue-300  rounded-md mr-2 checked:bg-no-repeat checked:bg-center"<cfif USR_CTL_DATA_TEST EQ 'Y'> checked</cfif>>Dibenarkan 
													</div> 
												</div>   
											</tr>
										</table>
									</div> 
                </div>
                <div id="tabs-with-underline-2" class="hidden tabcontent" role="tabpanel" aria-labelledby="tabs-with-underline-item-2">
					<div class="w-full border-none space-y-4">
										<table>
											<tr>
												<td class="px-2 py-2" width="20%">  
													<div class="flex items-center">
														<span class="font-medium text-gray-800">Pemaju</span> 
													</div> 
												</td>  
												<td class="px-2 py-2" width="5%">  
													<div class="flex items-center">:</div> 
												</td> 
												<td class="px-2 py-2"> 
													<div class="flex justify-around gap-8 items-center">
														<div class="flex items-center">
															<input  type="checkbox" name="USR_CTL_MODUL_PEMAJU" value="V" class="w-5 h-5 appearance-solid cursor-not-allowed border border-blue-500 bg-blue-300  rounded-md mr-2 checked:bg-no-repeat checked:bg-center" <cfif USR_CTL_MODUL_PEMAJU CONTAINS 'V'> checked</cfif>>Papar
														</div>  
														<div class="flex items-center">   
															<input  type="checkbox" name="USR_CTL_MODUL_PEMAJU" value="E" class="w-5 h-5 appearance-solid cursor-not-allowed border border-blue-500 bg-blue-300  rounded-md mr-2 checked:bg-no-repeat checked:bg-center" <cfif USR_CTL_MODUL_PEMAJU CONTAINS 'E'> checked</cfif>>Kemaskini
														</div> 
														<div class="flex items-center"> 
															<input  type="checkbox" name="USR_CTL_MODUL_PEMAJU" value="C" class="w-5 h-5 appearance-solid cursor-not-allowed border border-blue-500 bg-blue-300  rounded-md mr-2 checked:bg-no-repeat checked:bg-center" <cfif USR_CTL_MODUL_PEMAJU CONTAINS 'C'> checked</cfif>>Daftar
														</div> 
														<div class="flex items-center">  
															<input  type="checkbox" name="USR_CTL_MODUL_PEMAJU" value="D" class="w-5 h-5 appearance-solid cursor-not-allowed border border-blue-500 bg-blue-300  rounded-md mr-2 checked:bg-no-repeat checked:bg-center" <cfif USR_CTL_MODUL_PEMAJU CONTAINS 'D'> checked</cfif>>Batal/Sah
														</div> 
														<div class="flex items-center">  
															<input  type="checkbox" name="USR_CTL_MODUL_PEMAJU" value="X" class="w-5 h-5 appearance-solid cursor-not-allowed border border-blue-500 bg-blue-300  rounded-md mr-2 checked:bg-no-repeat checked:bg-center" <cfif USR_CTL_MODUL_PEMAJU CONTAINS 'X'> checked</cfif>>Hapus
														</div>
													</div> 
												</td>   
											</tr>
											<tr>
												<td class="px-2 py-2" width="20%">  
													<div class="flex items-center">
														<span class="font-medium text-gray-800">Pembeli</span> 
													</div> 
												</td>  
												<td class="px-2 py-2" width="5%">  
													<div class="flex items-center">:</div> 
												</td> 
												<td class="px-2 py-2">
													<div class="flex justify-around gap-8 items-center">
														<div class="flex items-center"> 
															<input  type="checkbox" name="USR_CTL_MODUL_PEMBELI" value="V" class="w-5 h-5 appearance-solid cursor-not-allowed border border-blue-500 bg-blue-300  rounded-md mr-2 checked:bg-no-repeat checked:bg-center" <cfif USR_CTL_MODUL_PEMBELI CONTAINS 'V'> checked</cfif>>Papar
														</div>   
														<div class="flex items-center">   
															<input  type="checkbox" name="USR_CTL_MODUL_PEMBELI" value="E" class="w-5 h-5 appearance-solid cursor-not-allowed border border-blue-500 bg-blue-300  rounded-md mr-2 checked:bg-no-repeat checked:bg-center" <cfif USR_CTL_MODUL_PEMBELI CONTAINS 'E'> checked</cfif>>Kemaskini
														</div>
														<div class="flex items-center">   
															<input  type="checkbox" name="USR_CTL_MODUL_PEMBELI" value="C" class="w-5 h-5 appearance-solid cursor-not-allowed border border-blue-500 bg-blue-300  rounded-md mr-2 checked:bg-no-repeat checked:bg-center" <cfif USR_CTL_MODUL_PEMBELI CONTAINS 'C'> checked</cfif>>Daftar
														</div>
														<div class="flex items-center">   
															<input  type="checkbox" name="USR_CTL_MODUL_PEMBELI" value="D" class="w-5 h-5 appearance-solid cursor-not-allowed border border-blue-500 bg-blue-300  rounded-md mr-2 checked:bg-no-repeat checked:bg-center" <cfif USR_CTL_MODUL_PEMBELI CONTAINS 'D'> checked</cfif>>Batal/Sah
														</div>
														<div class="flex items-center">   
															<input  type="checkbox" name="USR_CTL_MODUL_PEMBELI" value="X" class="w-5 h-5 appearance-solid cursor-not-allowed border border-blue-500 bg-blue-300  rounded-md mr-2 checked:bg-no-repeat checked:bg-center" <cfif USR_CTL_MODUL_PEMBELI CONTAINS 'X'> checked</cfif>>Hapus
														</div> 
													</div>   
												</td> 
											</tr>
										</table>
									</div>  
                </div>
                <div id="tabs-with-underline-3" class="hidden tabcontent" role="tabpanel" aria-labelledby="tabs-with-underline-item-3">
					<div class="w-full border-none space-y-4">
										<table>
											<tr>
													<td class="px-2 py-2" width="20%">  
														<div class="flex items-center">
															<span class="font-medium text-gray-800">Sistem</span> 
														</div> 
													</td>   
													<td class="px-2 py-2">  
														<div class="flex items-center">:</div> 
													</td> 
													<td class="px-2 py-2"> 
														<div class="flex justify-around gap-8 items-center">
															<div class="flex items-center">
																<input  type="checkbox" name="USR_CTL_TETAPAN_SISTEM" value="V" class="w-5 h-5 appearance-solid cursor-not-allowed border border-blue-500 bg-blue-300  rounded-md mr-2 checked:bg-no-repeat checked:bg-center" <cfif USR_CTL_TETAPAN_SISTEM CONTAINS 'V'> checked</cfif>>Papar
															</div>  
															<div class="flex items-center">   
																<input  type="checkbox" name="USR_CTL_TETAPAN_SISTEM" value="E" class="w-5 h-5 appearance-solid cursor-not-allowed border border-blue-500 bg-blue-300  rounded-md mr-2 checked:bg-no-repeat checked:bg-center" <cfif USR_CTL_TETAPAN_SISTEM CONTAINS 'E'> checked</cfif>>Kemaskini
															</div> 
															<div class="flex items-center">   
																<input  type="checkbox" name="USR_CTL_TETAPAN_SISTEM" value="C" class="w-5 h-5 appearance-solid cursor-not-allowed border border-blue-500 bg-blue-300  rounded-md mr-2 checked:bg-no-repeat checked:bg-center" <cfif USR_CTL_TETAPAN_SISTEM CONTAINS 'C'> checked</cfif>>Daftar
															</div> 
															<div class="flex items-center">   
																<input  type="checkbox" name="USR_CTL_TETAPAN_SISTEM" value="D" class="w-5 h-5 appearance-solid cursor-not-allowed border border-blue-500 bg-blue-300  rounded-md mr-2 checked:bg-no-repeat checked:bg-center" <cfif USR_CTL_TETAPAN_SISTEM CONTAINS 'D'> checked</cfif>>Batal/Sah
															</div>
															<div class="flex items-center">   
																<input  type="checkbox" name="USR_CTL_TETAPAN_SISTEM" value="X" class="w-5 h-5 appearance-solid cursor-not-allowed border border-blue-500 bg-blue-300  rounded-md mr-2 checked:bg-no-repeat checked:bg-center" <cfif USR_CTL_TETAPAN_SISTEM CONTAINS 'X'> checked</cfif>>Hapus
															</div>  
														</div>
													</td>   
											</tr>
											<tr>
											
												<td class="px-2 py-2" width="20%"> 
													<div class="flex items-center">
														<span class="font-medium text-gray-800">Pengguna</span> 
													</div> 
												</td>  
												<td class="px-2 py-2">  
													<div class="flex items-center">:</div> 
												</td> 
												<td class="px-2 py-2">
													<div class="flex justify-around gap-8 items-center">
														<div class="flex items-center">
															<input  type="checkbox" name="USR_CTL_TETAPAN_PENGGUNA" value="V" class="w-5 h-5 appearance-solid cursor-not-allowed border border-blue-500 bg-blue-300  rounded-md mr-2 checked:bg-no-repeat checked:bg-center" <cfif USR_CTL_TETAPAN_PENGGUNA CONTAINS 'V'> checked</cfif>>Papar
														</div>   
														<div class="flex items-center">   
															<input  type="checkbox" name="USR_CTL_TETAPAN_PENGGUNA" value="E" class="w-5 h-5 appearance-solid cursor-not-allowed border border-blue-500 bg-blue-300  rounded-md mr-2 checked:bg-no-repeat checked:bg-center" <cfif USR_CTL_TETAPAN_PENGGUNA CONTAINS 'E'> checked</cfif>>Kemaskini
														</div> 
														<div class="flex items-center">   
															<input  type="checkbox" name="USR_CTL_TETAPAN_PENGGUNA" value="C" class="w-5 h-5 appearance-solid cursor-not-allowed border border-blue-500 bg-blue-300  rounded-md mr-2 checked:bg-no-repeat checked:bg-center" <cfif USR_CTL_TETAPAN_PENGGUNA CONTAINS 'C'> checked</cfif>>Daftar
														</div> 
														<div class="flex items-center">   
															<input  type="checkbox" name="USR_CTL_TETAPAN_PENGGUNA" value="D" class="w-5 h-5 appearance-solid cursor-not-allowed border border-blue-500 bg-blue-300  rounded-md mr-2 checked:bg-no-repeat checked:bg-center" <cfif USR_CTL_TETAPAN_PENGGUNA CONTAINS 'D'> checked</cfif>>Batal/Sah
														</div>
														<div class="flex items-center">   
															<input  type="checkbox" name="USR_CTL_TETAPAN_PENGGUNA" value="X" class="w-5 h-5 appearance-solid cursor-not-allowed border border-blue-500 bg-blue-300  rounded-md mr-2 checked:bg-no-repeat checked:bg-center" <cfif USR_CTL_TETAPAN_PENGGUNA CONTAINS 'X'> checked</cfif>>Hapus
														</div>  
													</div>
												</td>  
											</tr>
											<tr>
												<td class="px-2 py-2" width="20%">  
													<div class="flex items-center">
														<span class="font-medium text-gray-800">Tempat</span> 
													</div> 
												</td>  
												<td class="px-2 py-2">  
													<div class="flex items-center">:</div> 
												</td> 
												<td class="px-2 py-2">
													<div class="flex justify-around gap-8 items-center">
														<div class="flex items-center">  
															<input  type="checkbox" name="USR_CTL_TETAPAN_TEMPAT" value="V" class="w-5 h-5 appearance-solid cursor-not-allowed border border-blue-500 bg-blue-300  rounded-md mr-2 checked:bg-no-repeat checked:bg-center" <cfif USR_CTL_TETAPAN_TEMPAT CONTAINS 'V'> checked</cfif>>Papar
														</div>   
														<div class="flex items-center">   
															<input  type="checkbox" name="USR_CTL_TETAPAN_TEMPAT" value="E" class="w-5 h-5 appearance-solid cursor-not-allowed border border-blue-500 bg-blue-300  rounded-md mr-2 checked:bg-no-repeat checked:bg-center" <cfif USR_CTL_TETAPAN_TEMPAT CONTAINS 'E'> checked</cfif>>Kemaskini
														</div>
														<div class="flex items-center">   
															<input  type="checkbox" name="USR_CTL_TETAPAN_TEMPAT" value="C" class="w-5 h-5 appearance-solid cursor-not-allowed border border-blue-500 bg-blue-300  rounded-md mr-2 checked:bg-no-repeat checked:bg-center" <cfif USR_CTL_TETAPAN_TEMPAT CONTAINS 'C'> checked</cfif>>Daftar
														</div> 
														<div class="flex items-center">   
															<input  type="checkbox" name="USR_CTL_TETAPAN_SISTEM" value="D" class="w-5 h-5 appearance-solid cursor-not-allowed border border-blue-500 bg-blue-300  rounded-md mr-2 checked:bg-no-repeat checked:bg-center" <cfif USR_CTL_TETAPAN_SISTEM CONTAINS 'D'> checked</cfif>>Batal/Sah
														</div>
														<div class="flex items-center">   
															<input  type="checkbox" name="USR_CTL_TETAPAN_TEMPAT" value="X" class="w-5 h-5 appearance-solid cursor-not-allowed border border-blue-500 bg-blue-300  rounded-md mr-2 checked:bg-no-repeat checked:bg-center" <cfif USR_CTL_TETAPAN_TEMPAT CONTAINS 'X'> checked</cfif>>Hapus
														</div>  
													</div>
												</td>
											</tr>
											<tr>
												<td class="px-2 py-2" width="20%">  
													<div class="flex items-center">
														<span class="font-medium text-gray-800">Hartanah</span> 
													</div> 
												</td>  
												<td class="px-2 py-2">  
													<div class="flex items-center">:</div> 
												</td> 
												<td class="px-2 py-2">  
													<div class="flex justify-around gap-8 items-center">
														<div class="flex items-center">
															<input  type="checkbox" name="USR_CTL_TETAPAN_HARTANAH" value="V" class="w-5 h-5 appearance-solid cursor-not-allowed border border-blue-500 bg-blue-300  rounded-md mr-2 checked:bg-no-repeat checked:bg-center" <cfif USR_CTL_TETAPAN_HARTANAH CONTAINS 'V'> checked</cfif>>Papar
														</div> 
														<div class="flex items-center">   
															<input  type="checkbox" name="USR_CTL_TETAPAN_HARTANAH" value="E" class="w-5 h-5 appearance-solid cursor-not-allowed border border-blue-500 bg-blue-300  rounded-md mr-2 checked:bg-no-repeat checked:bg-center" <cfif USR_CTL_TETAPAN_HARTANAH CONTAINS 'E'> checked</cfif>>Kemaskini
														</div>
														<div class="flex items-center">   
															<input  type="checkbox" name="USR_CTL_TETAPAN_HARTANAH" value="C" class="w-5 h-5 appearance-solid cursor-not-allowed border border-blue-500 bg-blue-300  rounded-md mr-2 checked:bg-no-repeat checked:bg-center" <cfif USR_CTL_TETAPAN_HARTANAH CONTAINS 'C'> checked</cfif>>Daftar
														</div>
														<div class="flex items-center">   
															<input  type="checkbox" name="USR_CTL_TETAPAN_HARTANAH" value="D" class="w-5 h-5 appearance-solid cursor-not-allowed border border-blue-500 bg-blue-300  rounded-md mr-2 checked:bg-no-repeat checked:bg-center" <cfif USR_CTL_TETAPAN_HARTANAH CONTAINS 'D'> checked</cfif>>Batal/Sah
														</div> 
														<div class="flex items-center">   
															<input  type="checkbox" name="USR_CTL_TETAPAN_HARTANAH" value="X" class="w-5 h-5 appearance-solid cursor-not-allowed border border-blue-500 bg-blue-300  rounded-md mr-2 checked:bg-no-repeat checked:bg-center" <cfif USR_CTL_TETAPAN_HARTANAH CONTAINS 'X'> checked</cfif>>Hapus
														</div>   
													</div>
												</td> 
											</tr>
										</table>
									</div>
                </div>
              </div>
            </div>
		</div>
    </div>
	
<div class="grid grid-cols-3 mt-4">
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
            <button  type="submit" class="flex items-center justify-center gap-2 w-1/2 bg-blue-200 text-white font-medium py-2 px-4 rounded cursor-not-allowed" name="SIMPAN" id="SIMPAN"> 
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


</cfoutput>
 
			
<cfif isdefined("form.SIMPAN" )> 
   <cfstoredproc procedure="[SP_TETAPAN_PENGGUNA_KEMASKINI]" datasource="LPN_0SYS"> 
	<cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@LPN_KOD"  value="#Session.LPN_CODE#"> 
	<cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@USER_ID"  value="#Session.SS_USR_ID#">
	<cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@PAGE_URL"  value="sppb_tetapan_pengguna_kemaskini.cfm">  
	<cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@USR_PEGKOD"  value="#FORM.USR_PEGKOD#">
	<cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@USR_NAMA"  value="#FORM.USR_NAMA#">
	<cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@USR_JAB_KOD"  value="#FORM.USR_JAB_KOD#"> 
	<cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@USR_JAWATAN"  value="#FORM.USR_JAWATAN#"> 
	<cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@USR_KP"  value="#FORM.USR_KP#">
	<cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@USR_TELNO"  value="#FORM.USR_TELNO#">
	<cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@USR_EMEL"  value="#FORM.USR_EMEL#">
	<!---<cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@PAGE_DEFAULT"  value="#FORM.PAGE_DEFAULT#">
	<cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@PAGE_LOCK"  value="#FORM.PAGE_LOCK#">--->
	<cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@CTL_JABALL"  value="#FORM.USR_CTL_DATA_JABALL#">
	<cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@CTL_PROFIL"  value="#FORM.USR_CTL_DATA_PROFIL#">
	<cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@CTL_DATATEST"  value="#FORM.USR_CTL_DATA_TEST#">
	<cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@CTL_PEMAJU"  value="#FORM.USR_CTL_MODUL_PEMAJU#">
	<cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@CTL_PEMBELI"  value="#FORM.USR_CTL_MODUL_PEMBELI#">
	<cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@CTL_TETAPAN_SISTEM"  value="#FORM.USR_CTL_TETAPAN_SISTEM#">
	<cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@CTL_TETAPAN_PENGGUNA"  value="#FORM.USR_CTL_TETAPAN_PENGGUNA#">
	<cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@CTL_TETAPAN_TEMPAT"  value="#FORM.USR_CTL_TETAPAN_TEMPAT#">
	<cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@CTL_TETAPAN_HARTANAH"  value="#FORM.USR_CTL_TETAPAN_HARTANAH#">
  <cfprocresult name = RS_MASUK_DATA>		
  </cfstoredproc>

  <cfif isdefined("RS_MASUK_DATA.RETURN_MESSAGE") AND #RS_MASUK_DATA.RETURN_CODE# LT 0>
  <p><cfoutput>#RS_MASUK_DATA.RETURN_MESSAGE#</cfoutput></p>
  <cflocation url="sppb_tetapan_pengguna_papar.cfm?USR_PEGKOD=#FORM.USR_PEGKOD#&ERROR=#RS_MASUK_DATA.RETURN_MESSAGE#">
  <cfelse>
  <cflocation url="sppb_tetapan_pengguna_papar.cfm?USR_PEGKOD=#FORM.USR_PEGKOD#">
  </cfif>		
  </cfif>	 


<div id="MODAL_KELUAR_PAGE" class="fixed inset-0 flex items-center justify-center bg-gray-800 bg-opacity-50 hidden">
    <div class="bg-white rounded-lg shadow-lg lg:w-1/3 sm:w-full mx-10  p-0"> <!-- Removed p-6 for tighter spacing -->
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
                <button type="button" id="confirmExitButton" class="flex items-center justify-center gap-2 bg-green-500 text-white font-medium py-2 px-4 rounded hover:bg-green-700 w-1/3" onclick="redirectAndCloseModal()">
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
                </button>
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
window.location.href = "sppb_tetapan_pengguna_papar.cfm?USR_PEGKOD=<cfoutput>#URL.USR_PEGKOD#</cfoutput>";
}, 100); 
}
</script>
</div>  					
</form>
</div>
</div>

<!-- End Page -->