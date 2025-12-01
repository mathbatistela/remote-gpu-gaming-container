FROM ghcr.io/steam-headless/steam-headless:stable

# Patch flatpak config script to handle RunPod's blocked mount syscalls
RUN sed -i 's/mount -t proc none \/proc/mount -t proc none \/proc || true/' /etc/cont-init.d/80-configure_flatpak.sh

# Install Tailscale
RUN curl -fsSL https://tailscale.com/install.sh | sh && \
    # Configure IP forwarding for VPN performance
    echo 'net.ipv4.ip_forward = 1' | tee -a /etc/sysctl.d/99-tailscale.conf && \
    echo 'net.ipv6.conf.all.forwarding = 1' | tee -a /etc/sysctl.d/99-tailscale.conf

# Add Tailscale startup script (runs only if TAILSCALE_AUTH_KEY is set)
COPY rootfs/ /