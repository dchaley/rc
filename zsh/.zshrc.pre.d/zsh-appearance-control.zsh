# zsh-appearance-control

my_imm_callback() {
  local is_dark=$1
  if (( is_dark )); then
    typeset -g POWERLEVEL9K_BACKGROUND=234
  else
    typeset -g POWERLEVEL9K_BACKGROUND=255
  fi
  p10k reload
}

# Export this variable before loading zsh-appearance-control
export ZAC_IMMEDIATE_CALLBACK_FNC=my_imm_callback
