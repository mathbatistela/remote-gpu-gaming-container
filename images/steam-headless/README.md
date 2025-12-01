# steam-headless

RunPod-compatible Steam Headless container for remote GPU gaming.

## Base Image

[steam-headless/docker-steam-headless](https://github.com/Steam-Headless/docker-steam-headless) (Arch Linux variant)

## Modifications

This image applies the following patches to work on RunPod:

- **Mount syscall fix**: Patches `/etc/cont-init.d/80-configure_flatpak.sh` to allow `mount` commands to fail gracefully (RunPod blocks mount syscalls)
- **X11 dummy config**: Sets `FORCE_X11_DUMMY_CONFIG=TRUE` to fix the "16#: invalid integer constant" crash from the Xorg script

## Usage

```bash
docker pull ghcr.io/<username>/remote-gpu-gaming-container:steam-headless
```
