# Maintainer: Lukas Spiss <lukas.spiss@outlook.de>

pkgname=mockoon-bin
pkgver=9.7.0
pkgrel=1
pkgdesc="Mockoon is the easiest and quickest way to run mock APIs locally."
arch=('x86_64' 'aarch64')
url="https://mockoon.com/"
license=('MIT')
groups=('base-devel')
depends=()
source_x86_64=('https://github.com/mockoon/mockoon/releases/download/v9.6.1/mockoon-9.6.1.amd64.deb')
source_aarch64=('https://github.com/mockoon/mockoon/releases/download/v9.6.1/mockoon-9.6.1.arm64.deb')
md5sums_x86_64=('ee77d27277f7d3616ce110c56ce54fd8')
md5sums_aarch64=('8851f62ab5cb0c14440352945d3ca7e1')

package() {
	install -dm755 "${pkgdir}"/usr/bin/
   	cd "$srcdir/"
	tar -xf data.tar.xz -C "${pkgdir}"

	ln -s /opt/Mockoon/mockoon "${pkgdir}"/usr/bin/mockoon
}