FROM ghcr.io/steam-headless/steam-headless:arch

# Patch flatpak config script to handle RunPod's blocked mount syscalls
RUN sed -i 's/mount -t proc none \/proc/mount -t proc none \/proc || true/' /etc/cont-init.d/80-configure_flatpak.sh

# Install Tailscale
RUN pacman -Sy --noconfirm tailscale

# Create startup script for Tailscale (optional, runs only if TAILSCALE_AUTH_KEY is set)
RUN echo '#!/bin/bash' > /etc/cont-init.d/99-tailscale.sh && \
    echo 'if [ -n "${TAILSCALE_AUTH_KEY}" ]; then' >> /etc/cont-init.d/99-tailscale.sh && \
    echo '  echo "Starting Tailscale..."' >> /etc/cont-init.d/99-tailscale.sh && \
    echo '  tailscaled --state=/var/lib/tailscale/tailscaled.state --tun=userspace-networking &' >> /etc/cont-init.d/99-tailscale.sh && \
    echo '  sleep 2' >> /etc/cont-init.d/99-tailscale.sh && \
    echo '  tailscale up --authkey=${TAILSCALE_AUTH_KEY} --hostname=${TAILSCALE_HOSTNAME:-runpod-gaming}' >> /etc/cont-init.d/99-tailscale.sh && \
    echo '  echo "Tailscale IP: $(tailscale ip -4)"' >> /etc/cont-init.d/99-tailscale.sh && \
    echo 'fi' >> /etc/cont-init.d/99-tailscale.sh && \
    chmod +x /etc/cont-init.d/99-tailscale.sh
