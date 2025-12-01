# steam-headless

RunPod-compatible Steam Headless container for remote GPU gaming.

## Base Image

[steam-headless/docker-steam-headless](https://github.com/Steam-Headless/docker-steam-headless) (Arch Linux variant)

## Modifications

This image applies the following patches to work on RunPod:

- **Mount syscall fix**: Patches `/etc/cont-init.d/80-configure_flatpak.sh` to allow `mount` commands to fail gracefully (RunPod blocks mount syscalls)
- **Tailscale**: Pre-installed, optionally starts if `TAILSCALE_AUTH_KEY` is provided

## Usage

```bash
docker pull ghcr.io/<username>/remote-gpu-gaming-container:steam-headless
```

### Environment Variables

| Variable | Required | Description |
|----------|----------|-------------|
| `TAILSCALE_AUTH_KEY` | No | Reusable ephemeral auth key from Tailscale admin console (Tailscale only starts if set) |
| `TAILSCALE_HOSTNAME` | No | Hostname for the Tailscale device (default: `runpod-gaming`) |
