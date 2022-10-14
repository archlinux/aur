# 👾 Nextcloud Share CLI (NCLI)
A command line tool for uploading a file to a nextcloud instance and automatically sharing it with a link that can be copied

# installation (Linux)
1. Install [Go](https://go.dev/doc/install) if not installed already
2. run the following commands:
```sh
git clone https://github.com/m4r1vs/nextcloud-share-cli
cd nextcloud-share-cli
make install
```
# installation (Mac & Windows) ⚠ might not work
1. Install [Go](https://go.dev/doc/install) if not installed already
2. clone this repository
3. run `go build -o bin/ncli ncli.go` in the cloned directory
4. add the generated binary to your [windows path](https://google.gprivate.com/search.php?search?q=how+to+add+to+path+windows) or [mac path](https://google.gprivate.com/search.php?search?q=how+to+add+to+path+mac)
# Usage
Run `ncli` to set up the config. Following commands are currently supported:
```sh
ncli --share path/to/file.jpeg
ncli --upload path/to/file.js
ncli --configure reset
ncli --configure [username, password, etc.]
ncli --help
```
