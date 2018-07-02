# Maintainer: rapiertg <rapiertg@gmail.com>
pkgname=astroequploader
pkgver=3.9.0
pkgrel=2
pkgdesc="DIY Electronics System for connecting a non-Goto telescope to EQMOD - config utility"
arch=('x86_64')
url="https://github.com/TCWORLD/AstroEQ"
license=('MIT')
depends=('java-runtime=8' 'avrdude' 'libjssc-java')
provides=('astroequploader')
md5sums=("95f346ba22b0d31b9e9615c70018338a")

source=("https://github.com/TCWORLD/AstroEQ/raw/master/AstroEQ-ConfigUtility/${pkgname}-${pkgver}.deb")

package() {
	bsdtar xvf "$srcdir/data.tar.xz" -C "$pkgdir"
}
