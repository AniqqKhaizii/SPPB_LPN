<!doctype html>
<html>
<cfinclude template="./public/includes/head.cfm">
<style>

.bg-header{
  background-image: linear-gradient(to bottom, rgba(0, 0, 0, 0.7), rgba(10, 10, 10, 0.9)), url('https://dpsland.com/my_asset/TBRP%20Bungalow/Bungalow%20(2).jpg');
  background-size: cover;
  background-position: center;
  background-repeat: no-repeat;
  background-attachment: fixed;
  clip-path: ellipse(200% 100% at 50% 0%);
  background-color: #f8f8f8;
}

.bg-quote {
  background: linear-gradient(to bottom, rgba(0, 0, 0, 0.7), rgba(10, 10, 10, 0.9)), url(https://dpsland.com/my_asset/TBRP%20Semi%20D/Semi%20D.jpg);
  background-size: cover;
  background-position: center;
  background-repeat: no-repeat;
  background-attachment: fixed;
}
</style>
<header class="">
  <div class="mx-auto max-w-screen-xl px-4 sm:px-6 lg:px-8">
    <div class="flex h-16 items-center justify-between">
      <div class="md:flex md:items-center md:gap-12">
        <a class="block text-teal-600" href="#">
          <span class="sr-only">Home</span>
          <img src="./public/assets/SPPB.png" class="h-16 w-auto" />
        </a>
      </div>

      <div class="hidden md:block">
        <nav aria-label="Global">
          <ul class="flex items-center gap-6 text-sm">
            <li>
              <a class="text-gray-700 font-semibold transition hover:text-gray-500/75" href="#"> Laman Utama </a>
            </li>

            <li>
              <a class="text-gray-700 font-semibold transition hover:text-gray-500/75" href="#"> Perkhidmatan </a>
            </li>

            <li>
              <a class="text-gray-700 font-semibold transition hover:text-gray-500/75" href="#"> Pengumuman </a>
            </li>
          </ul>
        </nav>
      </div>

      <div class="flex items-center gap-4">
        <div class="sm:flex sm:gap-4 relative group">
          <a
            class="bg-rose-600 rounded-full px-5 py-2.5 text-sm font-medium text-white shadow"
            href="#"
          >
            Log Masuk
          </a>

          <!-- Submenu -->
          <div
            class="absolute left-0 hidden group-hover:flex flex-col bg-white shadow-lg rounded-lg w-40 border border-gray-200 z-10"
            style="top: 100%;"
          >
            <a
              href="./Utama/Admin/index.cfm"
              class="px-4 py-2 text-sm text-gray-700 hover:bg-gray-100 hover:text-rose-600"
            >
              Admin
            </a>
            <a
              href="./Utama/Pemaju/index.cfm"
              class="px-4 py-2 text-sm text-gray-700 hover:bg-gray-100 hover:text-rose-600"
            >
              Pemaju
            </a>
            <a
              href="./Utama/Pembeli/index.cfm"
              class="px-4 py-2 text-sm text-gray-700 hover:bg-gray-100 hover:text-rose-600"
            >
              Pembeli
            </a>
          </div>
        </div>




        <div class="block md:hidden">
          <button class="rounded bg-gray-100 p-2 text-gray-600 transition hover:text-gray-600/75">
            <svg
              xmlns="http://www.w3.org/2000/svg"
              class="size-5"
              fill="none"
              viewBox="0 0 24 24"
              stroke="currentColor"
              stroke-width="2"
            >
              <path stroke-linecap="round" stroke-linejoin="round" d="M4 6h16M4 12h16M4 18h16" />
            </svg>
          </button>
        </div>
      </div>
    </div>
  </div>
</header>
<body>
<header class="bg-header h-[40vh] flex items-center justify-center h-screen pb-12 shadow-xl">
  <div class="bg-transparent mx-4 p-4 text-center text-white md:p-8">
    <p class="italic text-xl text-shadow-xl">
      Lembaga Perumahan Melaka
    </p>
    <h1 class="text-5xl uppercase font-bold text-shadow-xl">
      SISTEM PENGURUSAN PERUMAHAN BERSEPADU
    </h1>
    <p class="text-3xl text-rose-600 font-semibold text-shadow-xl">
      (SPPB)
    </p>
  </div>
</header>

<section class="bg-gray-100 text-gray-700">
  <div class="mx-auto max-w-screen-xl px-4 py-8 sm:px-6 sm:py-12 lg:px-8 lg:py-16">
    <div class="mx-auto max-w-lg text-center">
      <span class="relative flex justify-center">
        <div class="absolute inset-x-0 top-1/2 h-px -translate-y-1/2 bg-transparent bg-gradient-to-r from-transparent via-gray-900 to-transparent opacity-100"></div>
        <span class="relative z-10 bg-gray-100 px-6 text-2xl"><img width="40" height="40" src="https://img.icons8.com/carbon-copy/100/1A1A1A/home.png" alt="home"/></span>
      </span>
      <h2 class="text-3xl font-semibold sm:text-4xl">Perkhidmatan Kami</h2>

      <p class="mt-4 text-gray-500">
        Sistem Pengurusan Perumahan Bersepadu menawarkan perkhidmatan seperti berikut.
      </p>
    </div>

    <div class="mt-8 grid grid-cols-1 gap-8 md:grid-cols-2 lg:grid-cols-3">
      <a
        class="block rounded-xl bg-gray-50 border border-gray-300 p-8 shadow-lg transition hover:bg-rose-600 hover:border-rose-600 hover:shadow-gray-500/10"
        href="./PEMBELI/index.cfm"
      >
        <img width="64" height="64" src="https://img.icons8.com/ios/100/certificate--v1.png" alt="certificate--v1" class="mx-auto"/>
        <h2 class="mt-4 text-xl font-bold text-gray-700 text-center">Sijil Memiliki Rumah</h2>

        <p class="mt-1 text-sm text-gray-500 text-center">
          Memohon Sijil Kelayakan Memiliki Rumah bagi pengguna awam.
        </p>
      </a>
      <a
        class="block rounded-xl bg-gray-50 border border-gray-300 p-8 shadow-lg transition hover:bg-rose-600 hover:border-rose-600 hover:shadow-gray-500/10"
        href="./PEMAJU/index.cfm"
      >
        <img width="64" height="64" src="https://img.icons8.com/ios/100/project.png" alt="project" class="mx-auto"/>
        <h2 class="mt-4 text-xl font-bold text-gray-700 text-center ">Pendaftaran Projek Perumahan</h2>

        <p class="mt-1 text-sm text-gray-500 text-center">
          Mendaftar projek perumahan kedalam sistem bagi pemaju-pemaju. 
        </p>
      </a>
      <a
        class="block rounded-xl bg-gray-50 border border-gray-300 p-8 shadow-lg transition hover:bg-rose-600 hover:border-rose-600 hover:shadow-gray-500/10"
        href="./PEMAJU/index.cfm"
      >

        <h2 class="mt-4 text-xl font-bold text-gray-700 text-center ">Sijil Memiliki Rumah</h2>

        <p class="mt-1 text-sm text-gray-500 text-center">
          Memohon Sijil Kelayakan Memiliki Rumah bagi pengguna awam.
        </p>
      </a>
      

      
    </div>
  </div>
</section>

<div class="bg-quote flex items-center justify-center h-auto w-full py-6">
    <dl
      class="mg-6 grid grid-cols-1 gap-4 divide-y-2 divide-gray-500 sm:grid-cols-2 sm:divide-x-2 sm:divide-y-0 lg:grid-cols-4"
    >
      <div class="flex flex-col px-4 py-8 text-center">
        <dt class="order-last text-lg font-medium text-gray-500">Total Sales</dt>

        <dd class="text-4xl font-extrabold text-gray-100 md:text-5xl">$4.8m</dd>
      </div>

      <div class="flex flex-col px-4 py-8 text-center">
        <dt class="order-last text-lg font-medium text-gray-500">Official Addons</dt>

        <dd class="text-4xl font-extrabold text-gray-100 md:text-5xl">24</dd>
      </div>

      <div class="flex flex-col px-4 py-8 text-center">
        <dt class="order-last text-lg font-medium text-gray-500">Total Addons</dt>

        <dd class="text-4xl font-extrabold text-gray-100 md:text-5xl">86</dd>
      </div>

      <div class="flex flex-col px-4 py-8 text-center">
        <dt class="order-last text-lg font-medium text-gray-500">Downloads</dt>

        <dd class="text-4xl font-extrabold text-gray-100 md:text-5xl">86k</dd>
      </div>
    </dl>
  </div>

<section class="bg-gray-100 text-gray-700">
  <div class="mx-auto max-w-screen-xl px-4 py-8 sm:px-6 sm:py-12 lg:px-8 lg:py-16">
    <div class="mx-auto max-w-lg text-center">
      <span class="relative flex justify-center">
        <div class="absolute inset-x-0 top-1/2 h-px -translate-y-1/2 bg-transparent bg-gradient-to-r from-transparent via-gray-900 to-transparent opacity-100"></div>
        <span class="relative z-10 bg-gray-100 px-6 text-2xl"><img width="40" height="40" src="https://img.icons8.com/carbon-copy/100/1A1A1A/home.png" alt="home"/></span>
      </span>
      <h2 class="text-3xl font-semibold sm:text-4xl">Pengumuman</h2>

      <p class="mt-4 text-gray-500">
        Pemberitahuan terkini daripada Lembaga Perumahan Melaka.
      </p>
    </div>

  </div>
</section>
</body>
</html>
