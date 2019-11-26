#! /bin/bash
#  https://es20490446e.wordpress.com/signature/

pkgname="the-darkmod-tweaked"
provides=("${pkgname}" "darkmod" "thedarkmod")
conflicts=("${pkgname}" "darkmod" "thedarkmod")
replaces=("darkmod")

pkgver=2.07.1.32
pkgrel=1
arch=("x86_64")

pkgdesc="First person forgery stealth game, tweaked to have the best usability on Linux. With separated saved games for each user, missions auto-cleanup, and enhanced installation speed."
license=("GPL3" "BSD" "CCPL:by-nc-sa")
url="http://www.thedarkmod.com"

SourcePath="https://gitlab.com/es20490446e/the-darkmod-tweaked"
source=("git+${SourcePath}.git")
md5sums=("SKIP")

depends=("curl" "glew" "libjpeg-turbo" "libpng" "libpng12" "libpulse" "libxxf86vm" "openal" "silently")
makedepends=("git" "unzip")


pkgver () {
	"${srcdir}/${pkgname}/version.sh"
}


build () {
	"${srcdir}/${pkgname}/build.sh"
}


package () {
	mv "${srcdir}/${pkgname}/build/usr" "${pkgdir}"
}

