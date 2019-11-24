#! /bin/bash
#  https://es20490446e.wordpress.com/signature/

pkgname="darkmod"
provides=("${pkgname}")
conflicts=("${pkgname}")

pkgver=2.07.1.30
pkgrel=1
arch=("x86_64")

pkgdesc="First person forgery stealth game"
license=("GPL3" "BSD" "CCPL:by-nc-sa")
url="http://www.thedarkmod.com"

SourcePath="https://gitlab.com/es20490446e/darkmod-linux-packager"
source=("git+${SourcePath}.git")
md5sums=("SKIP")

depends=("curl" "glew" "libjpeg-turbo" "libpng" "libpng12" "libpulse" "libxxf86vm" "openal" "silently")
makedepends=("git" "unzip")


pkgver () {
	"${srcdir}/darkmod-linux-packager/package version.sh"
}


build () {
	"${srcdir}/darkmod-linux-packager/build.sh"
}


package () {
	mv "${srcdir}/darkmod-linux-packager/build/usr" "${pkgdir}"
}

