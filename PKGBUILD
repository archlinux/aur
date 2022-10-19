# Maintainer: Lukas Spiss <lukas.spiss@outlook.de>

pkgname=mockoon-bin
pkgver=1.21.0
pkgrel=2
pkgdesc="Mockoon is the easiest and quickest way to run mock APIs locally."
arch=('x86_64')
url="https://mockoon.com/"
license=('MIT')
groups=('base-devel')
depends=()
source=(https://github.com/mockoon/mockoon/releases/download/v${pkgver}/mockoon-${pkgver}.deb)
md5sums=('4c547f5d42e77d6b4e7d669dd26eeb8e')

package() {
	install -dm755 "${pkgdir}"/usr/bin/
   	cd "$srcdir/"
	tar -xf data.tar.xz -C "${pkgdir}"

	ln -s /opt/Mockoon/mockoon "${pkgdir}"/usr/bin/mockoon
}