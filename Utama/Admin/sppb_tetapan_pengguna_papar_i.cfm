
<script>
document.addEventListener("DOMContentLoaded", function(event) { 
var scrollpos = localStorage.getItem('scrollpos');
if (scrollpos) window.scrollTo(0, scrollpos);
});

window.onbeforeunload = function(e) {
localStorage.setItem('scrollpos', window.scrollY);
};
</script>



<cfparam name="URL.USR_PEGKOD" default="">
<cfparam name="FORM.USR_PEGKOD" default="#URL.USR_PEGKOD#">
<cfparam name="FORM.USR_PEGNAMA" default="">
<cfparam name="FORM.JAB_NAMA" default="">
<cfparam name="FORM.USR_PEGKOD_BARU" default="">
<cfparam name="FORM.USR_LOGIN_PWD" default="">
<cfparam name="FORM.USR_PWD_AUTO" default="">
<cfparam name="FORM.USR_PWD_RESET" default="">
<cfparam name="FORM.ACT_CODE" default="">
 
	
<cfstoredproc procedure="SP_TETAPAN_PENGGUNA_CARIAN" datasource="LPN_0SYS"> 
<cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@LPN_KOD"  value="#Session.LPN_CODE#" null="No"> 
<cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@USER_ID"  value="#Session.SS_USR_ID#" null="No"> 
<cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@PAGE_URL"  value="sppb_tetapan_organisasi.cfm" null="No"> 
<cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@USR_PEGKOD"  value="#URL.USR_PEGKOD#" null="No"> 
<cfprocresult name = RS_PENGGUNA> 
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
      <div id="form1" name="form1" method="post" action="" class="flex flex-col space-y-4">
        <div class="flex flex-col shadow-md">  
			<cfoutput query="RS_PENGGUNA">
				<div class="w-full bg-[##580588] rounded-t-lg p-4 mt-4 ">
					<div class="lg:flex justify-between items-center">
						<h1 class="text-white font-medium">TETAPAN - PENGGUNA - PAPAR MAKLUMAT</h1>
						
						<div class="lg:flex space-x-2"> 
							<cfif #Session.USR_CTL_TETAPAN_PENGGUNA# CONTAINS 'X'> 
									<button type="button" id="openHapus" class="flex items-center justify-center gap-2 bg-red-500 text-white font-medium py-2 px-4 rounded hover:bg-red-700 focus:outline-none w-full">
										Hapus
										<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" class="size-5">
											<path fill-rule="evenodd" d="M8.75 1A2.75 2.75 0 0 0 6 3.75v.443c-.795.077-1.584.176-2.365.298a.75.75 0 1 0 .23 1.482l.149-.022.841 10.518A2.75 2.75 0 0 0 7.596 19h4.807a2.75 2.75 0 0 0 2.742-2.53l.841-10.52.149.023a.75.75 0 0 0 .23-1.482A41.03 41.03 0 0 0 14 4.193V3.75A2.75 2.75 0 0 0 11.25 1h-2.5ZM10 4c.84 0 1.673.025 2.5.075V3.75c0-.69-.56-1.25-1.25-1.25h-2.5c-.69 0-1.25.56-1.25 1.25v.325C8.327 4.025 9.16 4 10 4ZM8.58 7.72a.75.75 0 0 0-1.5.06l.3 7.5a.75.75 0 1 0 1.5-.06l-.3-7.5Zm4.34.06a.75.75 0 1 0-1.5-.06l-.3 7.5a.75.75 0 1 0 1.5.06l.3-7.5Z" clip-rule="evenodd" />
										</svg>
									</button> 
							</cfif> 
							<cfif #Session.USR_CTL_TETAPAN_PENGGUNA# CONTAINS 'E'>
								<a class="animsition-link" href="sppb_tetapan_pengguna_kemaskini.cfm?USR_PEGKOD=#USR_PEGKOD#">
									<button type="button" class="flex items-center justify-center gap-2 bg-green-500 text-white font-medium py-2 px-4 rounded hover:bg-green-700 focus:outline-none w-full">
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
								<a class="animsition-link" href="sppb_tetapan_pengguna.cfm">
									<button type="button" class="flex items-center justify-center gap-2 bg-gray-500 text-white font-medium py-2 px-4 rounded hover:bg-gray-700 focus:outline-none w-full">
										Kembali
										<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" class="size-5">
											<path fill-rule="evenodd" d="M7.793 2.232a.75.75 0 0 1-.025 1.06L3.622 7.25h10.003a5.375 5.375 0 0 1 0 10.75H10.75a.75.75 0 0 1 0-1.5h2.875a3.875 3.875 0 0 0 0-7.75H3.622l4.146 3.957a.75.75 0 0 1-1.036 1.085l-5.5-5.25a.75.75 0 0 1 0-1.085l5.5-5.25a.75.75 0 0 1 1.06.025Z" clip-rule="evenodd" />
										</svg>
									</button>
								</a> 
						</div>
					</div>
				</div> 
				
				<div class="w-full border border-gray-300"> 
					<!---<div class="grid grid-cols-1 sm:grid-cols-2">--->
					<div class="grid grid-cols-1 sm:grid-cols-2">
						<div class="col-span-1"> 
							<div class="m-2">
								<table class="p-4 min-w-full border border-gray-300">
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
												<input disabled name="USR_PEGKOD" class="w-full bg-gray-200 text-gray-800 border border-gray-300 rounded-sm px-2 py-1 font-light" type="text" value="#USR_PEGKOD#"/>
											</div> 
										</td> 
										<td class="px-2 py-2">  
											<div class="flex items-center">  
											<cfif #Session.USR_CTL_TETAPAN_PENGGUNA# CONTAINS 'E' OR #Session.USR_CTL_TETAPAN_PENGGUNA# CONTAINS 'C'> 
											<button id="openTukar" type="button" class="flex items-center justify-center gap-2 w-full bg-blue-500 hover:bg-blue-600 text-white py-2 px-4 rounded">
											Tukar
											<svg xmlns="http://www.w3.org/2000/svg" id="icon-kemaskini" viewBox="0 0 20 20" fill="currentColor" class="size-5">
												<path
													d="m5.433 13.917 1.262-3.155A4 4 0 0 1 7.58 9.42l6.92-6.918a2.121 2.121 0 0 1 3 3l-6.92 6.918c-.383.383-.84.685-1.343.886l-3.154 1.262a.5.5 0 0 1-.65-.65Z" />
												<path
													d="M3.5 5.75c0-.69.56-1.25 1.25-1.25H10A.75.75 0 0 0 10 3H4.75A2.75 2.75 0 0 0 2 5.75v9.5A2.75 2.75 0 0 0 4.75 18h9.5A2.75 2.75 0 0 0 17 15.25V10a.75.75 0 0 0-1.5 0v5.25c0 .69-.56 1.25-1.25 1.25h-9.5c-.69 0-1.25-.56-1.25-1.25v-9.5Z" />
											</svg>
											</button>
											</cfif>
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
												<input disabled name="USR_NAMA" class="w-full bg-gray-200 text-gray-800 border border-gray-300 rounded-sm px-2 py-1 font-light" type="text" value="#USR_NAMA#"/>
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
												<input disabled name="USR_JAB_KOD" class="w-full bg-gray-200 text-gray-800 border border-gray-300 rounded-sm px-2 py-1 font-light" type="text" value="#USR_JAB_KOD# - #USR_JAB_NAMA#"/>
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
												<input disabled name="USR_JAWATAN" class="w-full bg-gray-200 text-gray-800 border border-gray-300 rounded-sm px-2 py-1 font-light" type="text" value="#USR_JAWATAN#"/>
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
												<input disabled name="USR_KP" class="w-full bg-gray-200 text-gray-800 border border-gray-300 rounded-sm px-2 py-1 font-light" type="text" value="#USR_KP#"/>
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
												<input disabled name="USR_TELNO" class="w-full bg-gray-200 text-gray-800 border border-gray-300 rounded-sm px-2 py-1 font-light" type="text" value="#USR_TELNO#"/>
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
												<input disabled name="USR_EMEL" class="w-full bg-gray-200 text-gray-800 border border-gray-300 rounded-sm px-2 py-1 font-light" type="text" value="#USR_EMEL#"/>
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
											<div class="flex justify-start lg:gap-6 sm:gap-2 items-center"> 
												<div class="flex gap-2"> 
													<input disabled type="radio" name="USR_ROLES_BIASA" value="Y"<cfif USR_ROLES_BIASA EQ 'Y'> checked</cfif>>Biasa
												</div>
												<div class="flex gap-2">
													<input disabled type="radio" name="USR_ROLES_ADMIN" value="Y"<cfif USR_ROLES_ADMIN EQ 'Y'> checked</cfif>>Admin
												</div>
												<div class="flex gap-2">
													<cfif #Session.USR_ROLES_SUPER# EQ 'Y'>
														<input disabled type="radio" name="USR_ROLES_SUPER" value="Y"<cfif USR_ROLES_SUPER EQ 'Y'> checked</cfif>>Super
													</cfif>
												</div>
											</div> 
										</td> 
									</tr> 
								</table> 
							</div>
							<hr>
							<div class="m-2">
								<table class="p-4 min-w-full border border-gray-300">
									<tr>
										<td class="px-2 py-2" width="25%">  
											<div class="flex items-center">
												<span class="font-medium text-gray-800">Kata Laluan</span> 
											</div> 
										</td> 
										<td class="px-2 py-2">  
											<div class="flex items-center"> 
												<span class="text-left">:</span> 
											</div> 
										</td> 
										<td class="px-2 py-2">  
											<div class="flex items-center">  
												<input disabled name="USR_LOGIN_PWD" class="w-full bg-gray-200 text-gray-800 border border-gray-300 rounded-sm px-2 py-1 font-light" type="text" value="#USR_LOGIN_PWD#"/>
											</div> 
										</td> 
										<td class="px-2 py-2">  
											<div class="flex items-center">  
											<cfif #Session.USR_CTL_TETAPAN_PENGGUNA# CONTAINS 'E'> 
											<button id="openReset" type="button" class="flex justify-center items-center gap-2 w-full bg-blue-500 hover:bg-blue-600 text-white py-2 px-4 rounded">
											Reset
											<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-arrow-repeat" viewBox="0 0 16 16">
												<path d="M11.534 7h3.932a.25.25 0 0 1 .192.41l-1.966 2.36a.25.25 0 0 1-.384 0l-1.966-2.36a.25.25 0 0 1 .192-.41m-11 2h3.932a.25.25 0 0 0 .192-.41L2.692 6.23a.25.25 0 0 0-.384 0L.342 8.59A.25.25 0 0 0 .534 9"/>
												<path fill-rule="evenodd" d="M8 3c-1.552 0-2.94.707-3.857 1.818a.5.5 0 1 1-.771-.636A6.002 6.002 0 0 1 13.917 7H12.9A5 5 0 0 0 8 3M3.1 9a5.002 5.002 0 0 0 8.757 2.182.5.5 0 1 1 .771.636A6.002 6.002 0 0 1 2.083 9z"/>
											</svg>
											</button>
											</cfif>
											</div> 
										</td>
									</tr>
									<tr> 
										<td class="px-2 py-2" width="25%">  
											<div class="flex items-center">
												<span class="font-medium text-gray-800">Tempoh Laku</span> 
											</div> 
										</td> 
										<td class="px-2 py-2">  
											<div class="flex items-center"> 
												<span class="text-left">:</span> 
											</div> 
										</td> 
										<td class="px-2 py-2">  
											<div class="flex items-center">  
												<input disabled name="USR_PWD_LAKU" class="w-full bg-gray-200 text-gray-800 border border-gray-300 rounded-sm px-2 py-1 font-light" type="text" value="#USR_PWD_LAKU#"/>
											</div> 
										</td>
										<td class="px-2 py-2">  
											<div class="flex items-center">   
											Hari 
											</div> 
										</td>
									</tr>
									<tr>
										<td class="px-2 py-2" width="25%">  
											<div class="flex items-center">
												<span class="font-medium text-gray-800">Tarikh Mula</span> 
											</div> 
										</td> 
										<td class="px-2 py-2">  
											<div class="flex items-center"> 
												<span class="text-left">:</span> 
											</div> 
										</td> 
										<td class="px-2 py-2">  
											<div class="flex items-center">  
												<input disabled name="USR_PWD_MULA_TKH" class="w-full bg-gray-200 text-gray-800 border border-gray-300 rounded-sm px-2 py-1 font-light" type="text" value="#USR_PWD_MULA_TKH#"/>
											</div> 
										</td> 
									</tr>
									<tr>
										<td class="px-2 py-2" width="25%">  
											<div class="flex items-center">
												<span class="font-medium text-gray-800">Tarikh Tamat</span> 
											</div> 
										</td> 
										<td class="px-2 py-2">  
											<div class="flex items-center"> 
												<span class="text-left">:</span> 
											</div> 
										</td> 
										<td class="px-2 py-2">  
											<div class="flex items-center">  
												<input disabled name="USR_PWD_TAMAT_TKH" class="w-full bg-gray-200 text-gray-800 border border-gray-300 rounded-sm px-2 py-1 font-light" type="text" value="#USR_PWD_TAMAT_TKH#"/>
											</div> 
										</td> 
									</tr> 
								</table>
							</div>
						</div>
						
						<div class="col-span-1">  
							<div class="tabs">
								<ul class="sm:flex flex-wrap border-b border-gray-200 space-x-3 transition-all duration-300 -mb-px p-2">
									<li>
										<a href="javascript:void(0)" class="inline-block py-2 px-3 text-gray-500 hover:text-gray-800 font-medium border-b-2 border-transparent tab-active:border-b-indigo-600 tab-active:text-indigo-600 active tablink whitespace-nowrap cursor-pointer" data-tab="tabs-with-underline-1" role="tab">Akses Data</a>
									</li>
									<li>
										<a href="javascript:void(0)" class="inline-block py-2 px-3 text-gray-500 hover:text-gray-800 font-medium border-b-2 border-transparent tab-active:border-b-indigo-600 tab-active:text-indigo-600 tablink whitespace-nowrap cursor-pointer" data-tab="tabs-with-underline-2" role="tab">Akses Modul</a>
									</li>
									<li>
										<a href="javascript:void(0)" class="inline-block py-2 px-3 text-gray-500 hover:text-gray-800 font-medium border-b-2 border-transparent tab-active:border-b-indigo-600 tab-active:text-indigo-600 tablink whitespace-nowrap cursor-pointer" data-tab="tabs-with-underline-3" role="tab">Akses Tetapan</a>
									</li>
								</ul>
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
														<input disabled type="checkbox" name="USR_CTL_DATA_JABALL" value="Y" class="w-5 h-5 appearance-solid cursor-not-allowed border border-blue-500 bg-blue-300 rounded-md mr-2 checked:bg-no-repeat checked:bg-center"<cfif USR_CTL_DATA_JABALL EQ 'Y'> checked</cfif>>Dibenarkan
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
														<input disabled type="checkbox" name="USR_CTL_DATA_PROFIL" value="Y" class="w-5 h-5 appearance-solid cursor-not-allowed border border-blue-500 bg-blue-300  rounded-md mr-2 checked:bg-no-repeat checked:bg-center"<cfif USR_CTL_DATA_PROFIL EQ 'Y'> checked</cfif>>Dibenarkan
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
														<input disabled type="checkbox" name="USR_CTL_DATA_TEST" value="Y" class="w-5 h-5 appearance-solid cursor-not-allowed border border-blue-500 bg-blue-300  rounded-md mr-2 checked:bg-no-repeat checked:bg-center"<cfif USR_CTL_DATA_TEST EQ 'Y'> checked</cfif>>Dibenarkan 
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
															<input disabled type="checkbox" name="USR_CTL_MODUL_PEMAJU" value="V" class="w-5 h-5 appearance-solid cursor-not-allowed border border-blue-500 bg-blue-300  rounded-md mr-2 checked:bg-no-repeat checked:bg-center" <cfif USR_CTL_MODUL_PEMAJU CONTAINS 'V'> checked</cfif>>Papar
														</div>  
														<div class="flex items-center">   
															<input disabled type="checkbox" name="USR_CTL_MODUL_PEMAJU" value="E" class="w-5 h-5 appearance-solid cursor-not-allowed border border-blue-500 bg-blue-300  rounded-md mr-2 checked:bg-no-repeat checked:bg-center" <cfif USR_CTL_MODUL_PEMAJU CONTAINS 'E'> checked</cfif>>Kemaskini
														</div> 
														<div class="flex items-center"> 
															<input disabled type="checkbox" name="USR_CTL_MODUL_PEMAJU" value="C" class="w-5 h-5 appearance-solid cursor-not-allowed border border-blue-500 bg-blue-300  rounded-md mr-2 checked:bg-no-repeat checked:bg-center" <cfif USR_CTL_MODUL_PEMAJU CONTAINS 'C'> checked</cfif>>Daftar
														</div> 
														<div class="flex items-center">  
															<input disabled type="checkbox" name="USR_CTL_MODUL_PEMAJU" value="D" class="w-5 h-5 appearance-solid cursor-not-allowed border border-blue-500 bg-blue-300  rounded-md mr-2 checked:bg-no-repeat checked:bg-center" <cfif USR_CTL_MODUL_PEMAJU CONTAINS 'D'> checked</cfif>>Batal/Sah
														</div> 
														<div class="flex items-center">  
															<input disabled type="checkbox" name="USR_CTL_MODUL_PEMAJU" value="X" class="w-5 h-5 appearance-solid cursor-not-allowed border border-blue-500 bg-blue-300  rounded-md mr-2 checked:bg-no-repeat checked:bg-center" <cfif USR_CTL_MODUL_PEMAJU CONTAINS 'X'> checked</cfif>>Hapus
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
															<input disabled type="checkbox" name="USR_CTL_MODUL_PEMBELI" value="V" class="w-5 h-5 appearance-solid cursor-not-allowed border border-blue-500 bg-blue-300  rounded-md mr-2 checked:bg-no-repeat checked:bg-center" <cfif USR_CTL_MODUL_PEMBELI CONTAINS 'V'> checked</cfif>>Papar
														</div>   
														<div class="flex items-center">   
															<input disabled type="checkbox" name="USR_CTL_MODUL_PEMBELI" value="E" class="w-5 h-5 appearance-solid cursor-not-allowed border border-blue-500 bg-blue-300  rounded-md mr-2 checked:bg-no-repeat checked:bg-center" <cfif USR_CTL_MODUL_PEMBELI CONTAINS 'E'> checked</cfif>>Kemaskini
														</div>
														<div class="flex items-center">   
															<input disabled type="checkbox" name="USR_CTL_MODUL_PEMBELI" value="C" class="w-5 h-5 appearance-solid cursor-not-allowed border border-blue-500 bg-blue-300  rounded-md mr-2 checked:bg-no-repeat checked:bg-center" <cfif USR_CTL_MODUL_PEMBELI CONTAINS 'C'> checked</cfif>>Daftar
														</div>
														<div class="flex items-center">   
															<input disabled type="checkbox" name="USR_CTL_MODUL_PEMBELI" value="D" class="w-5 h-5 appearance-solid cursor-not-allowed border border-blue-500 bg-blue-300  rounded-md mr-2 checked:bg-no-repeat checked:bg-center" <cfif USR_CTL_MODUL_PEMBELI CONTAINS 'D'> checked</cfif>>Batal/Sah
														</div>
														<div class="flex items-center">   
															<input disabled type="checkbox" name="USR_CTL_MODUL_PEMBELI" value="X" class="w-5 h-5 appearance-solid cursor-not-allowed border border-blue-500 bg-blue-300  rounded-md mr-2 checked:bg-no-repeat checked:bg-center" <cfif USR_CTL_MODUL_PEMBELI CONTAINS 'X'> checked</cfif>>Hapus
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
																<input disabled type="checkbox" name="USR_CTL_TETAPAN_SISTEM" value="V" class="w-5 h-5 appearance-solid cursor-not-allowed border border-blue-500 bg-blue-300  rounded-md mr-2 checked:bg-no-repeat checked:bg-center" <cfif USR_CTL_TETAPAN_SISTEM CONTAINS 'V'> checked</cfif>>Papar
															</div>  
															<div class="flex items-center">   
																<input disabled type="checkbox" name="USR_CTL_TETAPAN_SISTEM" value="E" class="w-5 h-5 appearance-solid cursor-not-allowed border border-blue-500 bg-blue-300  rounded-md mr-2 checked:bg-no-repeat checked:bg-center" <cfif USR_CTL_TETAPAN_SISTEM CONTAINS 'E'> checked</cfif>>Kemaskini
															</div> 
															<div class="flex items-center">   
																<input disabled type="checkbox" name="USR_CTL_TETAPAN_SISTEM" value="C" class="w-5 h-5 appearance-solid cursor-not-allowed border border-blue-500 bg-blue-300  rounded-md mr-2 checked:bg-no-repeat checked:bg-center" <cfif USR_CTL_TETAPAN_SISTEM CONTAINS 'C'> checked</cfif>>Daftar
															</div> 
															<div class="flex items-center">   
																<input disabled type="checkbox" name="USR_CTL_TETAPAN_SISTEM" value="D" class="w-5 h-5 appearance-solid cursor-not-allowed border border-blue-500 bg-blue-300  rounded-md mr-2 checked:bg-no-repeat checked:bg-center" <cfif USR_CTL_TETAPAN_SISTEM CONTAINS 'D'> checked</cfif>>Batal/Sah
															</div>
															<div class="flex items-center">   
																<input disabled type="checkbox" name="USR_CTL_TETAPAN_SISTEM" value="X" class="w-5 h-5 appearance-solid cursor-not-allowed border border-blue-500 bg-blue-300  rounded-md mr-2 checked:bg-no-repeat checked:bg-center" <cfif USR_CTL_TETAPAN_SISTEM CONTAINS 'X'> checked</cfif>>Hapus
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
															<input disabled type="checkbox" name="USR_CTL_TETAPAN_PENGGUNA" value="V" class="w-5 h-5 appearance-solid cursor-not-allowed border border-blue-500 bg-blue-300  rounded-md mr-2 checked:bg-no-repeat checked:bg-center" <cfif USR_CTL_TETAPAN_PENGGUNA CONTAINS 'V'> checked</cfif>>Papar
														</div>   
														<div class="flex items-center">   
															<input disabled type="checkbox" name="USR_CTL_TETAPAN_PENGGUNA" value="E" class="w-5 h-5 appearance-solid cursor-not-allowed border border-blue-500 bg-blue-300  rounded-md mr-2 checked:bg-no-repeat checked:bg-center" <cfif USR_CTL_TETAPAN_PENGGUNA CONTAINS 'E'> checked</cfif>>Kemaskini
														</div> 
														<div class="flex items-center">   
															<input disabled type="checkbox" name="USR_CTL_TETAPAN_PENGGUNA" value="C" class="w-5 h-5 appearance-solid cursor-not-allowed border border-blue-500 bg-blue-300  rounded-md mr-2 checked:bg-no-repeat checked:bg-center" <cfif USR_CTL_TETAPAN_PENGGUNA CONTAINS 'C'> checked</cfif>>Daftar
														</div> 
														<div class="flex items-center">   
															<input disabled type="checkbox" name="USR_CTL_TETAPAN_PENGGUNA" value="D" class="w-5 h-5 appearance-solid cursor-not-allowed border border-blue-500 bg-blue-300  rounded-md mr-2 checked:bg-no-repeat checked:bg-center" <cfif USR_CTL_TETAPAN_PENGGUNA CONTAINS 'D'> checked</cfif>>Batal/Sah
														</div>
														<div class="flex items-center">   
															<input disabled type="checkbox" name="USR_CTL_TETAPAN_PENGGUNA" value="X" class="w-5 h-5 appearance-solid cursor-not-allowed border border-blue-500 bg-blue-300  rounded-md mr-2 checked:bg-no-repeat checked:bg-center" <cfif USR_CTL_TETAPAN_PENGGUNA CONTAINS 'X'> checked</cfif>>Hapus
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
															<input disabled type="checkbox" name="USR_CTL_TETAPAN_TEMPAT" value="V" class="w-5 h-5 appearance-solid cursor-not-allowed border border-blue-500 bg-blue-300  rounded-md mr-2 checked:bg-no-repeat checked:bg-center" <cfif USR_CTL_TETAPAN_TEMPAT CONTAINS 'V'> checked</cfif>>Papar
														</div>   
														<div class="flex items-center">   
															<input disabled type="checkbox" name="USR_CTL_TETAPAN_TEMPAT" value="E" class="w-5 h-5 appearance-solid cursor-not-allowed border border-blue-500 bg-blue-300  rounded-md mr-2 checked:bg-no-repeat checked:bg-center" <cfif USR_CTL_TETAPAN_TEMPAT CONTAINS 'E'> checked</cfif>>Kemaskini
														</div>
														<div class="flex items-center">   
															<input disabled type="checkbox" name="USR_CTL_TETAPAN_TEMPAT" value="C" class="w-5 h-5 appearance-solid cursor-not-allowed border border-blue-500 bg-blue-300  rounded-md mr-2 checked:bg-no-repeat checked:bg-center" <cfif USR_CTL_TETAPAN_TEMPAT CONTAINS 'C'> checked</cfif>>Daftar
														</div> 
														<div class="flex items-center">   
															<input disabled type="checkbox" name="USR_CTL_TETAPAN_SISTEM" value="D" class="w-5 h-5 appearance-solid cursor-not-allowed border border-blue-500 bg-blue-300  rounded-md mr-2 checked:bg-no-repeat checked:bg-center" <cfif USR_CTL_TETAPAN_SISTEM CONTAINS 'D'> checked</cfif>>Batal/Sah
														</div>
														<div class="flex items-center">   
															<input disabled type="checkbox" name="USR_CTL_TETAPAN_TEMPAT" value="X" class="w-5 h-5 appearance-solid cursor-not-allowed border border-blue-500 bg-blue-300  rounded-md mr-2 checked:bg-no-repeat checked:bg-center" <cfif USR_CTL_TETAPAN_TEMPAT CONTAINS 'X'> checked</cfif>>Hapus
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
															<input disabled type="checkbox" name="USR_CTL_TETAPAN_HARTANAH" value="V" class="w-5 h-5 appearance-solid cursor-not-allowed border border-blue-500 bg-blue-300  rounded-md mr-2 checked:bg-no-repeat checked:bg-center" <cfif USR_CTL_TETAPAN_HARTANAH CONTAINS 'V'> checked</cfif>>Papar
														</div> 
														<div class="flex items-center">   
															<input disabled type="checkbox" name="USR_CTL_TETAPAN_HARTANAH" value="E" class="w-5 h-5 appearance-solid cursor-not-allowed border border-blue-500 bg-blue-300  rounded-md mr-2 checked:bg-no-repeat checked:bg-center" <cfif USR_CTL_TETAPAN_HARTANAH CONTAINS 'E'> checked</cfif>>Kemaskini
														</div>
														<div class="flex items-center">   
															<input disabled type="checkbox" name="USR_CTL_TETAPAN_HARTANAH" value="C" class="w-5 h-5 appearance-solid cursor-not-allowed border border-blue-500 bg-blue-300  rounded-md mr-2 checked:bg-no-repeat checked:bg-center" <cfif USR_CTL_TETAPAN_HARTANAH CONTAINS 'C'> checked</cfif>>Daftar
														</div>
														<div class="flex items-center">   
															<input disabled type="checkbox" name="USR_CTL_TETAPAN_HARTANAH" value="D" class="w-5 h-5 appearance-solid cursor-not-allowed border border-blue-500 bg-blue-300  rounded-md mr-2 checked:bg-no-repeat checked:bg-center" <cfif USR_CTL_TETAPAN_HARTANAH CONTAINS 'D'> checked</cfif>>Batal/Sah
														</div> 
														<div class="flex items-center">   
															<input disabled type="checkbox" name="USR_CTL_TETAPAN_HARTANAH" value="X" class="w-5 h-5 appearance-solid cursor-not-allowed border border-blue-500 bg-blue-300  rounded-md mr-2 checked:bg-no-repeat checked:bg-center" <cfif USR_CTL_TETAPAN_HARTANAH CONTAINS 'X'> checked</cfif>>Hapus
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
				</div> 
			</cfoutput>

			<cfoutput query="RS_PENGGUNA">
				<!---HAPUS MODAL---> 
				<!---HAPUS MODAL--->
				<div id="HAPUS" class="fixed inset-0 flex items-center justify-center bg-gray-800 bg-opacity-50 hidden">
					<div class="bg-white rounded-lg shadow-lg lg:w-1/2 mx-10 p-0">
						<!-- Header with background color -->
						<div class="bg-[url('./assets/Background.jpg')] bg-cover bg-center text-white p-6 rounded-t-lg">
							<h2 class="text-lg font-medium text-left">Hapus Pengguna</h2>
						</div>
						<div class="p-6">
							<form id="form2" name="form2" method="post" action="">
								<div class="space-y-4 col-span-1"> 
									<div class="flex items-center">
										<span class="w-1/4 font-medium text-gray-800">No. Kakitangan</span>
										<span class="w-1/12 text-left">:</span> 
										<input readonly name="USR_PEGKOD" class="w-full bg-gray-200 text-gray-800 border border-gray-400 rounded-sm px-2 py-1 focus:outline-none focus:border-gray-400" type="text" value="#USR_PEGKOD#"/>
									</div>
									<div class="flex items-center">
										<span class="w-1/4 font-medium text-gray-800">Nama</span>
										<span class="w-1/12 text-left">:</span>
										<input readonly name="USR_NAMA" value="#USR_NAMA#" class="w-full bg-gray-200 text-gray-800 border border-gray-400 rounded-sm px-2 py-1 focus:outline-none focus:border-gray-400" type="text"/>
									</div> 
								</div>
				
								<div class="grid grid-cols-3 mt-12">
									<div class="space-y-4 col-span-3">
										<div class="flex items-center">
											<div class="bg-red-50 flex-grow border border-red-400 px-2 py-1">
												PENGESAHAN: <br>
												<input type="checkbox" name="chkbx" onClick="goFurtherHapus(this)">
												<label>&nbsp;Saya sahkan maklumat yang diberikan adalah benar</label>
											</div> 
										</div>
									</div>
								</div>
								<div class="grid grid-cols-2 gap-4 mt-12">
									<div class="space-y-4 col-span-1">
										<div class="flex items-center justify-start">
											<button type="submit" class="flex items-center justify-center gap-2 w-1/2 bg-red-200 text-white font-medium py-2 px-4 rounded cursor-not-allowed" name="HAPUS_DATA" id="HAPUS_DATA" disabled> 
												Hapus
												<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" class="size-5">
													<path fill-rule="evenodd" d="M8.75 1A2.75 2.75 0 0 0 6 3.75v.443c-.795.077-1.584.176-2.365.298a.75.75 0 1 0 .23 1.482l.149-.022.841 10.518A2.75 2.75 0 0 0 7.596 19h4.807a2.75 2.75 0 0 0 2.742-2.53l.841-10.52.149.023a.75.75 0 0 0 .23-1.482A41.03 41.03 0 0 0 14 4.193V3.75A2.75 2.75 0 0 0 11.25 1h-2.5ZM10 4c.84 0 1.673.025 2.5.075V3.75c0-.69-.56-1.25-1.25-1.25h-2.5c-.69 0-1.25.56-1.25 1.25v.325C8.327 4.025 9.16 4 10 4ZM8.58 7.72a.75.75 0 0 0-1.5.06l.3 7.5a.75.75 0 1 0 1.5-.06l-.3-7.5Zm4.34.06a.75.75 0 1 0-1.5-.06l-.3 7.5a.75.75 0 1 0 1.5.06l.3-7.5Z" clip-rule="evenodd" />
												</svg>
											</button>
										</div>
									</div>
									<div class="space-y-4 col-span-1">
										<div class="flex items-center justify-end"> 
											<button type="button" id="closeHapus" class="flex items-center justify-center gap-2 w-1/2 bg-gray-500 text-white font-medium py-2 px-4 rounded hover:bg-gray-700 focus:outline-none" onclick="closeHapus()"> 
												Kembali
												<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" class="size-5">
													<path fill-rule="evenodd" d="M7.793 2.232a.75.75 0 0 1-.025 1.06L3.622 7.25h10.003a5.375 5.375 0 0 1 0 10.75H10.75a.75.75 0 0 1 0-1.5h2.875a3.875 3.875 0 0 0 0-7.75H3.622l4.146 3.957a.75.75 0 0 1-1.036 1.085l-5.5-5.25a.75.75 0 0 1 0-1.085l5.5-5.25a.75.75 0 0 1 1.06.025Z" clip-rule="evenodd" />
												</svg>
											</button>
										</div>
									</div>
								</div>		  
									<!---<input type="hidden" name="USR_PEGKOD" value="#RS_PENGGUNA.USR_PEGKOD#">--->
								
								<cfif isdefined("form.HAPUS_DATA")>
									<cfstoredproc procedure="SP_TETAPAN_PENGGUNA_HAPUS" datasource="LPN_0SYS"> 
										<cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@LPN_KOD"  value="#Session.LPN_CODE#"> 
										<cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@USER_ID"  value="#Session.SS_USR_ID#">  
										<cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@PAGE_URL"  value="sppb_tetapan_pengguna_papar.cfm">
										<cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@USR_PEGKOD"  value="#RS_PENGGUNA.USR_PEGKOD#"> 
										<cfprocresult name = RS_HAPUS_DATA>		
									</cfstoredproc>

									<cfif isdefined("RS_HAPUS_DATA.RETURN_MESSAGE") AND #RS_HAPUS_DATA.RETURN_CODE# LT 0>
										<cflocation url="sppb_tetapan_pengguna.cfm?ERROR=#RS_HAPUS_DATA.RETURN_MESSAGE#">
									<cfelse>
										<cflocation url="sppb_tetapan_pengguna.cfm">
									</cfif>
								</cfif>
							</form>
						</div>
					</div>
				</div>

				<script>
					function goFurtherHapus(elem) { 
						const saveButton = document.getElementById("HAPUS_DATA");
						if (elem.checked) {
							saveButton.disabled = false;
							saveButton.classList.remove('bg-red-200', 'cursor-not-allowed');
							saveButton.classList.add('bg-red-500', 'hover:bg-red-700');
						} else {
							saveButton.disabled = true;
							saveButton.classList.add('bg-red-200', 'cursor-not-allowed');
							saveButton.classList.remove('bg-red-500', 'hover:bg-red-700');
						}
					}

					document.getElementById('openHapus').addEventListener('click', function() {
						document.getElementById('HAPUS').classList.remove('hidden');
					});

					document.getElementById('closeHapus').addEventListener('click', function() {
						document.getElementById('HAPUS').classList.add('hidden');
					}); 
				</script>
				<!---HAPUS MODAL--->
				<!---HAPUS MODAL--->
											
											
											
				<!---TUKAR NO.KAKITANGAN MODAL--->
				<!---TUKAR NO.KAKITANGAN MODAL--->
				<div id="TUKAR" class="fixed inset-0 flex items-center justify-center bg-gray-800 bg-opacity-50 hidden">
					<div class="bg-white rounded-lg shadow-lg lg:w-1/2 mx-10 p-0">
						<!-- Header with background color -->
						<div class="bg-[url('./assets/Background.jpg')] bg-cover bg-center text-white p-6 rounded-t-lg">
							<h2 class="text-lg font-medium text-left">Tukar No. Kakitangan</h2>
						</div>
						<div class="p-6">
							<form id="form2" name="form2" method="post" action="">
								<div class="space-y-4 col-span-1"> 
									<div class="flex items-center">
										<span class="w-1/4 font-medium text-gray-800">No. Kakitangan</span>
										<span class="w-1/12 text-left">:</span> 
										<input readonly name="USR_PEGKOD" class="w-full bg-gray-200 text-gray-800 border border-gray-400 rounded-sm px-2 py-1 focus:outline-none focus:border-gray-400" type="text" value="#USR_PEGKOD#"/>
									</div>
									<div class="flex items-center">
										<span class="w-1/4 font-medium text-gray-800">Nama</span>
										<span class="w-1/12 text-left">:</span>
										<input readonly name="USR_NAMA" value="#USR_NAMA#" class="w-full bg-gray-200 text-gray-800 border border-gray-400 rounded-sm px-2 py-1 focus:outline-none focus:border-gray-400" type="text"/>
									</div> 
									<div class="flex items-center">
										<span class="w-1/4 font-medium text-gray-800">No. Kakitangan Baru</span>
										<span class="w-1/12 text-left">:</span>
										<input name="USR_PEGKOD_BARU" value="#USR_PEGKOD_BARU#" class="w-full text-gray-800 border border-gray-300 rounded-sm px-4 py-2" type="text"/>
									</div> 
								</div>
				
								<div class="grid grid-cols-3 mt-12">
									<div class="space-y-4 col-span-3">
										<div class="flex items-center">
											<div class="bg-red-50 flex-grow border border-red-400 px-2 py-1">
												PENGESAHAN: <br>
												<input type="checkbox" name="chkbx" onClick="goFurtherTukar(this)">
												<label>&nbsp;Saya sahkan maklumat yang diberikan adalah benar</label>
											</div> 
										</div>
									</div>
								</div>
								<div class="grid grid-cols-2 gap-4 mt-12">
									<div class="space-y-4 col-span-1">
										<div class="flex items-center justify-start">
											<button type="submit" class="flex items-center justify-center gap-2 w-1/2 bg-blue-200 text-white font-medium py-2 px-4 rounded cursor-not-allowed" name="TUKAR_DATA" id="TUKAR_DATA" disabled> 
												Simpan
												<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-floppy2" viewBox="0 0 16 16">
													<path d="M1.5 0h11.586a1.5 1.5 0 0 1 1.06.44l1.415 1.414A1.5 1.5 0 0 1 16 2.914V14.5a1.5 1.5 0 0 1-1.5 1.5h-13A1.5 1.5 0 0 1 0 14.5v-13A1.5 1.5 0 0 1 1.5 0M1 1.5v13a.5.5 0 0 0 .5.5H2v-4.5A1.5 1.5 0 0 1 3.5 9h9a1.5 1.5 0 0 1 1.5 1.5V15h.5a.5.5 0 0 0 .5-.5V2.914a.5.5 0 0 0-.146-.353l-1.415-1.415A.5.5 0 0 0 13.086 1H13v3.5A1.5 1.5 0 0 1 11.5 6h-7A1.5 1.5 0 0 1 3 4.5V1H1.5a.5.5 0 0 0-.5.5m9.5-.5a.5.5 0 0 0-.5.5v3a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-3a.5.5 0 0 0-.5-.5z"/>
												</svg>
											</button>
										</div>
									</div>
									<div class="space-y-4 col-span-1">
										<div class="flex items-center justify-end"> 
											<button type="button" id="closeTukar" class="flex items-center justify-center gap-2 w-1/2 bg-gray-500 text-white font-medium py-2 px-4 rounded hover:bg-gray-700 focus:outline-none" onclick="closeTukar()"> 
												Kembali
												<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" class="size-5">
													<path fill-rule="evenodd" d="M7.793 2.232a.75.75 0 0 1-.025 1.06L3.622 7.25h10.003a5.375 5.375 0 0 1 0 10.75H10.75a.75.75 0 0 1 0-1.5h2.875a3.875 3.875 0 0 0 0-7.75H3.622l4.146 3.957a.75.75 0 0 1-1.036 1.085l-5.5-5.25a.75.75 0 0 1 0-1.085l5.5-5.25a.75.75 0 0 1 1.06.025Z" clip-rule="evenodd" />
												</svg>
											</button>
										</div>
									</div>
								</div>		 
										
								
								<cfif isdefined("form.TUKAR_DATA")>
									<cfstoredproc procedure="SP_TETAPAN_PENGGUNA_UBAH_PEGKOD" datasource="LPN_0SYS"> 
										<cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@LPN_KOD"  value="#Session.LPN_CODE#"> 
										<cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@USER_ID"  value="#Session.SS_USR_ID#">  
										<cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@PAGE_URL"  value="sppb_tetapan_pengguna_papar.cfm">
										<cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@USR_PEGKOD"  value="#FORM.USR_PEGKOD#"> 
										<cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@NEW_PEGKOD"  value="#FORM.USR_PEGKOD_BARU#"> 
										<cfprocresult name = RS_TUKAR_DATA>		
									</cfstoredproc>

									<cfif isdefined("RS_TUKAR_DATA.RETURN_MESSAGE") AND #RS_TUKAR_DATA.RETURN_CODE# LT 0>
										<cflocation url="sppb_tetapan_pengguna_papar.cfm?ERROR=#RS_TUKAR_DATA.RETURN_MESSAGE#&USR_PEGKOD=#FORM.USR_PEGKOD_BARU#">
									<cfelse>
										<cflocation url="sppb_tetapan_pengguna_papar.cfm?USR_PEGKOD=#FORM.USR_PEGKOD_BARU#">
									</cfif>
								</cfif>
							</form>
						</div>
					</div>
				</div>

				<script>
					function goFurtherTukar(elem) { 
						const saveButton = document.getElementById("TUKAR_DATA");
						console.log('saveButton', saveButton);
												
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

					document.getElementById('openTukar').addEventListener('click', function() {
						document.getElementById('TUKAR').classList.remove('hidden');
					});

					document.getElementById('closeTukar').addEventListener('click', function() {
						document.getElementById('TUKAR').classList.add('hidden');
					}); 
				</script>
				<!---TUKAR NO.KAKITANGAN MODAL--->
				<!---TUKAR NO.KAKITANGAN MODAL--->
											
											
				<!---RESET MODAL---> 
				<!---RESET MODAL--->
				<div id="RESET" class="fixed inset-0 flex items-center justify-center bg-gray-800 bg-opacity-50 hidden">
					<div class="bg-white rounded-lg shadow-lg lg:w-1/2 mx-10 p-0">
						<!-- Header with background color -->
						<div class="bg-[url('./assets/Background.jpg')] bg-cover bg-center text-white p-6 rounded-t-lg">
							<h2 class="text-lg font-medium text-left">Reset Kata Laluan</h2>
						</div>
						<div class="p-6">
							<form id="form2" name="form2" method="post" action="">
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
											<input readonly name="USR_PEGKOD" class="w-full bg-gray-200 text-gray-800 border border-gray-300 rounded-sm px-2 py-1 font-light" type="text" value="#USR_PEGKOD#"/>
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
											<input disabled name="USR_NAMA" class="w-full bg-gray-200 text-gray-800 border border-gray-300 rounded-sm px-2 py-1 font-light" type="text" value="#USR_NAMA#"/>
										</div> 
									</div>
									<div class="space-y-4 col-span-1 p-2">  
										<div class="flex items-center">
											<span class="font-medium text-gray-800">Kata Laluan</span> 
										</div> 
									</div> 
									<div class="space-y-4 col-span-1 p-2">  
										<div class="flex items-center"> 
											<span class="text-left">:</span> 
										</div> 
									</div> 
									<div class="space-y-4 col-span-2 p-2">  
										<div class="flex items-center">  
											<input name="USR_LOGIN_PWD" class="w-full text-gray-800 border border-gray-400 rounded-sm px-2 py-1" type="text" value="#USR_LOGIN_PWD#"/>
										</div> 
									</div>
									<div class="space-y-4 col-span-2 p-2">  
										<div class="flex items-center">  
											<input type="checkbox" name="USR_PWD_AUTO" value="Y" class="w-5 h-5 appearance-solid cursor-not-allowed border border-blue-500 bg-blue-300  rounded-md mr-2 checked:bg-no-repeat checked:bg-center"<cfif USR_PWD_AUTO EQ 'Y'> checked</cfif>>&nbsp;Auto Jana 
										</div> 
									</div>
									<div class="space-y-4 col-span-1 p-2">  
										<div class="flex items-center">
											<span class="font-medium text-gray-800">Sementara</span> 
										</div> 
									</div> 
									<div class="space-y-4 col-span-1 p-2">  
										<div class="flex items-center"> 
											<span class="text-left">:</span> 
										</div> 
									</div> 
									<div class="space-y-4 col-span-4 p-2">  
										<div class="flex items-center">  
											<input type="checkbox" name="USR_PWD_RESET" value="Y" class="w-5 h-5 appearance-solid cursor-not-allowed border border-blue-500 bg-blue-300  rounded-md mr-2 checked:bg-no-repeat checked:bg-center"<cfif USR_PWD_RESET EQ 'Y'> checked</cfif>>&nbsp;Ya (Pengguna perlu ubah)
										</div> 
									</div> 
									</div>	 
				
								<div class="grid grid-cols-3 mt-12">
									<div class="space-y-4 col-span-3">
										<div class="flex items-center">
											<div class="bg-red-50 flex-grow border border-red-400 px-2 py-1">
												PENGESAHAN: <br>
												<input type="checkbox" name="chkbx" onClick="goFurtherReset(this)">
												<label>&nbsp;Saya sahkan maklumat yang diberikan adalah benar</label>
											</div> 
										</div>
									</div>
								</div>
								<div class="grid grid-cols-2 gap-4 mt-12">
									<div class="space-y-4 col-span-1">
										<div class="flex items-center justify-start">
											<button type="submit" class="flex items-center justify-center gap-2 w-1/2 bg-blue-200 text-white font-medium py-2 px-4 rounded cursor-not-allowed" name="RESET_DATA" id="RESET_DATA" disabled> 
												Simpan
												<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-floppy2" viewBox="0 0 16 16">
													<path d="M1.5 0h11.586a1.5 1.5 0 0 1 1.06.44l1.415 1.414A1.5 1.5 0 0 1 16 2.914V14.5a1.5 1.5 0 0 1-1.5 1.5h-13A1.5 1.5 0 0 1 0 14.5v-13A1.5 1.5 0 0 1 1.5 0M1 1.5v13a.5.5 0 0 0 .5.5H2v-4.5A1.5 1.5 0 0 1 3.5 9h9a1.5 1.5 0 0 1 1.5 1.5V15h.5a.5.5 0 0 0 .5-.5V2.914a.5.5 0 0 0-.146-.353l-1.415-1.415A.5.5 0 0 0 13.086 1H13v3.5A1.5 1.5 0 0 1 11.5 6h-7A1.5 1.5 0 0 1 3 4.5V1H1.5a.5.5 0 0 0-.5.5m9.5-.5a.5.5 0 0 0-.5.5v3a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-3a.5.5 0 0 0-.5-.5z"/>
												</svg>
											</button>
										</div>
									</div>
									<div class="space-y-4 col-span-1">
										<div class="flex items-center justify-end"> 
											<button type="button" id="closeReset" class="flex justify-center items-center gap-2 w-1/2 bg-gray-500 text-white font-medium py-2 px-4 rounded hover:bg-gray-700 focus:outline-none" onclick="closeReset()"> 
												Kembali
												<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" class="size-5">
													<path fill-rule="evenodd" d="M7.793 2.232a.75.75 0 0 1-.025 1.06L3.622 7.25h10.003a5.375 5.375 0 0 1 0 10.75H10.75a.75.75 0 0 1 0-1.5h2.875a3.875 3.875 0 0 0 0-7.75H3.622l4.146 3.957a.75.75 0 0 1-1.036 1.085l-5.5-5.25a.75.75 0 0 1 0-1.085l5.5-5.25a.75.75 0 0 1 1.06.025Z" clip-rule="evenodd" />
												</svg>
											</button>
										</div>
									</div>
								</div>		 

								<cfif isdefined("form.RESET_DATA")>
									<cfstoredproc procedure="SP_TETAPAN_PENGGUNA_UBAH_KATALALUAN" datasource="LPN_0SYS"> 
										<cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@LPN_KOD"  value="#Session.LPN_CODE#">  
										<cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@USER_ID"  value="#Session.SS_USR_ID#">   
										<cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@PAGE_URL"  value="sppb_tetapan_pengguna_papar.cfm"> 
										<cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@USR_PEGKOD"  value="#FORM.USR_PEGKOD#">
										<cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@USR_PWD_LOGIN"  value="#FORM.USR_LOGIN_PWD#">
										<cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@USR_PWD_AUTO"  value="#FORM.USR_PWD_AUTO#"> 
										<cfprocresult name = RS_RESET_DATA>		
									</cfstoredproc>

									<cfif isdefined("RS_RESET_DATA.RETURN_MESSAGE") AND #RS_RESET_DATA.RETURN_CODE# LT 0>
										<cflocation url="sppb_tetapan_pengguna_papar.cfm?ERROR=#RS_RESET_DATA.RETURN_MESSAGE#&USR_PEGKOD=#FORM.USR_PEGKOD#">
									<cfelse>
										<cflocation url="sppb_tetapan_pengguna_papar.cfm?USR_PEGKOD=#FORM.USR_PEGKOD#">
									</cfif>
								</cfif>
							</form>
						</div>
					</div>
				</div>

				<script>
					function goFurtherReset(elem) {
						const saveButton = document.getElementById("RESET_DATA");
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

					document.getElementById('openReset').addEventListener('click', function() {
						document.getElementById('RESET').classList.remove('hidden');
					});

					document.getElementById('closeReset').addEventListener('click', function() {
						document.getElementById('RESET').classList.add('hidden');
					}); 
				</script>
				<!---RESET MODAL--->
				<!---RESET MODAL--->
			</cfoutput>
		</div> 						
	  </div>
	</div>
 </div>
</div>

<!-- End Page -->