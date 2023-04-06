#!/bin/bash

main() {
	if [[ "$1" == "get-public-ip" ]]; then
		curl -s http://ip-api.com/json | jq -r .query
	elif [[ "$1" = "get-private-ip" ]]; then
		ipconfig getifaddr en0
	fi
}

main "$@"
