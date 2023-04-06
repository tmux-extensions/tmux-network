# tmux-network

This plugin displays the current public and private IP addresses.

## Getting Started

You can use the `#{net_private_ip}` or the `${net_public_ip}` variables in your existing status line.

```shell
set-option -g status-right '#{net_private_ip} #{net_public_ip}'
```

## Installation

This is a plugin for [tmux plugin manager](https://github.com/tmux-plugins/tpm). You can install it by adding the following line in your tmux config.

```shell
set -g @plugin 'tmux-extensions/tmux-network'
```

## License

[MIT](./LICENSE)
