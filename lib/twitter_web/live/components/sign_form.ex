defmodule TwitterWeb.TwitterLive.LoginFormComponent do
use Phoenix.LiveComponent

def render(assigns) do
~H"""

<div class="h-screen w-screen
            absolute top-0 left-0
            bg-[#2c2c2c7c]
            z-10
            flex
            justify-center
            items-center
            ">

  <div class="w-5/12 h-[650px] bg-black rounded-2xl p-5">
    <div phx-click="close"
      class="absolute hover:bg-gray-800 cursor-pointer h-[30px] w-[30px]  rounded-full flex justify-center items-center">
      <i class="fas fa-times text-sm"></i>
    </div>

    <div class="w-full flex justify-center">
      <svg height="24" fill="white" viewBox="0 0 24 24" aria-hidden="true">
        <g>
          <path
            d="M23.643 4.937c-.835.37-1.732.62-2.675.733.962-.576 1.7-1.49 2.048-2.578-.9.534-1.897.922-2.958 1.13-.85-.904-2.06-1.47-3.4-1.47-2.572 0-4.658 2.086-4.658 4.66 0 .364.042.718.12 1.06-3.873-.195-7.304-2.05-9.602-4.868-.4.69-.63 1.49-.63 2.342 0 1.616.823 3.043 2.072 3.878-.764-.025-1.482-.234-2.11-.583v.06c0 2.257 1.605 4.14 3.737 4.568-.392.106-.803.162-1.227.162-.3 0-.593-.028-.877-.082.593 1.85 2.313 3.198 4.352 3.234-1.595 1.25-3.604 1.995-5.786 1.995-.376 0-.747-.022-1.112-.065 2.062 1.323 4.51 2.093 7.14 2.093 8.57 0 13.255-7.098 13.255-13.254 0-.2-.005-.402-.014-.602.91-.658 1.7-1.477 2.323-2.41z">
          </path>
        </g>
      </svg>
    </div>

    <h3 class="text-center text-xl font-bold mt-4 mb-10">Connectez-vous à Twitter</h3>

    <div class="mx-auto flex flex-col justify-center w-[300px] mb-10">

      <button
        class="border-[1px] justify-center border-white mb-5 w-full h-[35px] bg-white hover:bg-blue-500 transition-all duration-200 ease-out hover:text-white text-black text-sm font-semibold py-2 px-4 rounded-full flex items-center space-x-4">
        <svg viewBox="0 0 24 24" width="24" height="24" xmlns="http://www.w3.org/2000/svg">
          <g transform="matrix(1, 0, 0, 1, 27.009001, -39.238998)">
            <path fill="#4285F4"
              d="M -3.264 51.509 C -3.264 50.719 -3.334 49.969 -3.454 49.239 L -14.754 49.239 L -14.754 53.749 L -8.284 53.749 C -8.574 55.229 -9.424 56.479 -10.684 57.329 L -10.684 60.329 L -6.824 60.329 C -4.564 58.239 -3.264 55.159 -3.264 51.509 Z" />
            <path fill="#34A853"
              d="M -14.754 63.239 C -11.514 63.239 -8.804 62.159 -6.824 60.329 L -10.684 57.329 C -11.764 58.049 -13.134 58.489 -14.754 58.489 C -17.884 58.489 -20.534 56.379 -21.484 53.529 L -25.464 53.529 L -25.464 56.619 C -23.494 60.539 -19.444 63.239 -14.754 63.239 Z" />
            <path fill="#FBBC05"
              d="M -21.484 53.529 C -21.734 52.809 -21.864 52.039 -21.864 51.239 C -21.864 50.439 -21.724 49.669 -21.484 48.949 L -21.484 45.859 L -25.464 45.859 C -26.284 47.479 -26.754 49.299 -26.754 51.239 C -26.754 53.179 -26.284 54.999 -25.464 56.619 L -21.484 53.529 Z" />
            <path fill="#EA4335"
              d="M -14.754 43.989 C -12.984 43.989 -11.404 44.599 -10.154 45.789 L -6.734 42.369 C -8.804 40.429 -11.514 39.239 -14.754 39.239 C -19.444 39.239 -23.494 41.939 -25.464 45.859 L -21.484 48.949 C -20.534 46.099 -17.884 43.989 -14.754 43.989 Z" />
          </g>
        </svg>
        <span>
          Se connecter avec Google
        </span>
      </button>

      <button
        class="hover:border-white justify-center hover:border-2 border-[1px] border-black mb-5 w-full h-[35px] bg-white hover:bg-black transition-all duration-200 ease-out hover:shadow-md  hover:text-white text-black text-sm font-semibold py-2 px-4 rounded-full flex items-center space-x-4">
        <i class="fab fa-apple text-2xl"></i>
        <span>
          Se connecter avec Apple
        </span>
      </button>

      <div class="
                    w-full
                    text-center
                    text-xs
                    border-b-[1px]
                    border-solid
                    border-gray-200
                    leading-[0.1em]
                    mt-2.5 mb-5
                    ">
        <span class="bg-black text-gray-400 px-2.5">ou</span>
      </div>

      <input type="text" class="border-gray-600 bg-black border-[1px] mb-5 text-sm px-2 py-3"
        placeholder="Numéro de téléphone, addresse email...">


      <button phx-click="next_step" phx-value-step="1"
        class="justify-center mb-2 w-full h-[35px] bg-white border-[1px]  transition-all duration-200 ease-out hover:shadow-md text-black text-sm font-semibold py-2 px-4 rounded-full flex items-center space-x-4">
        <span>
          Suivant
        </span>
      </button>

      <button phx-click="forgot_password"
        class="justify-center mb-2 w-full h-[35px] bg-black border-[1px] border-white  transition-all duration-200 ease-out hover:shadow-md text-white text-sm font-semibold py-2 px-4 rounded-full flex items-center space-x-4">
        <span>
          Mot de passe oublié ?
        </span>
      </button>

      <p class="my-10 text-gray-500 text-[0.8rem]">Vous n'avez pas de compte ? <span
          class="text-blue-400 hover:underline cursor-pointer">Inscrivez-nous</span>.
      </p>

    </div>

  </div>

</div>

"""
end
end

