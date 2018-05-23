# docker-git

## Build

### Docker

```
make clean
docker pull flaccid/arch-makepkg
docker run \
  -i \
  -t \
  --rm \
  -e AUR_PACKAGES='apparmor-libapparmor' \
  -v $(pwd):/usr/local/build/src \
    flaccid/arch-makepkg
```
