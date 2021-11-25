defmodule TwitterWeb.TwitterLive.Sign do
  use TwitterWeb, :live_view

  def mount(_params, _session, socket) do
    socket =
      socket
      |> assign(:sign_type, "signup")
      |> assign(:use_phone, false)
      |> assign(:sign_form_opened, true)

    {:ok, socket}
  end

  def handle_event("update_temp", %{"key" => "Escape"}, socket) do
    socket =
      socket
      |> update(:sign_form_opened, &(&1 = false))

    IO.inspect(socket)

    {:noreply, socket}
  end

  def handle_event("toggle_use_phone", _params, socket) do
    socket =
      socket
      |> update(:use_phone, &(!&1))

    {:noreply, socket}
  end

  def handle_event("sign", %{"sign-type" => sign_type}, socket) do
    socket =
      socket
      |> update(:sign_type, &(&1 = sign_type))
      |> update(:sign_form_opened, &(&1 = true))

    IO.inspect(socket.assigns)

    {:noreply, socket}
  end

  def handle_event("close", _params, socket) do
    socket =
      socket
      |> update(:sign_form_opened, &(&1 = false))

    {:noreply, socket}
  end

  def render(assigns) do
    ~H"""
    <div class="w-screen h-screen
        flex
        bg-black
        text-[#d9d9d9]">

        <%=
          if @sign_form_opened do
            case @sign_type do
              "login" ->
          live_component(TwitterWeb.TwitterLive.LoginFormComponent)
                "signup" ->
          live_component(TwitterWeb.TwitterLive.SignupFormComponent,
                  use_phone: @use_phone
          )
            end
          end
        %>


      <div class="md:w-5/12 2xl:w-7/12 relative">
        <div class="absolute
        flex
        w-full
        h-full
        justify-center
        items-center">
          <svg height="350" fill="white" viewBox="0 0 24 24" aria-hidden="true">
            <g>
              <path
                d="M23.643 4.937c-.835.37-1.732.62-2.675.733.962-.576 1.7-1.49 2.048-2.578-.9.534-1.897.922-2.958 1.13-.85-.904-2.06-1.47-3.4-1.47-2.572 0-4.658 2.086-4.658 4.66 0 .364.042.718.12 1.06-3.873-.195-7.304-2.05-9.602-4.868-.4.69-.63 1.49-.63 2.342 0 1.616.823 3.043 2.072 3.878-.764-.025-1.482-.234-2.11-.583v.06c0 2.257 1.605 4.14 3.737 4.568-.392.106-.803.162-1.227.162-.3 0-.593-.028-.877-.082.593 1.85 2.313 3.198 4.352 3.234-1.595 1.25-3.604 1.995-5.786 1.995-.376 0-.747-.022-1.112-.065 2.062 1.323 4.51 2.093 7.14 2.093 8.57 0 13.255-7.098 13.255-13.254 0-.2-.005-.402-.014-.602.91-.658 1.7-1.477 2.323-2.41z">
              </path>
            </g>
          </svg>
        </div>
        <img class="h-full object-cover" src="/images/lohp_1302x955.png" alt="Twitter Banner" />
      </div>
      <div class="md:w-6/12 2xl:w-6/12 relative p-10">
        <div class="mb-14">
          <svg height="40" fill="white" viewBox="0 0 24 24" aria-hidden="true">
            <g>
              <path
                d="M23.643 4.937c-.835.37-1.732.62-2.675.733.962-.576 1.7-1.49 2.048-2.578-.9.534-1.897.922-2.958 1.13-.85-.904-2.06-1.47-3.4-1.47-2.572 0-4.658 2.086-4.658 4.66 0 .364.042.718.12 1.06-3.873-.195-7.304-2.05-9.602-4.868-.4.69-.63 1.49-.63 2.342 0 1.616.823 3.043 2.072 3.878-.764-.025-1.482-.234-2.11-.583v.06c0 2.257 1.605 4.14 3.737 4.568-.392.106-.803.162-1.227.162-.3 0-.593-.028-.877-.082.593 1.85 2.313 3.198 4.352 3.234-1.595 1.25-3.604 1.995-5.786 1.995-.376 0-.747-.022-1.112-.065 2.062 1.323 4.51 2.093 7.14 2.093 8.57 0 13.255-7.098 13.255-13.254 0-.2-.005-.402-.014-.602.91-.658 1.7-1.477 2.323-2.41z">
              </path>
            </g>
          </svg>
        </div>
        <h1 class="text-7xl w-9/12 font-semibold mb-5">Ça se passe maintenant</h1>
        <h2 class="text-4xl font-semibold mb-5">Rejoignez Twitter dès aujourd'hui</h2>

        <div class="flex flex-col justify-center w-[250px] mb-10">

          <button
            class="border-[1px] border-white mb-2 w-full h-[35px] bg-white hover:bg-blue-500 transition-all duration-200 ease-out hover:text-white text-black text-sm font-semibold py-2 px-4 rounded-full flex items-center space-x-4">
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
              S'inscrire avec Google
            </span>
          </button>

          <button
            class="hover:border-white hover:border-2 border-[1px] border-black mb-2 w-full h-[35px] bg-white hover:bg-black transition-all duration-200 ease-out hover:shadow-md  hover:text-white text-black text-sm font-semibold py-2 px-4 rounded-full flex items-center space-x-4">
            <i class="fab fa-apple text-2xl"></i>
            <span>
              S'inscrire avec Apple
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
          <button
            phx-click="sign"
            phx-value-sign-type="signup"
            class="mb-2 w-full h-[35px] bg-blue-500 hover:bg-blue-700 transition-all duration-200 ease-out hover:shadow-md text-white text-sm font-semibold py-2 px-4 rounded-full flex items-center space-x-4">
            <span>
              S'inscrire avec un numéro de...
            </span>
          </button>
          <p class="mb-10 text-gray-500 text-[0.6rem]">En vous inscrivant, vous acceptez les <span
              class="text-blue-400 hover:underline cursor-pointer">Conditions
              d'Utilisation</span> et la
            <span class="text-blue-400 hover:underline cursor-pointer">Politique de
              Confidentialité</span>, incluant l' <span class="text-blue-400 hover:underline cursor-pointer">Utilisation de
              Cookies</span>.
          </p>


          <h3 class="text-md font-semibold mb-5">Vous avez déjà un compte ?</h3>
          <button
            phx-click="sign"
            phx-value-sign-type="login"
            class="justify-center mb-2 w-full h-[35px] bg-black border-[1px] border-blue-400 hover:bg-blue-500 transition-all duration-200 ease-out hover:shadow-md text-white text-sm font-semibold py-2 px-4 rounded-full flex items-center space-x-4">
            <span>
              Se connecter
            </span>
          </button>

        </div>
      </div>
    </div>



    """
  end
end
