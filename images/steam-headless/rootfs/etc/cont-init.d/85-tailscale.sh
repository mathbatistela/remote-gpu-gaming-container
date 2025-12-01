#!/usr/bin/env bash
# Tailscale startup script - only runs if TAILSCALE_AUTH_KEY is set

if [ -z "$TAILSCALE_AUTH_KEY" ]; then
    echo "[tailscale] TAILSCALE_AUTH_KEY not set, skipping Tailscale setup"
    exit 0
fi

echo "[tailscale] Starting Tailscale..."

# Apply sysctl settings for IP forwarding
sysctl -p /etc/sysctl.d/99-tailscale.conf 2>/dev/null || true

# Start tailscaled with userspace networking (safest for Docker/containers)
tailscaled --tun=userspace-networking --socks5-server=localhost:1055 &
sleep 5

# Authenticate with Tailscale
HOSTNAME="${TAILSCALE_HOSTNAME:-runpod-gaming}"
echo "[tailscale] Authenticating as hostname: $HOSTNAME"
tailscale up --authkey="$TAILSCALE_AUTH_KEY" --hostname="$HOSTNAME"

TAILSCALE_IP=$(tailscale ip -4)
echo "[tailscale] Tailscale connected successfully"
echo "[tailscale] Tailscale IP: $TAILSCALE_IP"
