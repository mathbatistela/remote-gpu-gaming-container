# Remote GPU Gaming Container

Custom Docker images for remote GPU gaming on cloud platforms like RunPod.

## Available Images

| Image | Description | Pull Command |
|-------|-------------|--------------|
| [steam-headless](./images/steam-headless/) | RunPod-compatible Steam Headless container | `docker pull ghcr.io/<username>/remote-gpu-gaming-container:steam-headless` |

## Usage

Pull the image you need:

```bash
docker pull ghcr.io/<username>/remote-gpu-gaming-container:<image-name>
```

Replace `<username>` with your GitHub username and `<image-name>` with the desired image tag.

## Adding New Images

1. Create a new folder under `images/` with your image name (this becomes the tag)
2. Add a `Dockerfile` inside the folder
3. Add a `README.md` describing the image
4. Update `.github/workflows/build.yml` to add a filter for the new image:
   ```yaml
   your-image-name:
     - 'images/your-image-name/**'
   ```
5. Update this README to include the new image in the table above
