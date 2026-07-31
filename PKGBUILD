# Maintainer: Lukas Spiss <lukas.spiss@outlook.de>

pkgname=mockoon-bin
pkgver=9.8.0
pkgrel=1
pkgdesc="Mockoon is the easiest and quickest way to run mock APIs locally."
arch=('x86_64' 'aarch64')
url="https://mockoon.com/"
license=('MIT')
groups=('base-devel')
depends=()
source_x86_64=('https://github.com/mockoon/mockoon/releases/download/v9.8.0/mockoon-9.8.0.amd64.deb')
source_aarch64=('https://github.com/mockoon/mockoon/releases/download/v9.8.0/mockoon-9.8.0.arm64.deb')
md5sums_x86_64=('7b3e5d589049f0d3dcb27de9cb039043')
md5sums_aarch64=('129c462180fd1727c37649e8ceefc19a')

package() {
	install -dm755 "${pkgdir}"/usr/bin/
   	cd "$srcdir/"
	tar -xf data.tar.xz -C "${pkgdir}"

	ln -s /opt/Mockoon/mockoon "${pkgdir}"/usr/bin/mockoon
}