FROM ghcr.io/steam-headless/steam-headless:arch

# Fix "16#: invalid integer constant" crash from Xorg script
ENV FORCE_X11_DUMMY_CONFIG=TRUE

# Patch flatpak config script to handle RunPod's blocked mount syscalls
RUN sed -i 's/mount -t proc none \/proc/mount -t proc none \/proc || true/' /etc/cont-init.d/80-configure_flatpak.sh
