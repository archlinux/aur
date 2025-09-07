This is the package for the CLI tool **wiki2book** (https://github.com/hauke96/wiki2book).

## Commands

Build locally: `makepkg -f -c -s -r -i`

Update `.SRCINFO` file: `./update-srcinfo.sh`

## Update

1. Edit `PKGBUILD` accordingly
	* `pkgver`
	* go version in `makedepends` is needed (according to `go.mod` file of wiki2book project)
	* dependencies if needed
2. Update `.SRCINFO` as described above
3. Commit and push
