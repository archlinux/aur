# Maintainer: Lukas Spiss <lukas.spiss@outlook.de>

pkgname=mockoon-bin
pkgver=9.10.0
pkgrel=1
pkgdesc="Mockoon is the easiest and quickest way to run mock APIs locally."
arch=('x86_64' 'aarch64')
url="https://mockoon.com/"
license=('MIT')
groups=('base-devel')
depends=()
source_x86_64=('https://github.com/mockoon/mockoon/releases/download/v9.10.0/mockoon-9.10.0.amd64.deb')
source_aarch64=('https://github.com/mockoon/mockoon/releases/download/v9.10.0/mockoon-9.10.0.arm64.deb')
md5sums_x86_64=('14b241848808dc18e5c9081cbd9aabc7')
md5sums_aarch64=('76ac4f5d9606dc8180e1056326074081')

package() {
	install -dm755 "${pkgdir}"/usr/bin/
   	cd "$srcdir/"
	tar -xf data.tar.xz -C "${pkgdir}"

	ln -s /opt/Mockoon/mockoon "${pkgdir}"/usr/bin/mockoon
}