if command -v tailscale &>/dev/null; then
  export TAILSCALE_IP_V4="$(tailscale ip -4)"
fi
