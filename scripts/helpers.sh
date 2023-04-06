#!/bin/bash

get_tmux_option() {
  local option="$1"
  local default_value="$2"
  local option_value

  option_value="$(tmux show-option -gqv "$option")"
  # return the option value
  [[ -n "$option_value" ]] && echo "$option_value" || echo "$default_value"
}

set_tmux_option() {
  local option="$1"
  local value="$2"
  # set the option value
  tmux set-option -gq "$option" "$value"
}
