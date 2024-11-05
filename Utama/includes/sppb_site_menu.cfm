<style>
    input#PemajuDropdown:checked + label .rotate-icon-pemaju {
        transform: rotate(90deg);
    }
    input#SistemDropdown:checked + label .rotate-icon-sistem {
        transform: rotate(90deg);
    }
    input#TetapanDropdown:checked + label .rotate-icon-tetapan {
        transform: rotate(90deg);
    }
</style>

<div id="sidebar" class="fixed inset-y-0 left-0 w-64 bg-gradient-to-b from-[#1e0542] via-purple-800 to-[#71094f] backdrop-blur-lg text-white transform -translate-x-full lg:translate-x-0 transition-transform duration-300 lg:pt-16 lg:z-10 z-20">
    <div class="flex items-center h-16 border-b border-gray-700 px-4 gap-2">
        <svg class="w-6 h-6 text-gray-800 dark:text-white" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" viewBox="0 0 24 24">
            <path d="M5 3a2 2 0 0 0-2 2v2a2 2 0 0 0 2 2h4a2 2 0 0 0 2-2V5a2 2 0 0 0-2-2H5Zm14 18a2 2 0 0 0 2-2v-2a2 2 0 0 0-2-2h-4a2 2 0 0 0-2 2v2a2 2 0 0 0 2 2h4ZM5 11a2 2 0 0 0-2 2v6a2 2 0 0 0 2 2h4a2 2 0 0 0 2-2v-6a2 2 0 0 0-2-2H5Zm14 2a2 2 0 0 0 2-2V5a2 2 0 0 0-2-2h-4a2 2 0 0 0-2 2v6a2 2 0 0 0 2 2h4Z"/>
        </svg>
        <h1 class="text-md font-semibold">MODUL</h1>
    </div>
    <nav class="flex-1 py-4 space-y-2 text-sm">
        <div class="relative">
            <input type="checkbox" id="PemajuDropdown" class="peer hidden" <cfif #CGI.SCRIPT_NAME# EQ "/SPPB_LPN/Utama/Pemaju/sppb_daftar_pemaju.cfm">checked<cfelse>unchecked</cfif> >
            <label for="PemajuDropdown" class="flex justify-between items-center w-full py-2.5 px-4 hover:bg-pink-700 transition cursor-pointer peer-checked:bg-purple-900">
                <div class="flex items-center space-x-2">
                    <svg width="16" height="16" viewBox="0 0 16 16" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <path d="M8.70711 1.50005C8.31658 1.10952 7.68342 1.10952 7.29289 1.50005L0.646447 8.14649C0.451184 8.34176 0.451184 8.65834 0.646447 8.8536C0.841709 9.04886 1.15829 9.04886 1.35355 8.8536L8 2.20715L14.6464 8.8536C14.8417 9.04886 15.1583 9.04886 15.3536 8.8536C15.5488 8.65834 15.5488 8.34176 15.3536 8.14649L13 5.79294V2.50005C13 2.2239 12.7761 2.00005 12.5 2.00005H11.5C11.2239 2.00005 11 2.2239 11 2.50005V3.79294L8.70711 1.50005Z" fill="white"/>
                        <path d="M8 3.29294L14 9.29294V13.5C14 14.3285 13.3284 15 12.5 15H3.5C2.67157 15 2 14.3285 2 13.5V9.29294L8 3.29294Z" fill="white"/>
                    </svg>
                    <span>Pemaju</span>
                </div>
                <svg class="w-4 h-4 transform transition-transform rotate-icon-pemaju" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="none" viewBox="0 0 24 24">
                    <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="m9 5 7 7-7 7"/>
                </svg>
            </label>
            <div class="max-h-0 overflow-hidden peer-checked:max-h-40 transition-all duration-500 ease-in-out space-y-2 peer-checked:bg-purple-900">
                <cfif #CGI.SCRIPT_NAME# EQ "/SPPB_LPN/Utama/Pemaju/sppb_daftar_pemaju.cfm">
                    <a href="../Pemaju/sppb_daftar_pemaju.cfm" class="flex items-center space-x-2 gap-2 py-2.5 px-4 bg-gray-100 text-gray-800 hover:bg-pink-700 transition pl-8">
                <cfelse>
                    <a href="../Pemaju/sppb_daftar_pemaju.cfm" class="flex items-center space-x-2 gap-2 py-2.5 px-4 hover:bg-pink-700 transition pl-8">
                </cfif>
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-briefcase-fill" viewBox="0 0 16 16">
                        <path d="M6.5 1A1.5 1.5 0 0 0 5 2.5V3H1.5A1.5 1.5 0 0 0 0 4.5v1.384l7.614 2.03a1.5 1.5 0 0 0 .772 0L16 5.884V4.5A1.5 1.5 0 0 0 14.5 3H11v-.5A1.5 1.5 0 0 0 9.5 1zm0 1h3a.5.5 0 0 1 .5.5V3H6v-.5a.5.5 0 0 1 .5-.5"/>
                        <path d="M0 12.5A1.5 1.5 0 0 0 1.5 14h13a1.5 1.5 0 0 0 1.5-1.5V6.85L8.129 8.947a.5.5 0 0 1-.258 0L0 6.85z"/>
                    </svg>
                    Syarikat
                </a>
                <a href="/Pemaju/Projek" class="flex items-center space-x-2 gap-2 py-2.5 px-4 hover:bg-pink-700 transition pl-8">
                    <svg width="16" height="16" viewBox="0 0 16 16" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <path d="M2 2C2 1.44772 2.44772 1 3 1H7.58579C7.851 1 8.10536 1.10536 8.29289 1.29289L15.2929 8.29289C15.6834 8.68342 15.6834 9.31658 15.2929 9.70711L10.7071 14.2929C10.3166 14.6834 9.68342 14.6834 9.29289 14.2929L2.29289 7.29289C2.10536 7.10536 2 6.851 2 6.58579V2ZM5.5 6C6.32843 6 7 5.32843 7 4.5C7 3.67157 6.32843 3 5.5 3C4.67157 3 4 3.67157 4 4.5C4 5.32843 4.67157 6 5.5 6Z" fill="white"/>
                        <path d="M1.29289 7.79289C1.10536 7.60536 1 7.351 1 7.08579V2C0.447715 2 0 2.44772 0 3V7.58579C0 7.851 0.105356 8.10536 0.292892 8.29289L7.29289 15.2929C7.68342 15.6834 8.31658 15.6834 8.70711 15.2929L8.75 15.25L1.29289 7.79289Z" fill="white"/>
                    </svg>
                    Projek
                </a>
            </div>
        </div>

       <a href="/Pembeli" class="flex items-center space-x-2 py-2.5 px-4 hover:bg-pink-700 transition">
            <svg class="w-5 h-5 dark:text-white" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="none" viewBox="0 0 24 24">
                <path stroke="currentColor" stroke-linecap="round" stroke-width="2" d="M16 19h4a1 1 0 0 0 1-1v-1a3 3 0 0 0-3-3h-2m-2.236-4a3 3 0 1 0 0-4M3 18v-1a3 3 0 0 1 3-3h4a3 3 0 0 1 3 3v1a1 1 0 0 1-1 1H4a1 1 0 0 1-1-1Zm8-10a3 3 0 1 1-6 0 3 3 0 0 1 6 0Z"/>
            </svg>

            <span>Pembeli</span>
        </a>

        <div class="relative">
             <input type="checkbox" id="SistemDropdown" class="peer hidden" 
             <cfif #CGI.SCRIPT_NAME# EQ "/SPPB_LPN/Utama/Admin/sppb_tetapan_organisasi.cfm" OR
             #CGI.SCRIPT_NAME# EQ "/SPPB_LPN/Utama/Admin/sppb_tetapan_organisasi_kemaskini.cfm" OR 
             #CGI.SCRIPT_NAME# EQ "/SPPB_LPN/Utama/Admin/sppb_tetapan_organisasi_jabatan.cfm" OR 
             #CGI.SCRIPT_NAME# EQ "/SPPB_LPN/Utama/Admin/sppb_tetapan_tempat_daerah.cfm" OR 
                        #CGI.SCRIPT_NAME# EQ "/SPPB_LPN/Utama/Admin/sppb_tetapan_tempat_mukim.cfm" OR 
                        #CGI.SCRIPT_NAME# EQ "/SPPB_LPN/Utama/Admin/sppb_tetapan_tempat_adun.cfm" OR
                        #CGI.SCRIPT_NAME# EQ "/SPPB_LPN/Utama/Admin/sppb_tetapan_tempat_parlimen.cfm" OR 
                        #CGI.SCRIPT_NAME# EQ "/SPPB_LPN/Utama/Admin/sppb_tetapan_tempat_pbt.cfm" OR
                        #CGI.SCRIPT_NAME# EQ "/SPPB_LPN/Utama/Admin/sppb_tetapan_pengguna.cfm" OR 
                        #CGI.SCRIPT_NAME# EQ "/SPPB_LPN/Utama/Admin/sppb_tetapan_pengguna_cari.cfm" OR 
                        #CGI.SCRIPT_NAME# EQ "/SPPB_LPN/Utama/Admin/sppb_tetapan_pengguna_daftar.cfm" OR
                        #CGI.SCRIPT_NAME# EQ "/SPPB_LPN/Utama/Admin/sppb_tetapan_pengguna_kemaskini.cfm" OR 
                        #CGI.SCRIPT_NAME# EQ "/SPPB_LPN/Utama/Admin/sppb_tetapan_pengguna_papar.cfm">
             checked<cfelse>unchecked</cfif> >
            <label for="SistemDropdown" class="flex justify-between items-center w-full py-2.5 px-4 hover:bg-pink-700 transition cursor-pointer peer-checked:bg-purple-900">
                <div class="flex items-center space-x-2">
                    <svg width="16" height="16" viewBox="0 0 16 16" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <path d="M9.40466 1.05039C8.99186 -0.350129 7.00814 -0.350128 6.59534 1.05039L6.49523 1.39003C6.23147 2.2849 5.20935 2.70827 4.39008 2.26201L4.07913 2.09264C2.79692 1.39422 1.39422 2.79693 2.09264 4.07913L2.26201 4.39008C2.70827 5.20935 2.2849 6.23147 1.39003 6.49523L1.05039 6.59534C-0.350129 7.00814 -0.350128 8.99186 1.05039 9.40466L1.39003 9.50477C2.2849 9.76853 2.70827 10.7906 2.26201 11.6099L2.09264 11.9209C1.39422 13.2031 2.79692 14.6058 4.07913 13.9074L4.39008 13.738C5.20935 13.2917 6.23147 13.7151 6.49523 14.61L6.59534 14.9496C7.00814 16.3501 8.99186 16.3501 9.40466 14.9496L9.50477 14.61C9.76853 13.7151 10.7906 13.2917 11.6099 13.738L11.9209 13.9074C13.2031 14.6058 14.6058 13.2031 13.9074 11.9209L13.738 11.6099C13.2917 10.7906 13.7151 9.76853 14.61 9.50477L14.9496 9.40466C16.3501 8.99186 16.3501 7.00814 14.9496 6.59534L14.61 6.49523C13.7151 6.23147 13.2917 5.20935 13.738 4.39008L13.9074 4.07913C14.6058 2.79692 13.2031 1.39422 11.9209 2.09264L11.6099 2.26201C10.7906 2.70827 9.76853 2.2849 9.50477 1.39003L9.40466 1.05039ZM8 10.9288C6.38246 10.9288 5.07119 9.61754 5.07119 8C5.07119 6.38246 6.38246 5.07119 8 5.07119C9.61754 5.07119 10.9288 6.38246 10.9288 8C10.9288 9.61754 9.61754 10.9288 8 10.9288Z" fill="white"/>
                    </svg>
                    <span>Sistem</span>
                </div>
                <svg id="arrowSistem"class="w-4 h-4 transform transition-transform rotate-icon-sistem" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="none" viewBox="0 0 24 24">
                    <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="m9 5 7 7-7 7"/>
                </svg>
            </label>
            
            
            <div class="max-h-0 overflow-hidden peer-checked:max-h-64 peer-checked:bg-purple-900 transition-all duration-500 ease-in-out space-y-2">
                <div class="relative">
                    <input type="checkbox" id="TetapanDropdown" class="peer hidden" 
                    <cfif #CGI.SCRIPT_NAME# EQ "/SPPB_LPN/Utama/Admin/sppb_tetapan_organisasi.cfm" OR
                            #CGI.SCRIPT_NAME# EQ "/SPPB_LPN/Utama/Admin/sppb_tetapan_organisasi_kemaskini.cfm" OR 
                            #CGI.SCRIPT_NAME# EQ "/SPPB_LPN/Utama/Admin/sppb_tetapan_organisasi_jabatan.cfm" OR
                            #CGI.SCRIPT_NAME# EQ "/SPPB_LPN/Utama/Admin/sppb_tetapan_tempat_daerah.cfm" OR 
                        #CGI.SCRIPT_NAME# EQ "/SPPB_LPN/Utama/Admin/sppb_tetapan_tempat_mukim.cfm" OR 
                        #CGI.SCRIPT_NAME# EQ "/SPPB_LPN/Utama/Admin/sppb_tetapan_tempat_adun.cfm" OR
                        #CGI.SCRIPT_NAME# EQ "/SPPB_LPN/Utama/Admin/sppb_tetapan_tempat_parlimen.cfm" OR 
                        #CGI.SCRIPT_NAME# EQ "/SPPB_LPN/Utama/Admin/sppb_tetapan_tempat_pbt.cfm" OR
                        #CGI.SCRIPT_NAME# EQ "/SPPB_LPN/Utama/Admin/sppb_tetapan_pengguna.cfm" OR 
                        #CGI.SCRIPT_NAME# EQ "/SPPB_LPN/Utama/Admin/sppb_tetapan_pengguna_cari.cfm" OR 
                        #CGI.SCRIPT_NAME# EQ "/SPPB_LPN/Utama/Admin/sppb_tetapan_pengguna_daftar.cfm" OR
                        #CGI.SCRIPT_NAME# EQ "/SPPB_LPN/Utama/Admin/sppb_tetapan_pengguna_kemaskini.cfm" OR 
                        #CGI.SCRIPT_NAME# EQ "/SPPB_LPN/Utama/Admin/sppb_tetapan_pengguna_papar.cfm">checked<cfelse>unchecked</cfif> >
                    <label for="TetapanDropdown" class="flex justify-between items-center w-full py-2.5 px-4 hover:bg-pink-700 transition cursor-pointer">
                        <div class="flex items-center space-x-2">
                            <svg width="16" height="16" viewBox="0 0 16 16" fill="none" xmlns="http://www.w3.org/2000/svg">
                                <path d="M9.40466 1.05039C8.99186 -0.350129 7.00814 -0.350128 6.59534 1.05039L6.49523 1.39003C6.23147 2.2849 5.20935 2.70827 4.39008 2.26201L4.07913 2.09264C2.79692 1.39422 1.39422 2.79693 2.09264 4.07913L2.26201 4.39008C2.70827 5.20935 2.2849 6.23147 1.39003 6.49523L1.05039 6.59534C-0.350129 7.00814 -0.350128 8.99186 1.05039 9.40466L1.39003 9.50477C2.2849 9.76853 2.70827 10.7906 2.26201 11.6099L2.09264 11.9209C1.39422 13.2031 2.79692 14.6058 4.07913 13.9074L4.39008 13.738C5.20935 13.2917 6.23147 13.7151 6.49523 14.61L6.59534 14.9496C7.00814 16.3501 8.99186 16.3501 9.40466 14.9496L9.50477 14.61C9.76853 13.7151 10.7906 13.2917 11.6099 13.738L11.9209 13.9074C13.2031 14.6058 14.6058 13.2031 13.9074 11.9209L13.738 11.6099C13.2917 10.7906 13.7151 9.76853 14.61 9.50477L14.9496 9.40466C16.3501 8.99186 16.3501 7.00814 14.9496 6.59534L14.61 6.49523C13.7151 6.23147 13.2917 5.20935 13.738 4.39008L13.9074 4.07913C14.6058 2.79692 13.2031 1.39422 11.9209 2.09264L11.6099 2.26201C10.7906 2.70827 9.76853 2.2849 9.50477 1.39003L9.40466 1.05039ZM8 10.9288C6.38246 10.9288 5.07119 9.61754 5.07119 8C5.07119 6.38246 6.38246 5.07119 8 5.07119C9.61754 5.07119 10.9288 6.38246 10.9288 8C10.9288 9.61754 9.61754 10.9288 8 10.9288Z" fill="transparent"/>
                            </svg>
                            <span>Tetapan</span>
                        </div>
                        <svg class="w-4 h-4 transform transition-transform rotate-icon-tetapan" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="none" viewBox="0 0 24 24">
                            <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="m9 5 7 7-7 7"/>
                        </svg>
                    </label>
                    
                    <!-- Tetapan Links -->
                    <div class="max-h-0 overflow-hidden peer-checked:max-h-64 peer-checked:bg-purple-900 transition-all duration-500 ease-in-out space-y-2">
                        <cfif #CGI.SCRIPT_NAME# EQ "/SPPB_LPN/Utama/Admin/sppb_tetapan_organisasi.cfm" OR 
                        #CGI.SCRIPT_NAME# EQ "/SPPB_LPN/Utama/Admin/sppb_tetapan_organisasi_kemaskini.cfm" OR 
                        #CGI.SCRIPT_NAME# EQ "/SPPB_LPN/Utama/Admin/sppb_tetapan_organisasi_jabatan.cfm">
                        <a href="../Admin/sppb_tetapan_organisasi.cfm" class="flex items-center space-x-4 gap-2 py-2.5 bg-gray-100 text-gray-800 hover:bg-gray-400 transition pl-8">
                            <svg width="16" height="16" viewBox="0 0 16 16" fill="none" xmlns="http://www.w3.org/2000/svg">
                                <path fill-rule="evenodd" clip-rule="evenodd" d="M6 3.5C6 2.67157 6.67157 2 7.5 2H8.5C9.32843 2 10 2.67157 10 3.5V4.5C10 5.32843 9.32843 6 8.5 6V7H11C11.2761 7 11.5 7.22386 11.5 7.5V8.5C11.5 8.77614 11.2761 9 11 9C10.7239 9 10.5 8.77614 10.5 8.5V8H5.5V8.5C5.5 8.77614 5.27614 9 5 9C4.72386 9 4.5 8.77614 4.5 8.5V7.5C4.5 7.22386 4.72386 7 5 7H7.5V6C6.67157 6 6 5.32843 6 4.5V3.5ZM3 11.5C3 10.6716 3.67157 10 4.5 10H5.5C6.32843 10 7 10.6716 7 11.5V12.5C7 13.3284 6.32843 14 5.5 14H4.5C3.67157 14 3 13.3284 3 12.5V11.5ZM9 11.5C9 10.6716 9.67157 10 10.5 10H11.5C12.3284 10 13 10.6716 13 11.5V12.5C13 13.3284 12.3284 14 11.5 14H10.5C9.67157 14 9 13.3284 9 12.5V11.5Z" fill="black"/>
                            </svg>
                        <cfelse>
                        <a href="../Admin/sppb_tetapan_organisasi.cfm" class="flex items-center space-x-4 gap-2 py-2.5 hover:bg-pink-700 transition pl-8">
                            <svg width="16" height="16" viewBox="0 0 16 16" fill="none" xmlns="http://www.w3.org/2000/svg">
                                <path fill-rule="evenodd" clip-rule="evenodd" d="M6 3.5C6 2.67157 6.67157 2 7.5 2H8.5C9.32843 2 10 2.67157 10 3.5V4.5C10 5.32843 9.32843 6 8.5 6V7H11C11.2761 7 11.5 7.22386 11.5 7.5V8.5C11.5 8.77614 11.2761 9 11 9C10.7239 9 10.5 8.77614 10.5 8.5V8H5.5V8.5C5.5 8.77614 5.27614 9 5 9C4.72386 9 4.5 8.77614 4.5 8.5V7.5C4.5 7.22386 4.72386 7 5 7H7.5V6C6.67157 6 6 5.32843 6 4.5V3.5ZM3 11.5C3 10.6716 3.67157 10 4.5 10H5.5C6.32843 10 7 10.6716 7 11.5V12.5C7 13.3284 6.32843 14 5.5 14H4.5C3.67157 14 3 13.3284 3 12.5V11.5ZM9 11.5C9 10.6716 9.67157 10 10.5 10H11.5C12.3284 10 13 10.6716 13 11.5V12.5C13 13.3284 12.3284 14 11.5 14H10.5C9.67157 14 9 13.3284 9 12.5V11.5Z" fill="white"/>
                            </svg>
                        </cfif>
                            
                            Organisasi
                        </a>
                        <cfif #CGI.SCRIPT_NAME# EQ "/SPPB_LPN/Utama/Admin/sppb_tetapan_pengguna.cfm" OR 
                        #CGI.SCRIPT_NAME# EQ "/SPPB_LPN/Utama/Admin/sppb_tetapan_pengguna_cari.cfm" OR 
                        #CGI.SCRIPT_NAME# EQ "/SPPB_LPN/Utama/Admin/sppb_tetapan_pengguna_daftar.cfm" OR
                        #CGI.SCRIPT_NAME# EQ "/SPPB_LPN/Utama/Admin/sppb_tetapan_pengguna_kemaskini.cfm" OR 
                        #CGI.SCRIPT_NAME# EQ "/SPPB_LPN/Utama/Admin/sppb_tetapan_pengguna_papar.cfm">
                        <a href="../Admin/sppb_tetapan_pengguna_cari.cfm" class="flex items-center space-x-4 gap-2 py-2.5 bg-gray-100 text-gray-800 hover:bg-gray-400 transition pl-8">
                            <svg width="16" height="16" viewBox="0 0 16 16" fill="none" xmlns="http://www.w3.org/2000/svg">
                                <path fill-rule="evenodd" clip-rule="evenodd" d="M4 4C4 1.79086 5.79086 0 8 0C10.2091 0 12 1.79086 12 4C12 6.03981 10.4732 7.723 8.5 7.96905V13.5C8.5 13.7761 8.27614 14 8 14C7.72386 14 7.5 13.7761 7.5 13.5V7.96905C5.52684 7.723 4 6.03981 4 4ZM6.49328 12.5742C6.53841 12.8467 6.35414 13.1041 6.08171 13.1492C5.37026 13.2671 4.80258 13.4439 4.42743 13.6415C4.23962 13.7405 4.1222 13.8332 4.05719 13.9069C4.02598 13.9422 4.01158 13.9679 4.00527 13.9824C4.00219 13.9895 4.00098 13.9941 4.00049 13.9963C4.00003 13.9984 4 14 4 14C4 14 3.99995 14.0025 4.00153 14.0077C4.00322 14.0132 4.00741 14.0243 4.01754 14.0407C4.03876 14.0753 4.08204 14.1273 4.16312 14.1912C4.32821 14.3213 4.59808 14.4603 4.97613 14.5863C5.72701 14.8366 6.79615 15 8 15C9.20386 15 10.273 14.8366 11.0239 14.5863C11.4019 14.4603 11.6718 14.3213 11.8369 14.1912C11.918 14.1273 11.9612 14.0753 11.9825 14.0407C11.9926 14.0243 11.9968 14.0132 11.9985 14.0077C12 14.0026 12 14.0001 12 14.0001C12 14.0001 12 13.9984 11.9995 13.9963C11.999 13.9941 11.9978 13.9895 11.9947 13.9824C11.9884 13.9679 11.974 13.9422 11.9428 13.9069C11.8778 13.8332 11.7604 13.7405 11.5726 13.6415C11.1974 13.4439 10.6297 13.2671 9.91829 13.1492C9.64586 13.1041 9.46159 12.8467 9.50672 12.5742C9.55185 12.3018 9.80928 12.1175 10.0817 12.1627C10.852 12.2903 11.5343 12.491 12.0387 12.7568C12.5009 13.0003 13 13.4014 13 14C13 14.426 12.7406 14.7522 12.4559 14.9766C12.1655 15.2054 11.7764 15.3896 11.3401 15.535C10.4623 15.8276 9.28143 16 8 16C6.71857 16 5.53771 15.8276 4.65991 15.535C4.22362 15.3896 3.83448 15.2054 3.54415 14.9766C3.25945 14.7522 3 14.426 3 14C3 13.4014 3.49912 13.0003 3.96128 12.7568C4.4657 12.491 5.14802 12.2903 5.91829 12.1627C6.19072 12.1175 6.44815 12.3018 6.49328 12.5742Z" fill="black"/>
                            </svg>
                        <cfelse>
                        <a href="../Admin/sppb_tetapan_pengguna_cari.cfm" class="flex items-center space-x-4 gap-2 py-2.5 hover:bg-pink-700 transition pl-8">
                        <svg width="16" height="16" viewBox="0 0 16 16" fill="none" xmlns="http://www.w3.org/2000/svg">
                                <path fill-rule="evenodd" clip-rule="evenodd" d="M4 4C4 1.79086 5.79086 0 8 0C10.2091 0 12 1.79086 12 4C12 6.03981 10.4732 7.723 8.5 7.96905V13.5C8.5 13.7761 8.27614 14 8 14C7.72386 14 7.5 13.7761 7.5 13.5V7.96905C5.52684 7.723 4 6.03981 4 4ZM6.49328 12.5742C6.53841 12.8467 6.35414 13.1041 6.08171 13.1492C5.37026 13.2671 4.80258 13.4439 4.42743 13.6415C4.23962 13.7405 4.1222 13.8332 4.05719 13.9069C4.02598 13.9422 4.01158 13.9679 4.00527 13.9824C4.00219 13.9895 4.00098 13.9941 4.00049 13.9963C4.00003 13.9984 4 14 4 14C4 14 3.99995 14.0025 4.00153 14.0077C4.00322 14.0132 4.00741 14.0243 4.01754 14.0407C4.03876 14.0753 4.08204 14.1273 4.16312 14.1912C4.32821 14.3213 4.59808 14.4603 4.97613 14.5863C5.72701 14.8366 6.79615 15 8 15C9.20386 15 10.273 14.8366 11.0239 14.5863C11.4019 14.4603 11.6718 14.3213 11.8369 14.1912C11.918 14.1273 11.9612 14.0753 11.9825 14.0407C11.9926 14.0243 11.9968 14.0132 11.9985 14.0077C12 14.0026 12 14.0001 12 14.0001C12 14.0001 12 13.9984 11.9995 13.9963C11.999 13.9941 11.9978 13.9895 11.9947 13.9824C11.9884 13.9679 11.974 13.9422 11.9428 13.9069C11.8778 13.8332 11.7604 13.7405 11.5726 13.6415C11.1974 13.4439 10.6297 13.2671 9.91829 13.1492C9.64586 13.1041 9.46159 12.8467 9.50672 12.5742C9.55185 12.3018 9.80928 12.1175 10.0817 12.1627C10.852 12.2903 11.5343 12.491 12.0387 12.7568C12.5009 13.0003 13 13.4014 13 14C13 14.426 12.7406 14.7522 12.4559 14.9766C12.1655 15.2054 11.7764 15.3896 11.3401 15.535C10.4623 15.8276 9.28143 16 8 16C6.71857 16 5.53771 15.8276 4.65991 15.535C4.22362 15.3896 3.83448 15.2054 3.54415 14.9766C3.25945 14.7522 3 14.426 3 14C3 13.4014 3.49912 13.0003 3.96128 12.7568C4.4657 12.491 5.14802 12.2903 5.91829 12.1627C6.19072 12.1175 6.44815 12.3018 6.49328 12.5742Z" fill="white"/>
                            </svg>    
                        </cfif>
                            Pengguna
                        </a>
                        <cfif #CGI.SCRIPT_NAME# EQ "/SPPB_LPN/Utama/Admin/sppb_tetapan_tempat_daerah.cfm" OR 
                        #CGI.SCRIPT_NAME# EQ "/SPPB_LPN/Utama/Admin/sppb_tetapan_tempat_mukim.cfm" OR 
                        #CGI.SCRIPT_NAME# EQ "/SPPB_LPN/Utama/Admin/sppb_tetapan_tempat_adun.cfm" OR
                        #CGI.SCRIPT_NAME# EQ "/SPPB_LPN/Utama/Admin/sppb_tetapan_tempat_parlimen.cfm" OR 
                        #CGI.SCRIPT_NAME# EQ "/SPPB_LPN/Utama/Admin/sppb_tetapan_tempat_pbt.cfm">
                        <a href="../Admin/sppb_tetapan_tempat_daerah.cfm" class="flex items-center space-x-4 gap-2 py-2.5 bg-gray-100 text-gray-800 hover:bg-gray-400 transition pl-8">
                            <svg width="16" height="16" viewBox="0 0 16 16" fill="none" xmlns="http://www.w3.org/2000/svg">
                                <path fill-rule="evenodd" clip-rule="evenodd" d="M4 4C4 1.79086 5.79086 0 8 0C10.2091 0 12 1.79086 12 4C12 6.03981 10.4732 7.723 8.5 7.96905V13.5C8.5 13.7761 8.27614 14 8 14C7.72386 14 7.5 13.7761 7.5 13.5V7.96905C5.52684 7.723 4 6.03981 4 4ZM6.49328 12.5742C6.53841 12.8467 6.35414 13.1041 6.08171 13.1492C5.37026 13.2671 4.80258 13.4439 4.42743 13.6415C4.23962 13.7405 4.1222 13.8332 4.05719 13.9069C4.02598 13.9422 4.01158 13.9679 4.00527 13.9824C4.00219 13.9895 4.00098 13.9941 4.00049 13.9963C4.00003 13.9984 4 14 4 14C4 14 3.99995 14.0025 4.00153 14.0077C4.00322 14.0132 4.00741 14.0243 4.01754 14.0407C4.03876 14.0753 4.08204 14.1273 4.16312 14.1912C4.32821 14.3213 4.59808 14.4603 4.97613 14.5863C5.72701 14.8366 6.79615 15 8 15C9.20386 15 10.273 14.8366 11.0239 14.5863C11.4019 14.4603 11.6718 14.3213 11.8369 14.1912C11.918 14.1273 11.9612 14.0753 11.9825 14.0407C11.9926 14.0243 11.9968 14.0132 11.9985 14.0077C12 14.0026 12 14.0001 12 14.0001C12 14.0001 12 13.9984 11.9995 13.9963C11.999 13.9941 11.9978 13.9895 11.9947 13.9824C11.9884 13.9679 11.974 13.9422 11.9428 13.9069C11.8778 13.8332 11.7604 13.7405 11.5726 13.6415C11.1974 13.4439 10.6297 13.2671 9.91829 13.1492C9.64586 13.1041 9.46159 12.8467 9.50672 12.5742C9.55185 12.3018 9.80928 12.1175 10.0817 12.1627C10.852 12.2903 11.5343 12.491 12.0387 12.7568C12.5009 13.0003 13 13.4014 13 14C13 14.426 12.7406 14.7522 12.4559 14.9766C12.1655 15.2054 11.7764 15.3896 11.3401 15.535C10.4623 15.8276 9.28143 16 8 16C6.71857 16 5.53771 15.8276 4.65991 15.535C4.22362 15.3896 3.83448 15.2054 3.54415 14.9766C3.25945 14.7522 3 14.426 3 14C3 13.4014 3.49912 13.0003 3.96128 12.7568C4.4657 12.491 5.14802 12.2903 5.91829 12.1627C6.19072 12.1175 6.44815 12.3018 6.49328 12.5742Z" fill="black"/>
                            </svg>
                        <cfelse>    
                        <a href="../Admin/sppb_tetapan_tempat_daerah.cfm" class="flex items-center space-x-4 gap-2 py-2.5 hover:bg-pink-700 transition pl-8">
                        <svg width="16" height="16" viewBox="0 0 16 16" fill="none" xmlns="http://www.w3.org/2000/svg">
                                <path fill-rule="evenodd" clip-rule="evenodd" d="M4 4C4 1.79086 5.79086 0 8 0C10.2091 0 12 1.79086 12 4C12 6.03981 10.4732 7.723 8.5 7.96905V13.5C8.5 13.7761 8.27614 14 8 14C7.72386 14 7.5 13.7761 7.5 13.5V7.96905C5.52684 7.723 4 6.03981 4 4ZM6.49328 12.5742C6.53841 12.8467 6.35414 13.1041 6.08171 13.1492C5.37026 13.2671 4.80258 13.4439 4.42743 13.6415C4.23962 13.7405 4.1222 13.8332 4.05719 13.9069C4.02598 13.9422 4.01158 13.9679 4.00527 13.9824C4.00219 13.9895 4.00098 13.9941 4.00049 13.9963C4.00003 13.9984 4 14 4 14C4 14 3.99995 14.0025 4.00153 14.0077C4.00322 14.0132 4.00741 14.0243 4.01754 14.0407C4.03876 14.0753 4.08204 14.1273 4.16312 14.1912C4.32821 14.3213 4.59808 14.4603 4.97613 14.5863C5.72701 14.8366 6.79615 15 8 15C9.20386 15 10.273 14.8366 11.0239 14.5863C11.4019 14.4603 11.6718 14.3213 11.8369 14.1912C11.918 14.1273 11.9612 14.0753 11.9825 14.0407C11.9926 14.0243 11.9968 14.0132 11.9985 14.0077C12 14.0026 12 14.0001 12 14.0001C12 14.0001 12 13.9984 11.9995 13.9963C11.999 13.9941 11.9978 13.9895 11.9947 13.9824C11.9884 13.9679 11.974 13.9422 11.9428 13.9069C11.8778 13.8332 11.7604 13.7405 11.5726 13.6415C11.1974 13.4439 10.6297 13.2671 9.91829 13.1492C9.64586 13.1041 9.46159 12.8467 9.50672 12.5742C9.55185 12.3018 9.80928 12.1175 10.0817 12.1627C10.852 12.2903 11.5343 12.491 12.0387 12.7568C12.5009 13.0003 13 13.4014 13 14C13 14.426 12.7406 14.7522 12.4559 14.9766C12.1655 15.2054 11.7764 15.3896 11.3401 15.535C10.4623 15.8276 9.28143 16 8 16C6.71857 16 5.53771 15.8276 4.65991 15.535C4.22362 15.3896 3.83448 15.2054 3.54415 14.9766C3.25945 14.7522 3 14.426 3 14C3 13.4014 3.49912 13.0003 3.96128 12.7568C4.4657 12.491 5.14802 12.2903 5.91829 12.1627C6.19072 12.1175 6.44815 12.3018 6.49328 12.5742Z" fill="white"/>
                            </svg>
                        </cfif>    
                            Tempat
                        </a>
                        <a href="/Tetapan/Hartanah" class="flex items-center space-x-4 gap-2 py-2.5 hover:bg-pink-700 transition pl-8">
                            <svg width="16" height="16" viewBox="0 0 16 16" fill="none" xmlns="http://www.w3.org/2000/svg">
                                <path d="M6.5 14.5V10.9947C6.5 10.75 6.75 10.5 7 10.5H9C9.25 10.5 9.5 10.75 9.5 11V14.5C9.5 14.7761 9.72386 15 10 15H14C14.2761 15 14.5 14.7761 14.5 14.5V7.5C14.5 7.36739 14.4473 7.24021 14.3536 7.14645L13 5.79289V2.5C13 2.22386 12.7761 2 12.5 2H11.5C11.2239 2 11 2.22386 11 2.5V3.79289L8.35355 1.14645C8.15829 0.951184 7.84171 0.951184 7.64645 1.14645L1.64645 7.14645C1.55268 7.24021 1.5 7.36739 1.5 7.5V14.5C1.5 14.7761 1.72386 15 2 15H6C6.27614 15 6.5 14.7761 6.5 14.5Z" fill="white"/>
                            </svg>
                            Hartanah
                        </a>
                    </div>
                </div>
            </div>
        </div>
        

    </nav>

    <div class="fixed bottom-0 left-0 border-t border-gray-700 ">
        <div class="flex items-center justify-center space-x-4 px-4 py-4 w-64  ">
            <a href="javascript:void(0)" class="text-gray-200 hover:text-violet-600 transition">
                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" class="bi bi-gear" viewBox="0 0 16 16">
                    <path d="M8 4.754a3.246 3.246 0 1 0 0 6.492 3.246 3.246 0 0 0 0-6.492M5.754 8a2.246 2.246 0 1 1 4.492 0 2.246 2.246 0 0 1-4.492 0"/>
                    <path d="M9.796 1.343c-.527-1.79-3.065-1.79-3.592 0l-.094.319a.873.873 0 0 1-1.255.52l-.292-.16c-1.64-.892-3.433.902-2.54 2.541l.159.292a.873.873 0 0 1-.52 1.255l-.319.094c-1.79.527-1.79 3.065 0 3.592l.319.094a.873.873 0 0 1 .52 1.255l-.16.292c-.892 1.64.901 3.434 2.541 2.54l.292-.159a.873.873 0 0 1 1.255.52l.094.319c.527 1.79 3.065 1.79 3.592 0l.094-.319a.873.873 0 0 1 1.255-.52l.292.16c1.64.893 3.434-.902 2.54-2.541l-.159-.292a.873.873 0 0 1 .52-1.255l.319-.094c1.79-.527 1.79-3.065 0-3.592l-.319-.094a.873.873 0 0 1-.52-1.255l.16-.292c.893-1.64-.902-3.433-2.541-2.54l-.292.159a.873.873 0 0 1-1.255-.52zm-2.633.283c.246-.835 1.428-.835 1.674 0l.094.319a1.873 1.873 0 0 0 2.693 1.115l.291-.16c.764-.415 1.6.42 1.184 1.185l-.159.292a1.873 1.873 0 0 0 1.116 2.692l.318.094c.835.246.835 1.428 0 1.674l-.319.094a1.873 1.873 0 0 0-1.115 2.693l.16.291c.415.764-.42 1.6-1.185 1.184l-.291-.159a1.873 1.873 0 0 0-2.693 1.116l-.094.318c-.246.835-1.428.835-1.674 0l-.094-.319a1.873 1.873 0 0 0-2.692-1.115l-.292.16c-.764.415-1.6-.42-1.184-1.185l.159-.291A1.873 1.873 0 0 0 1.945 8.93l-.319-.094c-.835-.246-.835-1.428 0-1.674l.319-.094A1.873 1.873 0 0 0 3.06 4.377l-.16-.292c-.415-.764.42-1.6 1.185-1.184l.292.159a1.873 1.873 0 0 0 2.692-1.115z"/>
                </svg>
            </a>
            <a href="javascript:void(0)" class="text-gray-400 hover:text-white transition">
                <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 12h14M12 5v14"></path>
                </svg>
            </a>
            <a href="javascript:void(0)" class="text-gray-200 font-bold hover:text-violet-600 transition">
                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" class="bi bi-power" viewBox="0 0 16 16">
                    <path d="M7.5 1v7h1V1z"/>
                    <path d="M3 8.812a5 5 0 0 1 2.578-4.375l-.485-.874A6 6 0 1 0 11 3.616l-.501.865A5 5 0 1 1 3 8.812"/>
                </svg>
            </a>
        </div>
    </div>
</div>
