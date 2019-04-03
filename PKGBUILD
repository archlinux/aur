#! /bin/bash

name="execute"
pkgname="${name}-git"
pkgver="master"
pkgrel=1
pkgdesc="Opens exe files as if they were native Linux applications, silently selecting the right emulator and configuration for each case"
arch=("x86_64")
url="https://gitlab.com/es20490446e/${name}" #maintainer
license=("GPL3")
makedepends=("git")
depends=("dosbox-svn" "q4wine")
optdepends=("wine-mono" "wine_gecko")
provides=("${name}")
source=("git+${url}.git")
md5sums=("SKIP")


package () {
	"${srcdir}/${name}/installer" "-install" "${pkgdir}"
}
