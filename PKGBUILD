# Maintainer: Lukas Spiss <lukas.spiss@outlook.de>

pkgname=mockoon-bin
pkgver=1.8.0
pkgrel=1
pkgdesc="Mockoon is the easiest and quickest way to run mock APIs locally."
arch=('x86_64')
url="https://mockoon.com/"
license=('MIT')
groups=('base-devel')
depends=()
source=(https://github.com/mockoon/mockoon/releases/download/v${pkgver}/mockoon-${pkgver}.deb)
md5sums=('ed5e79dc703a3a745617b02c7e181920')

package() {
   	cd "$srcdir/"
	tar -xf data.tar.xz -C "${pkgdir}"
}