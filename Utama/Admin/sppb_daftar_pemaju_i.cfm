<div class="w-full px-6 md:px-6 sm:px-0">
        <form action="#">
        <h1 class="text-2xl font-semibold text-gray-900 sm:text-3xl md:text-4xl">
          Pendaftaran Pemaju
        </h1>
        <div class="tabs">
          <div class="block">
            <ul class="flex border-b border-gray-200 space-x-3 transition-all duration-300 -mb-px">
              <li>
                <a class="inline-block py-4 px-6 text-gray-500 hover:text-gray-800 font-medium border-b-2 border-transparent tab-active:border-b-indigo-600 tab-active:text-indigo-600 active tablink whitespace-nowrap pointer-events-none" data-tab="tabs-with-underline-1" role="tab">Maklumat Pemaju</a>
              </li>
              <li>
                <a class="inline-block py-4 px-6 text-gray-500 hover:text-gray-800 font-medium border-b-2 border-transparent tab-active:border-b-indigo-600 tab-active:text-indigo-600 tablink whitespace-nowrap pointer-events-none" data-tab="tabs-with-underline-2" role="tab">Maklumat Projek</a>
              </li>
              <li>
                <a class="inline-block py-4 px-6 text-gray-500 hover:text-gray-800 font-medium border-b-2 border-transparent tab-active:border-b-indigo-600 tab-active:text-indigo-600 tablink whitespace-nowrap pointer-events-none" data-tab="tabs-with-underline-3" role="tab">Pengesahan Pendaftaran</a>
              </li>
            </ul>
          </div>
          <div class="mt-3">
            <div id="tabs-with-underline-1" role="tabpanel" aria-labelledby="tabs-with-underline-item-1" class="tabcontent">
              <div class="mt-8 grid grid-cols-6 gap-6">
                <div class="col-span-6 ">
                    <label for="NamaPemaju" class="block text-sm font-medium text-gray-700">
                      Nama Pemaju
                    </label>

                    <input
                      type="text"
                      id="NamaPemaju"
                      name="nama_pemaju"
                      required
                      class="mt-1 w-full h-12 rounded-md border border-gray-300 bg-white text-sm text-gray-700 shadow-sm px-4"
                    />
                  </div>

                  <div class="col-span-6 sm:col-span-3">
                    <label for="SSM" class="block text-sm font-medium text-gray-700">
                      No. Pendaftaran Syarikat Pemaju (SSM)
                    </label>

                    <input
                      type="text"
                      id="SSM"
                      name="no_ssm"
                      required
                      class="mt-1 w-full h-12 rounded-md border border-gray-300 bg-white text-sm text-gray-700 shadow-sm px-4"
                    />
                  </div>

                  <div class="col-span-6 sm:col-span-3">
                    <label for="EmelPemaju" class="block text-sm font-medium text-gray-700">
                      Emel Pemaju
                    </label>

                    <input
                      type="email"
                      id="EmelPemaju"
                      name="emel_pemaju"
                      required
                      class="mt-1 w-full h-12 rounded-md border border-gray-300 bg-white text-sm text-gray-700 shadow-sm px-4"
                    />
                  </div>

                  <div class="col-span-6">
                    <label for="AlamatPemaju" class="block text-sm font-medium text-gray-700">
                      Alamat Pemaju
                    </label>

                    <input
                      type="textarea"
                      id="AlamatPemaju"
                      name="alamat_pemaju"
                      required
                      class="mt-1 w-full h-12 rounded-md border border-gray-300 bg-white text-sm text-gray-700 shadow-sm px-4"
                    />
                  </div>
                  <div class="col-span-6 sm:col-span-2">
                    <label for="Bandar" class="block text-sm font-medium text-gray-700">
                      Bandar
                    </label>

                    <input
                      type="text"
                      id="Bandar"
                      name="bandar"
                      required
                      class="mt-1 w-full h-12 rounded-md border border-gray-300 bg-white text-sm text-gray-700 shadow-sm px-4"
                    />
                  </div>
                  <div class="col-span-6 sm:col-span-2">
                    <label for="NoPoskod" class="block text-sm font-medium text-gray-700">
                      No. Poskod
                    </label>

                    <input
                      type="text"
                      id="NoPoskod"
                      name="no_poskod"
                      required
                      class="mt-1 w-full h-12 rounded-md border border-gray-300 bg-white text-sm text-gray-700 shadow-sm px-4"
                    />
                  </div>

                  <div class="col-span-6 sm:col-span-2">
                    <label for="Negeri" class="block text-sm font-medium text-gray-700">
                      Negeri
                    </label>

                    <select 
                      id="Negeri"
                      name="negeri"
                      required
                      class="mt-1 w-full h-12 rounded-md border border-gray-300 bg-white text-sm text-gray-700 shadow-sm px-4"
                    >
                        <option value="Melaka">Melaka</option>
                        <option value="Johor">Johor</option>
                        <option value="Kedah">Kedah</option>
                        <option value="Kelantan">Kelantan</option>
                        <option value="Negeri Sembilan">Negeri Sembilan</option>
                        <option value="Pahang">Pahang</option>
                        <option value="Perak">Perak</option>
                        <option value="Perlis">Perlis</option>
                        <option value="Pulau Pinang">Pulau Pinang</option>
                        <option value="Sabah">Sabah</option>
                        <option value="Sarawak">Sarawak</option>
                        <option value="Selangor">Selangor</option>
                        <option value="Terengganu">Terengganu</option>
                        <option value="W.P. Kuala Lumpur">W.P. Kuala Lumpur</option>
                        <option value="W.P. Putrajaya">W.P. Putrajaya</option>
                    </select>
                  </div>

                  <div class="col-span-6 sm:col-span-3">
                    <label for="NoTelefon" class="block text-sm font-medium text-gray-700">
                      No. Telefon
                    </label>

                    <input
                      type="text"
                      id="NoTelefon"
                      name="no_telefon"
                      required
                      class="mt-1 w-full h-12 rounded-md border border-gray-300 bg-white text-sm text-gray-700 shadow-sm px-4"
                    />
                  </div>

                  <div class="col-span-6 sm:col-span-3">
                    <label for="NoFax" class="block text-sm font-medium text-gray-700">
                      No. Fax
                    </label>

                    <input
                      type="text"
                      id="NoFax"
                      name="no_fax"
                      required
                      class="mt-1 w-full h-12 rounded-md border border-gray-300 bg-white text-sm text-gray-700 shadow-sm px-4"
                    />
                  </div>
                
                  <div class="ml-auto col-span-6 sm:flex sm:items-end sm:gap-4">
                    <a
                      href="javascript:void(0)"
                      class="inline-block shrink-0 rounded-md border border-blue-600 bg-blue-600 px-12 py-3 text-sm font-medium text-white transition hover:bg-transparent hover:text-blue-600 focus:outline-none focus:ring active:text-blue-500" data-tab="tabs-with-underline-2" role="tab"
                    >
                      Seterusnya
                    </a>
                  </div>
              
              
              </div>

            </div>
            <div id="tabs-with-underline-2" class="hidden tabcontent" role="tabpanel" aria-labelledby="tabs-with-underline-item-2">
              <div class="mt-8 grid grid-cols-6 gap-6">
                <div class="col-span-6 sm:col-span-3">
                <label for="NoRujukanPTD" class="block text-sm font-medium text-gray-700">No. Rujukan Fail PTD</label>

                <input
                  type="text"
                  id="NoRujukanPTD"
                  name="no_rujukan_ptd"
                  required
                  class="mt-1 w-full h-12 rounded-md border border-gray-300 bg-white text-sm text-gray-700 shadow-sm px-4"
                />
                </div>
                <div class="col-span-6 sm:col-span-3">
                  <label for="NoRujukanPTG" class="block text-sm font-medium text-gray-700">No. Rujukan Fail PTG</label>

                  <input
                    type="text"
                    id="NoRujukanPTG"
                    name="no_rujukan_ptg"
                    required
                    class="mt-1 w-full h-12 rounded-md border border-gray-300 bg-white text-sm text-gray-700 shadow-sm px-4"
                  />
                </div>
                <div class="col-span-6 sm:col-span-3">
                  <label for="BilMesyuarat" class="block text-sm font-medium text-gray-700">
                    Bilangan Mesyuarat
                  </label>

                  <input
                    type="number"
                    min="1"
                    value="1"
                    id="BilMesyuarat"
                    name="bil_mesyuarat"
                    required
                    class="mt-1 w-full h-12 rounded-md border border-gray-300 bg-white text-sm text-gray-700 shadow-sm px-4"
                  />
                </div>

                <div class="col-span-6 sm:col-span-3">
                  <label for="MaklumatTanah" class="block text-sm font-medium text-gray-700">Maklumat Tanah (No. Lot / No. PT)</label>

                  <input
                    type="text"
                    id="MaklumatTanah"
                    name="maklumat_tanah"
                    required
                    class="mt-1 w-full h-12 rounded-md border border-gray-300 bg-white text-sm text-gray-700 shadow-sm px-4"
                  />
                </div>

                <div class="col-span-6 sm:col-span-3">
                  <label for="DaerahProjek" class="block text-sm font-medium text-gray-700">
                    Daerah (Projek)
                  </label>

                  <select
                    id="DaerahProjek"
                    name="daerah_projek"
                    required
                    class="mt-1 w-full h-12 rounded-md border border-gray-300 bg-white text-sm text-gray-700 shadow-sm px-4"
                  >
                  <option value="Melaka Tengah">Melaka Tengah</option>
                  <option value="Jasin">Jasin</option>
                  <option value="Alor Gajah">Alor Gajah</option>
                  </select>
                </div>

                <div class="col-span-6 sm:col-span-3">
                  <label for="ParlimenProjek" class="block text-sm font-medium text-gray-700">
                    Parlimen / Dun / Mukim (Projek)
                  </label>

                  <select
                    id="ParlimenProjek"
                    name="parlimen_projek"
                    required
                    class="mt-1 w-full h-12 rounded-md border border-gray-300 bg-white text-sm text-gray-700 shadow-sm px-4"
                  >
                  <option value="Masjid Tanah">Masjid Tanah</option>
                  <option value="Jasin">Jasin</option>
                  <option value="Alor Gajah">Alor Gajah</option>
                  <option value="Kota Melaka">Kota Melaka</option>
                  <option value="Hang Tuah Jaya">Hang Tuah Jaya</option>
                  </select>
                </div>

                <div class="col-span-6 sm:col-span-3">
                  <label for="PBTLulus" class="block text-sm font-medium text-gray-700">Pihak Berkuasa Tempatan (PBT) yang meluluskan</label>

                  <input
                    type="text"
                    id="PBTLulus"
                    name="pbt_lulus"
                    required
                    class="mt-1 w-full h-12 rounded-md border border-gray-300 bg-white text-sm text-gray-700 shadow-sm px-4"
                  />
                </div>

                <div class="col-span-6 sm:col-span-3">
                  <label for="TarikhMerancang" class="block text-sm font-medium text-gray-700">Tarikh Kebenaran Merancang</label>

                  <input
                    type="date"
                    id="TarikhMerancang"
                    name="tarikh_merancang"
                    required
                    class="mt-1 w-full h-12 rounded-md border border-gray-300 bg-white text-sm text-gray-700 shadow-sm px-4"
                  />
                </div>

                <div class="col-span-6 sm:col-span-2">
                    <label for="KeluasanTanah" class="block text-sm font-medium text-gray-700">Keluasan Tanah Projek</label>
                    <div class="flex space-x-2">
                      <input
                        type="text"
                        id="KeluasanTanah1"
                        name="keluasan_tanah1"
                        class="mt-1 w-full h-12 rounded-md border border-gray-300 bg-white text-sm text-gray-700 shadow-sm px-4"
                      /><span class="flex items-center justify-center">EKAR</span> 
                      <input
                        type="text"
                        id="KeluasanTanah2"
                        name="keluasan_tanah2"
                        class="mt-1 w-full h-12 rounded-md border border-gray-300 bg-white text-sm text-gray-700 shadow-sm px-4"
                      /><span class="flex items-center justify-center">KPS</span> 
                    </div>
                </div>

                <div class="col-span-3 sm:col-span-2">
                  <label for="GDC" class="block text-sm font-medium text-gray-700"><span class="text-red-500">*</span> GROSS DEVELOPMENT COST (GDC)</label>

                  <input
                    type="text"
                    id="GDC"
                    name="GDC"
                    required
                    class="mt-1 w-full h-12 rounded-md border border-gray-300 bg-white text-sm text-gray-700 shadow-sm px-4"
                  />
                </div>

                <div class="col-span-3 sm:col-span-2">
                  <label for="GDV" class="block text-sm font-medium text-gray-700"><span class="text-red-500">*</span> GROSS DEVELOPMENT VALUE (GDV)</label>

                  <input
                    type="text"
                    id="GDV"
                    name="GDV"
                    required
                    class="mt-1 w-full h-12 rounded-md border border-gray-300 bg-white text-sm text-gray-700 shadow-sm px-4"
                  />
                </div>
                <div class="ml-auto col-span-6 sm:flex sm:items-end sm:gap-4">
                  <a
                    href="javascript:void(0)"
                    class="inline-block shrink-0 rounded-md border border-blue-600 bg-blue-600 px-12 py-3 text-sm font-medium text-white transition hover:bg-transparent hover:text-blue-600 focus:outline-none focus:ring active:text-blue-500" data-tab="tabs-with-underline-1" role="tab"
                  >
                    Kembali
                  </a>
                  <a
                    href="javascript:void(0)"
                    class="inline-block shrink-0 rounded-md border border-blue-600 bg-blue-600 px-12 py-3 text-sm font-medium text-white transition hover:bg-transparent hover:text-blue-600 focus:outline-none focus:ring active:text-blue-500" data-tab="tabs-with-underline-3" role="tab"
                  >
                    Seterusnya
                  </a>
                </div>
              </div>
            </div>
            <div id="tabs-with-underline-3" class="hidden tabcontent" role="tabpanel" aria-labelledby="tabs-with-underline-item-3">
              <div class="mt-8 grid grid-cols-6 gap-6">
                <div class="col-span-6 sm:col-span-2">
                    <label for="AmaunPendaftaran" class="block text-sm font-medium text-gray-700">
                      Amaun Pendaftaran (RM)
                    </label>

                    <input
                      type="text"
                      id="AmaunPendaftaran"
                      name="amaun_pendaftaran"
                      required
                      class="mt-1 w-full h-12 rounded-md border border-gray-300 bg-white text-sm text-gray-700 shadow-sm px-4"
                    />
                  </div>
                  <div class="col-span-6 sm:col-span-2">
                    <label for="NamaBank" class="block text-sm font-medium text-gray-700">
                      Nama Bank
                    </label>

                    <input
                      type="text"
                      id="NamaBank"
                      name="nama_bank"
                      required
                      class="mt-1 w-full h-12 rounded-md border border-gray-300 bg-white text-sm text-gray-700 shadow-sm px-4"
                    />
                  </div>

                  <div class="col-span-6 sm:col-span-2">
                    <label for="NomborCek" class="block text-sm font-medium text-gray-700">
                      No. Cek
                    </label>

                    <input
                      type="text"
                      id="NomborCek"
                      name="nombor_cek"
                      required
                      class="mt-1 w-full h-12 rounded-md border border-gray-300 bg-white text-sm text-gray-700 shadow-sm px-4"
                    />
                  </div>
                  <div class="col-span-6 sm:col-span-1 flex items-center">
                    <p class="">Pegawai Yang Boleh Dihubungi</p>
                  </div>
                  <div class="col-span-6 sm:col-span-2">
                    <label for="NamaPegawai" class="block text-sm font-medium text-gray-700">
                      Nama Pegawai
                    </label>

                    <input
                      type="text"
                      id="NamaPegawai"
                      name="nama_pegawai"
                      required
                      class="mt-1 w-full h-12 rounded-md border border-gray-300 bg-white text-sm text-gray-700 shadow-sm px-4"
                    />
                  </div>
                  <div class="col-span-6 sm:col-span-2">
                    <label for="NomborTelefon" class="block text-sm font-medium text-gray-700">
                      No. Telefon
                    </label>

                    <input
                      type="text"
                      id="NomborTelefon"
                      name="nombor_telefon"
                      required
                      class="mt-1 w-full h-12 rounded-md border border-gray-300 bg-white text-sm text-gray-700 shadow-sm px-4"
                    />
                  </div>

                  <div class="ml-auto col-span-6 sm:flex sm:items-end sm:gap-4">
                  <a
                    href="javascript:void(0)"
                    class="inline-block shrink-0 rounded-md border border-blue-600 bg-blue-600 px-12 py-3 text-sm font-medium text-white transition hover:bg-transparent hover:text-blue-600 focus:outline-none focus:ring active:text-blue-500" data-tab="tabs-with-underline-2" role="tab"
                  >
                    Kembali
                  </a>
                  <button
                    class="inline-block shrink-0 rounded-md border border-blue-600 bg-blue-600 px-12 py-3 text-sm font-medium text-white transition hover:bg-transparent hover:text-blue-600 focus:outline-none focus:ring active:text-blue-500"
                  >
                    Simpan
                  </button>
                </div>
              </div>
            </div>
          </div>
        </div> 
        </form>
</div>

<script>
  document.addEventListener('DOMContentLoaded', function () {
    // Select all buttons with the 'Seterusnya' label
    const nextButtons = document.querySelectorAll('a[data-tab]');
    // Loop through each button and add a click event listener
    nextButtons.forEach(button => {
      button.addEventListener('click', function () {
        const targetTab = button.getAttribute('data-tab');
        
        // Hide all tab contents
        document.querySelectorAll('.tabcontent').forEach(tabContent => {
          tabContent.classList.add('hidden');
        });
        
        // Remove 'active' class from all tab links
        document.querySelectorAll('.tablink').forEach(tabLink => {
          tabLink.classList.remove('active');
        });
        
        // Show the target tab content and add 'active' class to the corresponding tab link
        document.getElementById(targetTab).classList.remove('hidden');
        document.querySelector(`a[data-tab="${targetTab}"]`).classList.add('active');
      });
    });
  });
</script>