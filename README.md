# containerd-git

## Build

### Docker

```
make clean
docker run -i -t --rm -v $(pwd):/usr/local/build/src flaccid/arch-makepkg
```
