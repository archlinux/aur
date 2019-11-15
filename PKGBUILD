#! /bin/bash

Name="execute"
CammelName="exeCute"
pkgname="${Name}-git"
provides=("${Name}")
conflicts=("${Name}")

pkgdesc="Opens exe and bat files as if they were native"
url="https://gitlab.com/es20490446e/${CammelName}"
license=("GPL3")

pkgver=19
pkgrel=1
arch=("any")

makedepends=("git")
depends=("dosbox" "q4wine" "wine_gecko" "wine-mono")
source=("git+${url}.git")
md5sums=("SKIP")


pkgver () {
	cd "${CammelName}"
	git rev-list --count HEAD
}


package () {
	"${srcdir}/exeCute/installer" "-install" "${pkgdir}"
}

