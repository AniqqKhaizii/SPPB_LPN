<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> <!-- Include jQuery -->
<script>
var logoutTimeout; 
var interval; 

function startLogoutTimer() {
    // Show modal after 2 seconds
    logoutTimeout = setTimeout(function() {
        console.log('TIMEOUT!');
        // Show modal using Tailwind's hidden class
        document.getElementById("exampleModal").classList.remove("hidden");
        startCountdown(30);  
    }, 7200000);
}

function startCountdown(duration) {
    var countdownTimer = duration;
    interval = setInterval(function() {
        var minutes = Math.floor(countdownTimer / 60);
        var seconds = countdownTimer % 60;

        seconds = seconds < 10 ? "0" + seconds : seconds;

        document.getElementById('countdown-timer').innerText = minutes + " Minit " + seconds + " Saat ";

        if (countdownTimer <= 0) {
            clearInterval(interval);
            window.location.href = '../Admin/logout.cfm';  
        }
        countdownTimer--;
    }, 1000);  
}

startLogoutTimer();

function resetTimer() {
    // Hide the modal
    document.getElementById("exampleModal").classList.add("hidden");

    clearTimeout(logoutTimeout);
    clearInterval(interval);

    startLogoutTimer();
}
</script>

<!--- <div class="modal hidden" id="exampleModal" tabindex="1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content bg-white rounded-lg shadow-lg">
      <div class="modal-header bg-blue-500 flex justify-center p-4">
        <h3 class="modal-title text-black text-left text-lg" id="exampleModalLabel">Sesi Anda Hampir Tamat!</h3>
      </div>
      <div class="modal-body mt-[-5px] p-4">
        <div class="flex justify-center items-center">
          <img width="60" height="60" src="https://img.icons8.com/papercut/60/time-machine.png" alt="time-machine"/>
        </div>
        <p class="text-center text-xl mt-4">
          Sesi anda hampir tamat kerana tidak aktif.
          <br>Baki Masa: <span id="countdown-timer" class="font-semibold">5 Minit 00 Saat</span>
        </p>
      </div>
      <div class="modal-footer flex justify-center p-4">
        <button type="button" class="btn btn-secondary bg-gray-300 hover:bg-gray-400 text-gray-800 font-semibold py-2 px-4 rounded" onclick="resetTimer()">Kembali</button>
        <a href="../Admin/logout.cfm">
          <button type="button" class="btn btn-primary bg-blue-500 hover:bg-blue-700 text-white font-semibold py-2 px-4 rounded" id="popup-yes">Log Keluar</button>
        </a>
      </div>
    </div>
  </div>
</div> --->

<div id="exampleModal" tabindex="-1" aria-hidden="true" class="hidden overflow-y-auto overflow-x-hidden fixed z-50 justify-center items-center w-1/3 mx-auto my-auto md:inset-0 h-[calc(100%-1rem)] max-h-full">
    <div class="modal-dialog" role="document">
    <div class="modal-content bg-white rounded-lg shadow-lg">
      <div class="modal-header bg-[url('./assets/Background.jpg')] bg-cover bg-center flex justify-center p-4 rounded-lg">
        <h3 class="modal-title text-black text-left text-lg" id="exampleModalLabel">Sesi Anda Hampir Tamat!</h3>
      </div>
      <div class="modal-body mt-[-5px] p-4 bg-gray-100">
        <div class="flex justify-center items-center">
          <img width="60" height="60" src="https://img.icons8.com/papercut/60/time-machine.png" alt="time-machine"/>
        </div>
        <p class="text-center text-xl mt-4">
          Sesi anda hampir tamat kerana tidak aktif.
          <br>Baki Masa: <span id="countdown-timer" class="font-semibold">5 Minit 00 Saat</span>
        </p>
      </div>
      <div class="modal-footer flex justify-center p-4 bg-gray-100 rounded-lg">
        <button type="button" class="btn btn-secondary bg-gray-300 hover:bg-gray-400 text-gray-800 font-semibold py-2 px-4 rounded" onclick="resetTimer()">Kembali</button>
        <a href="../Admin/logout.cfm">
          <button type="button" class="btn btn-primary bg-blue-500 hover:bg-blue-700 text-white font-semibold py-2 px-4 rounded" id="popup-yes">Log Keluar</button>
        </a>
      </div>
    </div>
  </div>
</div>