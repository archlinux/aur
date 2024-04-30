# Maintainer: Lukas Spiss <lukas.spiss@outlook.de>

pkgname=mockoon-bin
pkgver=8.1.1
pkgrel=1
pkgdesc="Mockoon is the easiest and quickest way to run mock APIs locally."
arch=('x86_64')
url="https://mockoon.com/"
license=('MIT')
groups=('base-devel')
depends=()
source=('https://github.com/mockoon/mockoon/releases/download/v8.1.1/mockoon-8.1.1.amd64.deb')
md5sums=('7b66b76c79d3b74933e66981fddf172d')

package() {
	install -dm755 "${pkgdir}"/usr/bin/
   	cd "$srcdir/"
	tar -xf data.tar.xz -C "${pkgdir}"

	ln -s /opt/Mockoon/mockoon "${pkgdir}"/usr/bin/mockoon
}