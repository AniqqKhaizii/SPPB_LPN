<!doctype html>
<html>
<cfinclude template="./public/includes/head.cfm">
<body>

<section class="bg-gradient-to-b from-[#f0f0f0] to-[#f8f8f8]">
  <div class="lg:grid lg:min-h-screen lg:grid-cols-12">
    <section class="relative flex h-80 items-end bg-gray-900 lg:col-span-5 lg:h-full xl:col-span-6">
      <img
        alt=""
        src="https://cdn-cms.pgimgs.com/static/2020/02/m10.jpg"
        class="absolute inset-0 h-full w-full object-cover opacity-10"
      />

      <div class="hidden lg:relative lg:block lg:p-12">
        <a href="./index.cfm">
        <img src="./public/assets/SPPB.png" class="h-24 w-24 rounded-full" />
        </a>

        <h2 class="mt-6 text-xl font-semibold text-white sm:text-3xl md:text-4xl uppercase">
          Sistem Pengurusan Perumahan Bersepadu
        </h2>
      </div>
    </section>

    <main class="flex items-center justify-center px-8 py-8 sm:px-12 lg:col-span-7 lg:px-16 lg:py-12 xl:col-span-6 bg-gray-300">
      <div class="mx-auto max-w-screen-xl px-4 py-6 sm:px-6 lg:px-8">
        <div class="mx-auto max-w-lg max-h-screen">


        <a href="./Utama/Admin" class="block my-4">
          <img
            alt=""
            src="https://lpnm.gov.my/wp-content/uploads/2021/03/LOGOweb.png"
            class="h-56 w-full rounded-bl-3xl rounded-tr-3xl object-contain sm:h-64 lg:h-52 shadow-2xl bg-gray-200"
          />

          <div class="mt-2 sm:flex sm:items-center sm:justify-center sm:gap-4">
            <span class="hidden sm:block sm:h-px sm:w-8 sm:bg-yellow-500"></span>
            <strong class="font-medium">LEMBAGA PERUMAHAN MELAKA</strong>

            <span class="hidden sm:block sm:h-px sm:w-8 sm:bg-yellow-500"></span>
          </div>
        </a>
        <a href="./Pemaju" class="block my-4">
          <img
            alt=""
            src="https://img.icons8.com/fluency/96/worker-male.png"
            class="h-56 w-full rounded-bl-3xl rounded-tr-3xl object-contain sm:h-64 lg:h-52 shadow-2xl bg-gray-200"
          />

          <div class="mt-2 sm:flex sm:items-center sm:justify-center sm:gap-4">
            <span class="hidden sm:block sm:h-px sm:w-8 sm:bg-yellow-500"></span>
            <strong class="font-medium">PEMAJU</strong>

            <span class="hidden sm:block sm:h-px sm:w-8 sm:bg-yellow-500"></span>
          </div>
        </a>
        
        <a href="./Pembeli" class="block my-4">
          <img
            alt=""
            src="https://cdn-icons-png.flaticon.com/512/1067/1067029.png"
            class="h-56 w-full rounded-bl-3xl rounded-tr-3xl object-contain sm:h-64 lg:h-52 shadow-2xl bg-gray-200"
          />

          <div class="mt-2 sm:flex sm:items-center sm:justify-center sm:gap-4">
            <span class="hidden sm:block sm:h-px sm:w-8 sm:bg-yellow-500"></span>
            <strong class="font-medium">PENGGUNA AWAM</strong>

            <span class="hidden sm:block sm:h-px sm:w-8 sm:bg-yellow-500"></span>
          </div>
        </a>
        </div>
      </div>
    </main>
  </div>
</section>
</body>
</html>


