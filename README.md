I always forget exactly what to do; writing the steps down here.

* edit PKGBUILD to change the version on line 3
* curl -s "https://github.com/pkulak/matui/archive/refs/tags/v0.3.0.tar.gz" | b2sum
* pop that sum into the PGKBUILD
* makepkg --printsrcinfo > .SRCINFO
* commit and push
* profit
