# thumbnail-gl

Simple tool for generating preview raster images for styles.

##
The tool generates 3 images:
- `thumbnail.png` -- 512x512, whole world
- `preview-2.png` -- 640x360, image with zoom level 2 (centered on Zurich)
- `preview-10.png` -- 640x360, image with zoom level 10 (centered on Zurich)
- `custom.png` -- custom image (if specified in the second parameter)

## Usage

`docker run -v $(pwd):/data klokantech/thumbnail-gl {JSON_URL} [{CUSTOM_AREA_SPEC}]`

### Example

`docker run -v $(pwd):/data klokantech/thumbnail-gl https://maps.tilehosting.com/styles/topo/style.json?key=[key] "-x 8.235 -y 46.787 -z 7 -w 800 -h 600 -r 2"`

- thumbnail.png
![thumbnail](https://user-images.githubusercontent.com/707817/35004059-180bb35a-faef-11e7-8c9b-6f1e83e7b0fe.png)

- preview-2.png
![preview-2](https://user-images.githubusercontent.com/707817/35004061-19574daa-faef-11e7-876b-eae05bf5eb50.png)

- preview-10.png
![preview-10](https://user-images.githubusercontent.com/707817/35004065-1b3b605c-faef-11e7-93cd-4b4911a0578a.png)

- custom.png
![custom](https://user-images.githubusercontent.com/707817/35003898-9916e510-faee-11e7-9058-c705c7bd129a.png)
