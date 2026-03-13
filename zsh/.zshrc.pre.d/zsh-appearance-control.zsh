# zsh-appearance-control

my_zac_callback() {
  zac sync
  local is_dark
  is_dark=`zac status`

  if (( is_dark )); then
    typeset -g POWERLEVEL9K_BACKGROUND=234
  else
    typeset -g POWERLEVEL9K_BACKGROUND=255
  fi
  p10k reload
}

# Export this variable before loading zsh-appearance-control
export ZAC_CALLBACK_FNC=my_zac_callback
