<!doctype html>
<html>

<cfinclude template="../includes/head.cfm">
<body>
<section class="bg-gradient-to-b from-[#f0f0f0] to-[#f8f8f8] overflow-hidden">
  <div class="lg:grid lg:min-h-screen lg:grid-cols-12">
    <section class="relative w-full lg:h-screen xl:h-screen sm:h-[20vh] xs:h-[20vh] md:h-[20vh] bg-[#f8f8f8] sm:h-[30vh] md:col-span-12 lg:col-span-5 xl:col-span-6">
      <div class="swiper progress-slide-carousel swiper-container">
      <div class="swiper-wrapper">
       <div class="swiper-slide">
         <div class="bg-gradient-to-b from-zinc-300 to-[#f8f8f8] lg:h-screen xl:h-screen sm:h-[20vh] xs:h-[20vh] md:h-[30vh] flex justify-center items-center">
            <img src="../../public/assets/LoginPemaju1.jpg" class="w-full h-full object-cover" alt="Image 1">
         </div>
       </div>
       <div class="swiper-slide">
         <div class="bg-gradient-to-b from-zinc-300 to-[#f8f8f8] lg:h-screen xl:h-screen sm:h-[20vh] xs:h-[20vh] md:h-[30vh] flex justify-center items-center">
            <img src="../../public/assets/LoginPemaju2.jpg" class="w-full h-full object-cover" alt="Image 1">
         </div>
       </div>
       <div class="swiper-slide">
         <div class="bg-gradient-to-b from-zinc-300 to-[#f8f8f8] lg:h-screen xl:h-screen sm:h-[20vh] xs:h-[20vh] md:h-[30vh] flex justify-center items-center">
            <img src="../../public/assets/LoginPemaju3.jpg" class="w-full h-full object-cover" alt="Image 1">
         </div>
       </div>
      </div>
      <div class="swiper-pagination"></div>
      </div>
    </section>

    <main
      class="flex flex-col items-start justify-center py-2 sm:px-12 h-screen md:col-span-12 lg:col-span-7 lg:py-2 xl:col-span-6 bg-gradient-to-b from-[#1e0542] via-purple-800 to-[#71094f]"
    >
      <!--- <div class="flex items-center">
            <img alt="" src="../../public/assets/SPPB_NoText.png" height="75" width="75"/>
            <h2 class="m-6 sm:text-xl font-semibold text-white text-left lg:text-3xl uppercase">
                  Sistem Pengurusan Perumahan Bersepadu
              </h2>
      </div> --->
      <div class="mx-auto my-auto max-w-screen px-4 py-12 sm:px-6 lg:px-8">
        <div class="flex flex-col mx-auto my-auto max-w-screen-xl justify-center items-start">
          
          <h1 class="text-left font-semibold text-gray-200 sm:text-3xl text-xl ">Selamat Datang ke SPPB</h1>

          <p class="mb-2 max-w-md text-left text-gray-300 sm:text-lg text-md ">
            Log Masuk Pemaju
          </p>
          <hr class="w-1/4 mb-2 h-1 bg-gradient-to-r from-transparent via-indigo-600 to-transparent" />
          <form id="loginForm" action="" class="flex flex-col justify-around bg-transparent mb-0 mt-6 space-y-6">
              <!-- Username Field -->
              <div>
                <label for="username" class="sr-only">Nama Pemaju</label>
                <div class="relative">
                  <input
                    id="username"
                    type="text"
                    class="w-full rounded-md border-gray-200 p-4 pe-24 me-40 text-sm shadow-lg"
                    placeholder="Nama Pengguna"
                  />
                  <span class="absolute inset-y-0 end-0 grid place-content-center px-4 border-l border-gray-300">
                    <img
                      width="24"
                      height="24"
                      src="https://img.icons8.com/pastel-glyph/24/737373/person-male--v3.png"
                      alt="person-icon"
                    />
                  </span>
                </div>
              </div>

              <!-- Password Field -->
              <div>
                <label for="password" class="sr-only">Kata Laluan</label>
                <div class="relative">
                  <input
                    id="password"
                    type="password"
                    class="w-full rounded-md border-gray-200 p-4 pe-24 me-40 text-sm shadow-lg"
                    placeholder="Kata Laluan"
                  />
                  <span class="absolute inset-y-0 end-0 grid place-content-center px-4 border-l border-gray-300">
                    <svg
                      xmlns="http://www.w3.org/2000/svg"
                      class="size-6 text-gray-400"
                      fill="none"
                      viewBox="0 0 24 24"
                      stroke="currentColor"
                    >
                      <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 12a3 3 0 11-6 0 3 3 0 016 0z" />
                      <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                        d="M2.458 12C3.732 7.943 7.523 5 12 5c4.478 0 8.268 2.943 9.542 7-1.274 4.057-5.064 7-9.542 7-4.477 0-8.268-2.943-9.542-7z" />
                    </svg>
                  </span>
                </div>
              </div>

              <!-- Remember Me Checkbox -->
              <div class="flex items-center">
                <input
                  id="rememberMe"
                  type="checkbox"
                  class="h-4 w-4 text-white  border-gray-300 rounded"
                />
                <label for="rememberMe" class="ml-2 block text-sm text-gray-200">
                  Ingat Maklumat
                </label>
              </div>

              

              <!-- Register Link -->
              <div class="flex flex-row justify-center items-center w-full text-center text-sm text-gray-500 gap-2">
                <!-- Submit Button -->
              <button
                type="submit"
                class="block mx-auto w-full rounded-lg bg-pink-600 hover:bg-pink-700 px-3 py-3 text-sm font-medium text-white shadow-lg"
              >
                Log Masuk
              </button>
                <a
                  class="ml-auto w-full rounded-lg bg-indigo-600 px-10 py-3 text-sm font-medium text-white shadow-lg hover:bg-indigo-700"
                  href="./daftar_pemaju.cfm"
                >
                  Daftar
                </a>
              </div>
          </form>
        </div>
      </div>

    </main>
  </div>
</section>
</body>
</html>
<!-- JavaScript to Handle Remember Me -->
<script>
  // Check if Remember Me is already selected
  document.addEventListener("DOMContentLoaded", () => {
    const rememberMeCheckbox = document.getElementById("rememberMe");
    const usernameInput = document.getElementById("username");

    // Load saved username if "Remember Me" was checked
    const savedUsername = localStorage.getItem("username");
    const rememberMe = localStorage.getItem("rememberMe") === "true";

    if (rememberMe && savedUsername) {
      usernameInput.value = savedUsername;
      rememberMeCheckbox.checked = true;
    }

    // Save or remove the username when the form is submitted
    document.getElementById("loginForm").addEventListener("submit", () => {
      if (rememberMeCheckbox.checked) {
        localStorage.setItem("username", usernameInput.value);
        localStorage.setItem("rememberMe", "true");
      } else {
        localStorage.removeItem("username");
        localStorage.setItem("rememberMe", "false");
      }
    });
  });


  var swiper = new Swiper(".progress-slide-carousel", {
      loop: true,
      fraction: true,
      autoplay: {
        delay: 8000,
        disableOnInteraction: false,
      },
      pagination: {
        el: ".progress-slide-carousel .swiper-pagination",
        type: "progressbar",
      },
      });
</script>

