# thumbnail-gl

Simple tool for generating preview raster images for styles.

##
The tool generates 3 images:
- `thumbnail.png` -- 512x512, whole world
- `preview2.png` -- 640x360, image with zoom level 2 (centered on Zurich)
- `preview10.png` -- 640x360, image with zoom level 10 (centered on Zurich)
- `custom.png` -- custom image (if specified in the second parameter)

## Usage

`docker run -v $(pwd):/data klokantech/thumbnail-gl {JSON_URL} [{CUSTOM_AREA_SPEC}]`

### Example

`docker run -v $(pwd):/data klokantech/thumbnail-gl https://maps.tilehosting.com/styles/topo/style.json?key=[key] "-x 8.235 -y 46.787 -z 7 -w 800 -h 600 -r 2"`
![custom](https://user-images.githubusercontent.com/707817/35003898-9916e510-faee-11e7-9058-c705c7bd129a.png)