defmodule TwitterWeb.TwitterLive.SignupFormComponent do
use Phoenix.LiveComponent

def render(assigns) do
~H"""

<div class="h-screen w-screen
            absolute top-0 left-0
            bg-[#2c2c2c7c]
            z-10
            flex
            justify-center
            items-center
            ">

  <div class="w-5/12 h-[650px] bg-black rounded-2xl p-5">
    <div phx-click="close"
      class="absolute hover:bg-gray-800 cursor-pointer h-[30px] w-[30px]  rounded-full flex justify-center items-center">
      <i class="fas fa-times text-sm"></i>
    </div>

    <div class="w-full flex justify-center">
      <svg height="24" fill="white" viewBox="0 0 24 24" aria-hidden="true">
        <g>
          <path
            d="M23.643 4.937c-.835.37-1.732.62-2.675.733.962-.576 1.7-1.49 2.048-2.578-.9.534-1.897.922-2.958 1.13-.85-.904-2.06-1.47-3.4-1.47-2.572 0-4.658 2.086-4.658 4.66 0 .364.042.718.12 1.06-3.873-.195-7.304-2.05-9.602-4.868-.4.69-.63 1.49-.63 2.342 0 1.616.823 3.043 2.072 3.878-.764-.025-1.482-.234-2.11-.583v.06c0 2.257 1.605 4.14 3.737 4.568-.392.106-.803.162-1.227.162-.3 0-.593-.028-.877-.082.593 1.85 2.313 3.198 4.352 3.234-1.595 1.25-3.604 1.995-5.786 1.995-.376 0-.747-.022-1.112-.065 2.062 1.323 4.51 2.093 7.14 2.093 8.57 0 13.255-7.098 13.255-13.254 0-.2-.005-.402-.014-.602.91-.658 1.7-1.477 2.323-2.41z">
          </path>
        </g>
      </svg>
    </div>

    <h3 class="px-3 text-2xl font-bold mt-4 mb-10">Créer votre compte</h3>

    <form action="#" class="flex flex-col space-y-6">
      <div class="flex flex-col">
        <input name="names" class="bg-black border-[1px] p-3 rounded-md border-gray-500 placeholder-gray-500"
          type="text" placeholder="Nom et prénom">
      </div>



      <div class="group" phx-click="toggle_use_phone">
        <%= if @use_phone do %>
        <div class="flex flex-col ">
          <input name="phone" class="bg-black border-[1px] p-3 rounded-md border-gray-500 placeholder-gray-500"
            type="text" placeholder="Téléphone">
        </div>
        <p class="px-3 py-6 text-blue-500 text-sm group-hover:underline cursor-pointer">Utiliser un email</p>
        <% else %>
        <div class="flex flex-col ">
          <input name="email" class="bg-black border-[1px] p-3 rounded-md border-gray-500 placeholder-gray-500"
            type="text" placeholder="Email">
        </div>
        <p class="px-3 py-6 text-blue-500 text-sm group-hover:underline cursor-pointer">Utiliser un téléphone</p>
        <% end %>
      </div>

      <div class="flex flex-col px-3">
        <h3 class="font-semibold">Date de naissance</h3>
        <p class="text-gray-500 text-sm ">Cette information ne sera pas affichée publiquement. Confirmez votre âge,
          même
          si ce
          compte est pour une
          entreprise, un animal de compagnie ou autre chose.</p>
      </div>

      <div class="flex items-center space-x-3 pb-16">
        <select class="w-6/12 bg-black border-gray-500 rounded-md px-5 py-3 border-[1px]" name="month" id="month">
          <option selected disabled>Mois</option>
          <option value="jan">Janvier</option>
          <option value="feb">Février</option>
          <option value="mar">Mars</option>
          <option value="apr">Avril</option>
          <option value="may">Mai</option>
          <option value="jun">Juin</option>
          <option value="jul">Juillet</option>
          <option value="aug">Août</option>
          <option value="sep">Septempbre</option>
          <option value="oct">Octobre</option>
          <option value="nov">Novembre</option>
          <option value="dec">Décembre</option>
        </select>

        <select class="w-3/12 bg-black border-gray-500 rounded-md px-5 py-3 border-[1px]" name="month" id="month">
          <option selected disabled>Jour</option>
          <option value="01">01</option>
          <option value="02">02</option>
          <option value="03">03</option>
          <option value="04">04</option>
          <option value="05">05</option>
          <option value="06">06</option>
          <option value="07">07</option>
          <option value="08">08</option>
          <option value="09">09</option>
          <option value="10">10</option>
          <option value="11">11</option>
          <option value="12">12</option>
          <option value="13">13</option>
          <option value="14">14</option>
          <option value="15">15</option>
          <option value="16">16</option>
          <option value="17">17</option>
          <option value="18">18</option>
          <option value="19">19</option>
          <option value="20">20</option>
          <option value="21">21</option>
          <option value="22">22</option>
          <option value="23">23</option>
          <option value="24">24</option>
          <option value="25">25</option>
          <option value="26">26</option>
          <option value="27">27</option>
          <option value="28">28</option>
          <option value="29">29</option>
          <option value="30">30</option>
          <option value="31">31</option>
        </select>

        <select class="w-3/12 bg-black border-gray-500 rounded-md px-5 py-3 border-[1px]" name="month" id="month">
          <option selected disabled>Année</option>
          <option value="1940">1940</option>
          <option value="1941">1941</option>
          <option value="1942">1942</option>
          <option value="1943">1943</option>
          <option value="1944">1944</option>
          <option value="1945">1945</option>
          <option value="1946">1946</option>
          <option value="1947">1947</option>
          <option value="1948">1948</option>
          <option value="1949">1949</option>
          <option value="1950">1950</option>
          <option value="1951">1951</option>
          <option value="1952">1952</option>
          <option value="1953">1953</option>
          <option value="1954">1954</option>
          <option value="1955">1955</option>
          <option value="1956">1956</option>
          <option value="1957">1957</option>
          <option value="1958">1958</option>
          <option value="1959">1959</option>
          <option value="1960">1960</option>
          <option value="1961">1961</option>
          <option value="1962">1962</option>
          <option value="1963">1963</option>
          <option value="1964">1964</option>
          <option value="1965">1965</option>
          <option value="1966">1966</option>
          <option value="1967">1967</option>
          <option value="1968">1968</option>
          <option value="1969">1969</option>
          <option value="1970">1970</option>
          <option value="1971">1971</option>
          <option value="1972">1972</option>
          <option value="1973">1973</option>
          <option value="1974">1974</option>
          <option value="1975">1975</option>
          <option value="1976">1976</option>
          <option value="1977">1977</option>
          <option value="1978">1978</option>
          <option value="1979">1979</option>
          <option value="1980">1980</option>
          <option value="1981">1981</option>
          <option value="1982">1982</option>
          <option value="1983">1983</option>
          <option value="1984">1984</option>
          <option value="1985">1985</option>
          <option value="1986">1986</option>
          <option value="1987">1987</option>
          <option value="1988">1988</option>
          <option value="1989">1989</option>
          <option value="1990">1990</option>
          <option value="1991">1991</option>
          <option value="1992">1992</option>
          <option value="1993">1993</option>
          <option value="1994">1994</option>
          <option value="1995">1995</option>
          <option value="1996">1996</option>
          <option value="1997">1997</option>
          <option value="1998">1998</option>
          <option value="1999">1999</option>
          <option value="2000">2000</option>
          <option value="2001">2001</option>
          <option value="2002">2002</option>
          <option value="2003">2003</option>
          <option value="2004">2004</option>
          <option value="2005">2005</option>
          <option value="2006">2006</option>
          <option value="2007">2007</option>
          <option value="2008">2008</option>
          <option value="2009">2009</option>
          <option value="2010">2010</option>
          <option value="2011">2011</option>
          <option value="2012">2012</option>
          <option value="2013">2013</option>
          <option value="2014">2014</option>
          <option value="2015">2015</option>
          <option value="2016">2016</option>
          <option value="2017">2017</option>
          <option value="2018">2018</option>
          <option value="2019">2019</option>
          <option value="2020">2020</option>
          <option value="2021">2021</option>
        </select>

      </div>

      <button class="w-full rounded-3xl bg-gray-500 py-2 px-4" disabled>Suivant</button>

    </form>


  </div>

</div>

"""
end
end