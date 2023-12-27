# Update a package

* Get the package
* Calulate the md5sum
* Update the version in the `PKGBUILD` file
* Run `makepkg --printsrcinfo >.SRCINFO`
* Run `makepkg` to ensure everything is working
