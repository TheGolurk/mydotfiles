#!/bin/zsh

EMOJI=(🐶 🐱 🐭 🐹 🐰 🦊 🐻 🐼 🐻 ❄️ 🐨 🐯 🦁 🐮 🐷 🐽 🐸 🐵 🙈 🙉 🙊 🐒 🐔 🐧 🐦 🐤 🐣 🐥 🦆 🦅 🦉
🦇 🐺 🐗 🐴 🦄 🐝 🪱 🐛 🦋 🐌 🐞 🐜 🪰 🪲 🪳 🦟 🦗 🕷 🕸 🦂 🐢 🐍 🦎 🦖 🦕 🐙 🦑 🦐 🦞 🦀 🐡 🐠 🐟 🐬 🐳
🐋 🦈 🐊 🐅 🐆 🦓 🦍 🦧 🦣 🐘 🦛 🦏 🐫 🦒 🦘 🦬 🐃 🐂 🐄 🐎 🐖 🐏 🐑 🦙 🐐 🦌 🐕 🐩 🦮 🐕 🐈 🐓 🦃 🦤
🦚 🦜 🦢 🦩 🕊 🐇 🦝 🦨 🦡 🦫 🦦 🦥 🐁 🐀 🐿 🦔 🐾 🐉 🐲 🌵 🎄 🌲 🌳 🌴 🪵 🌱 🌿 🍀 🎍 🪴 🎋 🍃 🍂 🍁
🍄 🐚 🪨 🌾 💐 🌷 🌹 🌺 🌸 🌼 🌻 🌞 🌝 🌛 🌚 🌑 🌎 🪐 💫 ⭐️ 🌟 ✨ ⚡️ 💥 🔥 🌈 ☀️  ⛅️ ☁️  ❄️  ☃️  ⛄️ 🌬 💨
💦 ☔️ 🌊  🙂 🙃 😀 😃 😄 😁 😆 😅 😂 🤣 🥲  😛 😝 😜 🤪 🤓 😎 🥸  😡 🤬 🤯 🌇 🌆 🏙 🌃 🌌 🌉 🌁 ⛪️ 🕌 🕍 🛕 🚷 🚯 🚳 🚱 🔞 📵 🚭 🚫 💯
🔴 🟠 🟡 🟢 🔵 🟣 ⚫️ ⚪️ 🟤🔈 🔇 🔉 🔊 🔔 🔕 📣 📢 )    

COLS=("black" "white" "red" "cyan" "yellow" "magenta" "blue" "green")

local ret_status="%(?:%{$fg_bold[green]%}λ :%{$fg_bold[red]%}λ %s)"

function get_pwd(){
  git_root=$PWD
  while [[ $git_root != / && ! -e $git_root/.git ]]; do
    git_root=$git_root:h
  done
  if [[ $git_root = / ]]; then
    unset git_root
    prompt_short_dir=%~
  else
    parent=${git_root%\/*}
    prompt_short_dir=${PWD#$parent/}
  fi
  echo $prompt_short_dir
}


PROMPT='$EMOJI[$RANDOM % $#EMOJI+1] $ret_status %{$fg[${COLS[RANDOM%${#COLS[@]}]}]%}$(get_pwd) $(git_prompt_info)%{$reset_color%}%{$reset_color%} '

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[cyan]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[yellow]%}✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=" %{$fg[green]%}✓%{$reset_color%}"

