# Maintainer: Lukas Spiss <lukas.spiss@outlook.de>

pkgname=mockoon-bin
pkgver=9.4.0
pkgrel=1
pkgdesc="Mockoon is the easiest and quickest way to run mock APIs locally."
arch=('x86_64')
url="https://mockoon.com/"
license=('MIT')
groups=('base-devel')
depends=()
source=('https://github.com/mockoon/mockoon/releases/download/v9.4.0/mockoon-9.4.0.amd64.deb')
md5sums=('3d853906fc4f572ffffdfd0d566c20d1')

package() {
	install -dm755 "${pkgdir}"/usr/bin/
   	cd "$srcdir/"
	tar -xf data.tar.xz -C "${pkgdir}"

	ln -s /opt/Mockoon/mockoon "${pkgdir}"/usr/bin/mockoon
}