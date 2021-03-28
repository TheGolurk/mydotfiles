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

function emoji-clock() {
  # Add 15 minutes to the current time and save the value as $minutes.
  (( minutes = $(date '+%M') + 15 ))
  (( hour = $(date '+%I') + minutes / 60 ))
  # make sure minutes and hours don't exceed 60 nor 12 respectively
  (( minutes %= 60 )); (( hour %= 12 ))

  case $hour in
     0) clock="🕛"; [ $minutes -ge 30 ] && clock="🕧";;
     1) clock="🕐"; [ $minutes -ge 30 ] && clock="🕜";;
     2) clock="🕑"; [ $minutes -ge 30 ] && clock="🕝";;
     3) clock="🕒"; [ $minutes -ge 30 ] && clock="🕞";;
     4) clock="🕓"; [ $minutes -ge 30 ] && clock="🕟";;
     5) clock="🕔"; [ $minutes -ge 30 ] && clock="🕠";;
     6) clock="🕕"; [ $minutes -ge 30 ] && clock="🕡";;
     7) clock="🕖"; [ $minutes -ge 30 ] && clock="🕢";;
     8) clock="🕗"; [ $minutes -ge 30 ] && clock="🕣";;
     9) clock="🕘"; [ $minutes -ge 30 ] && clock="🕤";;
    10) clock="🕙"; [ $minutes -ge 30 ] && clock="🕥";;
    11) clock="🕚"; [ $minutes -ge 30 ] && clock="🕦";;
     *) clock="⌛";;
  esac
  printf "%s" $clock
}

PROMPT='$EMOJI[$RANDOM % $#EMOJI+1] $ret_status %{$fg[${COLS[RANDOM%${#COLS[@]}]}]%}$(get_pwd) $(emoji-clock) $(git_prompt_info)%{$reset_color%}%{$reset_color%} '

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[cyan]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[yellow]%}✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=" %{$fg[green]%}✓%{$reset_color%}"

