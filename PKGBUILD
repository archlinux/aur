# Maintainer: Lukas Spiss <lukas.spiss@outlook.de>

pkgname=mockoon-bin
pkgver=9.7.0
pkgrel=2
pkgdesc="Mockoon is the easiest and quickest way to run mock APIs locally."
arch=('x86_64' 'aarch64')
url="https://mockoon.com/"
license=('MIT')
groups=('base-devel')
depends=()
source_x86_64=('https://github.com/mockoon/mockoon/releases/download/v9.7.0/mockoon-9.7.0.amd64.deb')
source_aarch64=('https://github.com/mockoon/mockoon/releases/download/v9.7.0/mockoon-9.7.0.arm64.deb')
md5sums_x86_64=('63b236d40cb73b2118e2054d00a0cd3b')
md5sums_aarch64=('a69e6daa3e7cfa8dc9d343475500c351')

package() {
	install -dm755 "${pkgdir}"/usr/bin/
   	cd "$srcdir/"
	tar -xf data.tar.xz -C "${pkgdir}"

	ln -s /opt/Mockoon/mockoon "${pkgdir}"/usr/bin/mockoon
}