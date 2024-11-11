<!doctype html>
<html>
<cfinclude template="./templates/head.cfm">
<body>
<section class="bg-gradient-to-b from-[#f0f0f0] to-[#f8f8f8]">
    <main
      class="flex items-center justify-center px-8 py-8 sm:px-12 lg:px-16 lg:py-12 bg-gray-300"
    >
      <div class="mx-auto my-auto max-w-screen px-4 py-20 sm:px-6 lg:px-8">
        <div class="mx-auto my-auto max-w-screenxl">
          <h1 class="text-center text-2xl font-semibold text-gray-600 sm:text-3xl">SELAMAT DATANG</h1>
          <p class="mx-auto mb-2 max-w-md text-center text-gray-500">
            Log Masuk Anggota LPM
          </p>
          <hr class="mx-auto w-1/4 mb-2 h-1 bg-indigo-600 rounded-full" />

          <!-- Updated form action and method -->
          <form action="login.cfm" method="post" class="flex flex-col justify-around bg-transparent mb-0 mt-6 space-y-8 rounded-md p-12 sm:p-6 lg:p-12">

            <div>
              <label for="username" class="sr-only">ID Pengguna</label>
              <div class="relative">
                <input
                  type="text"
                  class="w-full rounded-md border-gray-200 p-4 pe-24 me-40 text-sm shadow-lg"
                  placeholder="ID Pengguna"
                  name="getUsername"
                  required
                />
                <span class="absolute inset-y-0 end-0 grid place-content-center px-4 border-l border-gray-300">
                  <img width="24" height="24" src="https://img.icons8.com/pastel-glyph/24/737373/person-male--v3.png" alt="person-male--v3"/>
                </span>
              </div>
            </div>

            <div>
              <label for="password" class="sr-only">Kata Laluan</label>
              <div class="relative">
                <input
                  type="password"
                  class="w-full rounded-md border-gray-200 p-4 pe-24 me-40 text-sm shadow-lg"
                  placeholder="Kata Laluan"
                  name="getPassword"
                  required
                />
                <span class="absolute inset-y-0 end-0 grid place-content-center px-4 border-l border-gray-300">
                  <svg
                    xmlns="http://www.w3.org/2000/svg"
                    class="size-6 text-gray-400"
                    fill="none"
                    viewBox="0 0 24 24"
                    stroke="currentColor"
                  >
                    <path
                      stroke-linecap="round"
                      stroke-linejoin="round"
                      stroke-width="2"
                      d="M15 12a3 3 0 11-6 0 3 3 0 016 0z"
                    />
                    <path
                      stroke-linecap="round"
                      stroke-linejoin="round"
                      stroke-width="2"
                      d="M2.458 12C3.732 7.943 7.523 5 12 5c4.478 0 8.268 2.943 9.542 7-1.274 4.057-5.064 7-9.542 7-4.477 0-8.268-2.943-9.542-7z"
                    />
                  </svg>
                </span>
              </div>
            </div>

            <button
              name="verify"
              type="submit"
              class="block mx-auto w-1/2 rounded-full bg-indigo-600 px-5 py-3 text-sm font-medium text-white"
            >
              Log Masuk
            </button>
          </form>
        </div>
      </div>
    </main>
</section>
</body>
</html>
