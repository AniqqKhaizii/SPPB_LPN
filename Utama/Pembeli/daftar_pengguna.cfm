<!doctype html>
<html>
<cfinclude template="../includes/head.cfm">
<body>
<section class="bg-gray-100">
  <div class="lg:grid lg:min-h-screen lg:grid-cols-12">
    <aside class="relative block h-16 lg:order-last lg:col-span-5 lg:h-full xl:col-span-6 bg-gray-900">
      <img
        alt=""
        src="../../public/assets/Login.jpg"
        class="absolute inset-0 h-full w-full object-cover"
      />
    </aside>

    <main
      class="flex items-center justify-center px-8 py-8 sm:px-12 lg:col-span-7 lg:px-16 lg:py-12 xl:col-span-6"
    >
      <div class="max-w-xl lg:max-w-3xl">

        <h1 class="mt-6 text-2xl font-semibold text-gray-900 sm:text-3xl md:text-4xl">
          Daftar Pengguna
        </h1>

        <form action="#" class="mt-8 grid grid-cols-6 gap-6">
          <div class="col-span-6 sm:col-span-3">
            <label for="FirstName" class="block text-sm font-medium text-gray-700">
              Jenis Pengenalan
            </label>

            <input
              type="text"
              id="FirstName"
              name="first_name"
              class="mt-1 w-full h-12 rounded-md border border-gray-300 bg-white text-sm text-gray-700 shadow-sm px-4"
            />
          </div>

          <div class="col-span-6 sm:col-span-3">
            <label for="LastName" class="block text-sm font-medium text-gray-700">
              No. Kad Pengenalan Baru
            </label>

            <input
              type="text"
              id="LastName"
              name="last_name"
              class="mt-1 w-full h-12 rounded-md border border-gray-300 bg-white text-sm text-gray-700 shadow-sm px-4"
            />
          </div>

          <div class="col-span-6 sm:col-span-3">
            <label for="FirstName" class="block text-sm font-medium text-gray-700">
              Nama
            </label>

            <input
              type="text"
              id="FirstName"
              name="first_name"
              class="mt-1 w-full h-12 rounded-md border border-gray-300 bg-white text-sm text-gray-700 shadow-sm px-4"
            />
          </div>

          <div class="col-span-6 sm:col-span-3">
            <label for="LastName" class="block text-sm font-medium text-gray-700">
              Jantina
            </label>

            <input
              type="text"
              id="LastName"
              name="last_name"
              class="mt-1 w-full h-12 rounded-md border border-gray-300 bg-white text-sm text-gray-700 shadow-sm px-4"
            />
          </div>

          <div class="col-span-6 sm:col-span-3">
            <label for="FirstName" class="block text-sm font-medium text-gray-700">
              Bangsa
            </label>

            <input
              type="text"
              id="FirstName"
              name="first_name"
              class="mt-1 w-full h-12 rounded-md border border-gray-300 bg-white text-sm text-gray-700 shadow-sm px-4"
            />
          </div>

          <div class="col-span-6 sm:col-span-3">
            <label for="LastName" class="block text-sm font-medium text-gray-700">
              No. Telefon
            </label>

            <input
              type="text"
              id="LastName"
              name="last_name"
              class="mt-1 w-full h-12 rounded-md border border-gray-300 bg-white text-sm text-gray-700 shadow-sm px-4"
            />
          </div>

          <div class="col-span-6">
            <label for="Email" class="block text-sm font-medium text-gray-700"> E-Mel </label>

            <input
              type="email"
              id="Email"
              name="email"
              class="mt-1 w-full h-12 rounded-md border border-gray-300 bg-white text-sm text-gray-700 shadow-sm px-4"
            />
          </div>
          <div class="col-span-6 sm:col-span-3">
            <label for="LastName" class="block text-sm font-medium text-gray-700">
              ID Pengguna
            </label>

            <input
              type="text"
              id="LastName"
              name="last_name"
              class="mt-1 w-full h-12 rounded-md border border-gray-300 bg-white text-sm text-gray-700 shadow-sm px-4"
              readonly
            />
          </div>

          <div class="col-span-6 sm:col-span-3">
            <label for="Password" class="block text-sm font-medium text-gray-700"> Kata Laluan </label>

            <input
              type="password"
              id="Password"
              name="password"
              class="mt-1 w-full h-12 rounded-md border border-gray-300 bg-white text-sm text-gray-700 shadow-sm px-4"
            />
          </div>

          <div class="col-span-6 sm:col-span-3">
            <label for="PasswordConfirmation" class="block text-sm font-medium text-gray-700">
              Sahkan Kata Laluan
            </label>

            <input
              type="password"
              id="PasswordConfirmation"
              name="password_confirmation"
              class="mt-1 w-full h-12 rounded-md border border-gray-300 bg-white text-sm text-gray-700 shadow-sm px-4"
            />
          </div>

          <div class="col-span-6">
            <label for="MarketingAccept" class="flex gap-4">
              <input
                type="checkbox"
                id="MarketingAccept"
                name="marketing_accept"
                class="size-5 rounded-md border-gray-200 bg-white shadow-sm"
              />

              <span class="text-sm text-gray-700">
                Saya bersetuju bahawa telah membaca dan menerima Polisi Privasi & Perjanjian Pengguna
              </span>
            </label>
          </div>

          <!--- <div class="col-span-6">
            <p class="text-sm text-gray-500">
              By creating an account, you agree to our
              <a href="#" class="text-gray-700 underline"> terms and conditions </a>
              and
              <a href="#" class="text-gray-700 underline">privacy policy</a>.
            </p>
          </div> --->

          <div class="col-span-6 sm:flex sm:items-center sm:gap-4">
            <button
              class="inline-block shrink-0 rounded-md border border-blue-600 bg-blue-600 px-12 py-3 text-sm font-medium text-white transition hover:bg-transparent hover:text-blue-600 focus:outline-none focus:ring active:text-blue-500"
            >
              Daftar
            </button>

            <p class="mt-4 text-sm text-gray-500 sm:mt-0">
              Sudah Mempunyai Akaun?
              <a href="./index.cfm" class="text-gray-700 underline">Daftar Masuk</a>.
            </p>
          </div>
        </form>
      </div>
    </main>
  </div>
</section>
</body>
</html>