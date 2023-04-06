#!/bin/bash

CURRENT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# shellcheck disable=1090
source "${CURRENT_DIR}/scripts/helpers.sh"

# shellcheck disable=1090
net_public_ip="#(${CURRENT_DIR}/scripts/network.sh get-public-ip)"
net_public_ip_interpolation_string="\#{net_public_ip}"

# shellcheck disable=1090
net_private_ip="#(${CURRENT_DIR}/scripts/network.sh get-private-ip)"
net_private_ip_interpolation_string="\#{net_private_ip}"

do_interpolation() {
	local content="$1"

	content="${content/$net_public_ip_interpolation_string/$net_public_ip}"
	content="${content/$net_private_ip_interpolation_string/$net_private_ip}"

	echo "$content"
}

update_tmux_option() {
	local option="$1"
	local option_value
	local new_option_value

	option_value="$(get_tmux_option "$option")"
	new_option_value="$(do_interpolation "$option_value")"

	set_tmux_option "$option" "$new_option_value"
}

main() {
	update_tmux_option "status-right"
	update_tmux_option "status-left"
}

main
