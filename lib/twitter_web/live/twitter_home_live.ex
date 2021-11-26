defmodule TwitterWeb.TwitterLive.Home do
use TwitterWeb, :live_view

alias Twitter.Accounts

def mount(_params, session, socket) do
user = Accounts.get_user_by_session_token(session["user_token"])
IO.inspect(user)

socket =
socket
|> assign(:handle, user.handle)
|> assign(:name, user.name)
|> assign(:email, user.email)
|> assign(:bio, user.bio)
|> assign(:pfp_path, user.profile_picture_path)
|> assign(:banner_path, user.banner_path)
|> assign(:location, user.location)
|> assign(:tweets_cnt, user.tweets_cnt)
|> assign(:liked_tweets_cnt, user.liked_tweets_cnt)
|> assign(:followers_cnt, user.followers_cnt)
|> assign(:following_cnt, user.following_cnt)
|> assign(:edit_profile_opened, false)

{:ok, socket}
end

def handle_event("open_edit_profile", _params, socket) do
{:noreply, update(socket, :edit_profile_opened, &(&1 = true))}
end

def handle_event("close_edit_profile", _params, socket) do
{:noreply, update(socket, :edit_profile_opened, &(&1 = false))}
end

def render(assigns) do
~H"""

<%=
      if @edit_profile_opened do
        live_component(TwitterWeb.TwitterLive.EditProfileComponent,
        name: @name,
        bio: @bio,
        location: @location,
        banner_path: @banner_path,
      pfp_path: @pfp_path)
      end
    %>

<div class="h-screen w-screen flex grid-flow-col">
  <div id="menu" class="sticky h-screen border-r-[1px] border-gray-100
         w-3/12 pl-32 ">
    <div class="py-5  flex flex-col items-start space-y-2">
      <div
        class="mx-1 h-10 w-10 flex justify-center items-center cursor-pointer transition-all duration-200 ease-out rounded-full hover:bg-[#cdeaff]">
        <svg height="28" fill="#1D9BF0" viewBox="0 0 24 24" aria-hidden="true">
          <g>
            <path
              d="M23.643 4.937c-.835.37-1.732.62-2.675.733.962-.576 1.7-1.49 2.048-2.578-.9.534-1.897.922-2.958 1.13-.85-.904-2.06-1.47-3.4-1.47-2.572 0-4.658 2.086-4.658 4.66 0 .364.042.718.12 1.06-3.873-.195-7.304-2.05-9.602-4.868-.4.69-.63 1.49-.63 2.342 0 1.616.823 3.043 2.072 3.878-.764-.025-1.482-.234-2.11-.583v.06c0 2.257 1.605 4.14 3.737 4.568-.392.106-.803.162-1.227.162-.3 0-.593-.028-.877-.082.593 1.85 2.313 3.198 4.352 3.234-1.595 1.25-3.604 1.995-5.786 1.995-.376 0-.747-.022-1.112-.065 2.062 1.323 4.51 2.093 7.14 2.093 8.57 0 13.255-7.098 13.255-13.254 0-.2-.005-.402-.014-.602.91-.658 1.7-1.477 2.323-2.41z">
            </path>
          </g>
        </svg>
      </div>
      <div
        class="flex items-center w-auto py-2 px-3 rounded-3xl cursor-pointer hover:bg-gray-200 transition-all duration-300 ease-out">
        <!-- FILLED <svg height="28" fill="white" viewBox="0 0 24 24" aria-hidden="true"
               class="r-18jsvk2 r-4qtqp9 r-yyyyoo r-lwhw9o r-dnmrzs r-bnwqim r-1plcrui r-lrvibr">
               <g>
                 <path
                   d="M22.58 7.35L12.475 1.897c-.297-.16-.654-.16-.95 0L1.425 7.35c-.486.264-.667.87-.405 1.356.18.335.525.525.88.525.16 0 .324-.038.475-.12l.734-.396 1.59 11.25c.216 1.214 1.31 2.062 2.66 2.062h9.282c1.35 0 2.444-.848 2.662-2.088l1.588-11.225.737.398c.485.263 1.092.082 1.354-.404.263-.486.08-1.093-.404-1.355zM12 15.435c-1.795 0-3.25-1.455-3.25-3.25s1.455-3.25 3.25-3.25 3.25 1.455 3.25 3.25-1.455 3.25-3.25 3.25z">
                 </path>
               </g>
               </svg> -->
        <svg class="mr-4" height="28" viewBox="0 0 24 24" aria-hidden="true"
          class="r-18jsvk2 r-4qtqp9 r-yyyyoo r-lwhw9o r-dnmrzs r-bnwqim r-1plcrui r-lrvibr">
          <g>
            <path
              d="M22.46 7.57L12.357 2.115c-.223-.12-.49-.12-.713 0L1.543 7.57c-.364.197-.5.652-.303 1.017.135.25.394.393.66.393.12 0 .243-.03.356-.09l.815-.44L4.7 19.963c.214 1.215 1.308 2.062 2.658 2.062h9.282c1.352 0 2.445-.848 2.663-2.087l1.626-11.49.818.442c.364.193.82.06 1.017-.304.196-.363.06-.818-.304-1.016zm-4.638 12.133c-.107.606-.703.822-1.18.822H7.36c-.48 0-1.075-.216-1.178-.798L4.48 7.69 12 3.628l7.522 4.06-1.7 12.015z">
            </path>
            <path
              d="M8.22 12.184c0 2.084 1.695 3.78 3.78 3.78s3.78-1.696 3.78-3.78-1.695-3.78-3.78-3.78-3.78 1.696-3.78 3.78zm6.06 0c0 1.258-1.022 2.28-2.28 2.28s-2.28-1.022-2.28-2.28 1.022-2.28 2.28-2.28 2.28 1.022 2.28 2.28z">
            </path>
          </g>
        </svg>
        <p>Acceuil</p>
      </div>
      <div
        class="flex items-center w-auto py-2 px-3 rounded-3xl cursor-pointer hover:bg-gray-200 transition-all duration-300 ease-out ">
        <div class="">
          <svg height="28" viewBox="0 0 24 24" aria-hidden="true" class="mr-4">
            <g>
              <path
                d="M21 7.337h-3.93l.372-4.272c.036-.412-.27-.775-.682-.812-.417-.03-.776.27-.812.683l-.383 4.4h-6.32l.37-4.27c.037-.413-.27-.776-.68-.813-.42-.03-.777.27-.813.683l-.382 4.4H3.782c-.414 0-.75.337-.75.75s.336.75.75.75H7.61l-.55 6.327H3c-.414 0-.75.336-.75.75s.336.75.75.75h3.93l-.372 4.272c-.036.412.27.775.682.812l.066.003c.385 0 .712-.295.746-.686l.383-4.4h6.32l-.37 4.27c-.036.413.27.776.682.813l.066.003c.385 0 .712-.295.746-.686l.382-4.4h3.957c.413 0 .75-.337.75-.75s-.337-.75-.75-.75H16.39l.55-6.327H21c.414 0 .75-.336.75-.75s-.336-.75-.75-.75zm-6.115 7.826h-6.32l.55-6.326h6.32l-.55 6.326z">
              </path>
            </g>
          </svg>
        </div>
        <p>Explorer</p>
      </div>
      <div
        class="flex items-center w-auto py-2 px-3 rounded-3xl cursor-pointer hover:bg-gray-200 transition-all duration-300 ease-out ">
        <div class="">
          <svg height="28" viewBox="0 0 24 24" aria-hidden="true" class="mr-4">
            <g>
              <path
                d="M21.697 16.468c-.02-.016-2.14-1.64-2.103-6.03.02-2.532-.812-4.782-2.347-6.335C15.872 2.71 14.01 1.94 12.005 1.93h-.013c-2.004.01-3.866.78-5.242 2.174-1.534 1.553-2.368 3.802-2.346 6.334.037 4.33-2.02 5.967-2.102 6.03-.26.193-.366.53-.265.838.102.308.39.515.712.515h4.92c.102 2.31 1.997 4.16 4.33 4.16s4.226-1.85 4.327-4.16h4.922c.322 0 .61-.206.71-.514.103-.307-.003-.645-.263-.838zM12 20.478c-1.505 0-2.73-1.177-2.828-2.658h5.656c-.1 1.48-1.323 2.66-2.828 2.66zM4.38 16.32c.74-1.132 1.548-3.028 1.524-5.896-.018-2.16.644-3.982 1.913-5.267C8.91 4.05 10.397 3.437 12 3.43c1.603.008 3.087.62 4.18 1.728 1.27 1.285 1.933 3.106 1.915 5.267-.024 2.868.785 4.765 1.525 5.896H4.38z">
              </path>
            </g>
          </svg>
        </div>
        <p>Notifications</p>
      </div>
      <div
        class="flex items-center w-auto py-2 px-3 rounded-3xl cursor-pointer hover:bg-gray-200 transition-all duration-300 ease-out ">
        <div class="">
          <svg height="28" viewBox="0 0 24 24" aria-hidden="true" class="mr-4">
            <g>
              <path
                d="M19.25 3.018H4.75C3.233 3.018 2 4.252 2 5.77v12.495c0 1.518 1.233 2.753 2.75 2.753h14.5c1.517 0 2.75-1.235 2.75-2.753V5.77c0-1.518-1.233-2.752-2.75-2.752zm-14.5 1.5h14.5c.69 0 1.25.56 1.25 1.25v.714l-8.05 5.367c-.273.18-.626.182-.9-.002L3.5 6.482v-.714c0-.69.56-1.25 1.25-1.25zm14.5 14.998H4.75c-.69 0-1.25-.56-1.25-1.25V8.24l7.24 4.83c.383.256.822.384 1.26.384.44 0 .877-.128 1.26-.383l7.24-4.83v10.022c0 .69-.56 1.25-1.25 1.25z">
              </path>
            </g>
          </svg>
        </div>
        <p>Messages</p>
      </div>
      <div
        class="flex items-center w-auto py-2 px-3 rounded-3xl cursor-pointer hover:bg-gray-200 transition-all duration-300 ease-out ">
        <div class="">
          <svg height="28" viewBox="0 0 24 24" aria-hidden="true" class="mr-4">
            <g>
              <path
                d="M19.9 23.5c-.157 0-.312-.05-.442-.144L12 17.928l-7.458 5.43c-.228.164-.53.19-.782.06-.25-.127-.41-.385-.41-.667V5.6c0-1.24 1.01-2.25 2.25-2.25h12.798c1.24 0 2.25 1.01 2.25 2.25v17.15c0 .282-.158.54-.41.668-.106.055-.223.082-.34.082zM12 16.25c.155 0 .31.048.44.144l6.71 4.883V5.6c0-.412-.337-.75-.75-.75H5.6c-.413 0-.75.338-.75.75v15.677l6.71-4.883c.13-.096.285-.144.44-.144z">
              </path>
            </g>
          </svg>
        </div>
        <p>Signets</p>
      </div>
      <div
        class="flex items-center w-auto py-2 px-3 rounded-3xl cursor-pointer hover:bg-gray-200 transition-all duration-300 ease-out ">
        <div class="">
          <svg height="28" viewBox="0 0 24 24" aria-hidden="true" class="mr-4">
            <g>
              <path
                d="M19.75 22H4.25C3.01 22 2 20.99 2 19.75V4.25C2 3.01 3.01 2 4.25 2h15.5C20.99 2 22 3.01 22 4.25v15.5c0 1.24-1.01 2.25-2.25 2.25zM4.25 3.5c-.414 0-.75.337-.75.75v15.5c0 .413.336.75.75.75h15.5c.414 0 .75-.337.75-.75V4.25c0-.413-.336-.75-.75-.75H4.25z">
              </path>
              <path
                d="M17 8.64H7c-.414 0-.75-.337-.75-.75s.336-.75.75-.75h10c.414 0 .75.335.75.75s-.336.75-.75.75zm0 4.11H7c-.414 0-.75-.336-.75-.75s.336-.75.75-.75h10c.414 0 .75.336.75.75s-.336.75-.75.75zm-5 4.11H7c-.414 0-.75-.335-.75-.75s.336-.75.75-.75h5c.414 0 .75.337.75.75s-.336.75-.75.75z">
              </path>
            </g>
          </svg>
        </div>
        <p>Listes</p>
      </div>
      <div
        class="flex items-center w-auto py-2 px-3 rounded-3xl cursor-pointer hover:bg-gray-200 transition-all duration-300 ease-out ">
        <div class="">
          <svg height="28" viewBox="0 0 24 24" aria-hidden="true" class="mr-4">
            <g>
              <path
                d="M12.225 12.165c-1.356 0-2.872-.15-3.84-1.256-.814-.93-1.077-2.368-.805-4.392.38-2.826 2.116-4.513 4.646-4.513s4.267 1.687 4.646 4.513c.272 2.024.008 3.46-.806 4.392-.97 1.106-2.485 1.255-3.84 1.255zm5.849 9.85H6.376c-.663 0-1.25-.28-1.65-.786-.422-.534-.576-1.27-.41-1.968.834-3.53 4.086-5.997 7.908-5.997s7.074 2.466 7.91 5.997c.164.698.01 1.434-.412 1.967-.4.505-.985.785-1.648.785z">
              </path>
            </g>
          </svg>
        </div>
        <p class="font-bold">Profil</p>
      </div>
      <div
        class="flex items-center w-auto py-2 px-3 rounded-3xl cursor-pointer hover:bg-gray-200 transition-all duration-300 ease-out ">
        <div class="">
          <svg height="28" viewBox="0 0 24 24" aria-hidden="true" class="mr-4">
            <g>
              <circle cx="17" cy="12" r="1.5"></circle>
              <circle cx="12" cy="12" r="1.5"></circle>
              <circle cx="7" cy="12" r="1.5"></circle>
              <path
                d="M12 22.75C6.072 22.75 1.25 17.928 1.25 12S6.072 1.25 12 1.25 22.75 6.072 22.75 12 17.928 22.75 12 22.75zm0-20C6.9 2.75 2.75 6.9 2.75 12S6.9 21.25 12 21.25s9.25-4.15 9.25-9.25S17.1 2.75 12 2.75z">
              </path>
            </g>
          </svg>
        </div>
        <p>Plus</p>
      </div>
    </div>

    <button class="font-semibold mt-7 text-white w-11/12 px-3 py-2 mx-auto rounded-3xl bg-[#1d9bf0]">Tweeter</button>

    <div
      class="absolute bottom-6 flex items-center bg-white w-7/12 py-2 px-3 rounded-3xl cursor-pointer hover:bg-gray-200 transition-all duration-300 ease-out">
      <img class="mr-2 rounded-full w-10 h-10 object-cover object-left"
        src="https://pbs.twimg.com/profile_banners/1092408488293224450/1575197403/1500x500" alt="">
      <div class="flex flex-col mr-5">
        <h3 class="font-bold text-sm"><%= @name %></h3>
        <p class="text-xs text-gray-400"><%= @handle %></p>
      </div>
      <i class="relative right-0 fas fa-ellipsis-h"></i>
    </div>

  </div>


  <div id="header" class="sticky w-6/12">
    <header class="w-full flex items-center h-16 border-b-[1px] border-gray-100 ">
      <div
        class="mr-5 h-10 w-10 flex justify-center items-center cursor-pointer transition-all duration-200 ease-out rounded-full hover:bg-gray-200">
        <i class="fas fa-arrow-left"></i>
      </div>
      <div class="flex flex-col">
        <h1 class="font-bold text-xl"><%= @name %></h1>
        <p class="text-xs text-gray-500 font-light"><%= @tweets_cnt %> Tweets</p>
      </div>
    </header>

    <div id="profile" class="w-full h-72 mb-6 object-cover relative">
      <img class="cursor-pointer" src="https://pbs.twimg.com/profile_banners/1092408488293224450/1575197403/1500x500"
        alt="">
      <div
        class="hover:brightness-75 cursor-pointer transition-all duration-300 ease-out absolute p-[3px] left-4 -bottom-6 h-36 w-36 object-cover rounded-full overflow-hidden bg-white">
        <img class="rounded-full" src="https://pbs.twimg.com/profile_images/1255983864390004738/LAm7-HFj_400x400.jpg"
          alt="">
      </div>
      <button phx-click="open_edit_profile"
        class="absolute font-semibold right-2 px-3.5 py-1.5 -bottom-2 border-[1px] border-gray-300 hover:bg-gray-300 transition-all duration-200 ease-out rounded-3xl">
        Éditer le Profil
      </button>
    </div>
    <div class="py-3">
      <div class="px-3 flex flex-col">
        <h3 class="font-bold text-2xl"><%= @name %></h3>
        <p class="text-xs  text-gray-400">@<%= @handle %></p>
      </div>

      <div class="px-3 mt-3 text-sm font-light">
        <p><%= @bio %></p>
        <span class="text-blue-400 cursor-pointer hover:underline hover:text-blue-600">Traduire la biographie</span>
      </div>

      <div class="px-3 flex items-center text-gray-400 text-sm font-light  mt-3 space-x-4">
        <div class="flex items-center cursor-pointer">
          <svg fill="#aab0ba" height="22" viewBox="0 0 24 24" aria-hidden="true">
            <g>
              <path
                d="M12 14.315c-2.088 0-3.787-1.698-3.787-3.786S9.913 6.74 12 6.74s3.787 1.7 3.787 3.787-1.7 3.785-3.787 3.785zm0-6.073c-1.26 0-2.287 1.026-2.287 2.287S10.74 12.814 12 12.814s2.287-1.025 2.287-2.286S13.26 8.24 12 8.24z">
              </path>
              <path
                d="M20.692 10.69C20.692 5.9 16.792 2 12 2s-8.692 3.9-8.692 8.69c0 1.902.603 3.708 1.743 5.223l.003-.002.007.015c1.628 2.07 6.278 5.757 6.475 5.912.138.11.302.163.465.163.163 0 .327-.053.465-.162.197-.155 4.847-3.84 6.475-5.912l.007-.014.002.002c1.14-1.516 1.742-3.32 1.742-5.223zM12 20.29c-1.224-.99-4.52-3.715-5.756-5.285-.94-1.25-1.436-2.742-1.436-4.312C4.808 6.727 8.035 3.5 12 3.5s7.192 3.226 7.192 7.19c0 1.57-.497 3.062-1.436 4.313-1.236 1.57-4.532 4.294-5.756 5.285z">
              </path>
            </g>
          </svg>
          <p><%= @location %></p>
        </div>
        <div class="px-3 flex items-center cursor-pointer">
          <svg fill="#aab0ba" class="mr-1" height="22" viewBox="0 0 24 24" aria-hidden="true">
            <g>
              <path
                d="M19.708 2H4.292C3.028 2 2 3.028 2 4.292v15.416C2 20.972 3.028 22 4.292 22h15.416C20.972 22 22 20.972 22 19.708V4.292C22 3.028 20.972 2 19.708 2zm.792 17.708c0 .437-.355.792-.792.792H4.292c-.437 0-.792-.355-.792-.792V6.418c0-.437.354-.79.79-.792h15.42c.436 0 .79.355.79.79V19.71z">
              </path>
              <circle cx="7.032" cy="8.75" r="1.285"></circle>
              <circle cx="7.032" cy="13.156" r="1.285"></circle>
              <circle cx="16.968" cy="8.75" r="1.285"></circle>
              <circle cx="16.968" cy="13.156" r="1.285"></circle>
              <circle cx="12" cy="8.75" r="1.285"></circle>
              <circle cx="12" cy="13.156" r="1.285"></circle>
              <circle cx="7.032" cy="17.486" r="1.285"></circle>
              <circle cx="12" cy="17.486" r="1.285"></circle>
            </g>
          </svg>
          <p>A rejoint Twitter en février 2019</p>
        </div>
      </div>

      <div class="px-3 flex items-center space-x-4 mt-2 mb-5">
        <div class="flex items-center cursor-pointer">
          <h3 class="font-semibold"><%= @following_cnt %></h3>
          <p class="ml-1 text-sm text-gray-400 font-light">abonnements</p>
        </div>
        <div class="flex items-center cursor-pointer">
          <h3 class="font-semibold"><%= @followers_cnt %></h3>
          <p class="ml-1 text-sm text-gray-400 font-light">abonnés</p>
        </div>
      </div>

      <div class="flex items-center h-10  cursor-pointer border-b-[1px]">
        <div class="flex justify-center items-center font-semibold h-full w-full">
          <h1 class="h-full border-b-4 border-blue-500">Tweets</h1>
        </div>
        <div class="flex justify-center w-full items-center h-full hover:bg-gray-100 text-gray-400 font-light">
          <h1>Tweets et réponses</h1>
        </div>
        <div class="flex justify-center w-full items-center h-full hover:bg-gray-100 text-gray-400 font-light">
          <h1>Médias</h1>
        </div>
        <div class="flex justify-center w-full items-center h-full hover:bg-gray-100 text-gray-400 font-light">
          <h1>J'aime</h1>
        </div>
      </div>

    </div>
  </div>

  <div id="discover" class="sticky w-3/12 border-l-[1px] border-gray-100 ">
    <div class="h-16 w-full flex justify-center items-center">
      <div class="bg-gray-200 w-11/12 rounded-3xl flex items-center">
        <svg class="ml-3" height="22" viewBox="0 0 24 24" aria-hidden="true">
          <g>
            <path
              d="M21.53 20.47l-3.66-3.66C19.195 15.24 20 13.214 20 11c0-4.97-4.03-9-9-9s-9 4.03-9 9 4.03 9 9 9c2.215 0 4.24-.804 5.808-2.13l3.66 3.66c.147.146.34.22.53.22s.385-.073.53-.22c.295-.293.295-.767.002-1.06zM3.5 11c0-4.135 3.365-7.5 7.5-7.5s7.5 3.365 7.5 7.5-3.365 7.5-7.5 7.5-7.5-3.365-7.5-7.5z">
            </path>
          </g>
        </svg>
        <input class=" w-full p-3 bg-transparent outline-none border-none placeholder-gray-600 text-sm" type="text"
          placeholder="Recherche Twitter">
      </div>
    </div>
  </div>

</div>
"""
end
end