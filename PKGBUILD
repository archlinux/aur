# Maintainer: Lukas Spiss <lukas.spiss@outlook.de>

pkgname=mockoon-bin
pkgver=1.7.0
pkgrel=1
pkgdesc="Mockoon is the easiest and quickest way to run mock APIs locally."
arch=('x86_64')
url="https://mockoon.com/"
license=('MIT')
groups=('base-devel')
depends=()
source=(https://github.com/mockoon/mockoon/releases/download/v${pkgver}/mockoon-${pkgver}.deb)
md5sums=('71e53842ec3c48e46f6b7cb221a276ff')

package() {
   	cd "$srcdir/"
	tar -xf data.tar.xz -C "${pkgdir}"
}