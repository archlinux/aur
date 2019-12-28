# Maintainer: Lukas Spiss <lukas.spiss@outlook.de>

pkgname=mockoon-bin
pkgver=0.0.1
pkgrel=1
pkgdesc="Mockoon is the easiest and quickest way to run mock APIs locally."
arch=('x86_64')
url="https://mockoon.com/"
license=('MIT')
groups=('base-devel')
depends=()
source=(https://github.com/mockoon/mockoon/releases/download/v${pkgver}/mockoon-${pkgver}.deb)
md5sums=('9d1ead73e678fa2f51a70a933b0bf017')

package() {
   	cd "$srcdir/"
	tar -xf data.tar.xz -C "${pkgdir}"
}