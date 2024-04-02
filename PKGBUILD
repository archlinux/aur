# Maintainer: Lukas Spiss <lukas.spiss@outlook.de>

pkgname=mockoon-bin
pkgver=8.0.0
pkgrel=1
pkgdesc="Mockoon is the easiest and quickest way to run mock APIs locally."
arch=('x86_64')
url="https://mockoon.com/"
license=('MIT')
groups=('base-devel')
depends=()
source=('https://github.com/mockoon/mockoon/releases/download/v8.0.0/mockoon-8.0.0.amd64.deb')
md5sums=('d943cf778f4ea5e30ab8fa5f44dcb256')

package() {
	install -dm755 "${pkgdir}"/usr/bin/
   	cd "$srcdir/"
	tar -xf data.tar.xz -C "${pkgdir}"

	ln -s /opt/Mockoon/mockoon "${pkgdir}"/usr/bin/mockoon
}