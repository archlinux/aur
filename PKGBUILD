# Maintainer: Hasan Pasha <bashahsn22@gmail.com>

pkgname=balena-etcher-bin
pkgver=1.18.11
pkgrel=1
pkgdesc="Flash OS images to SD cards & USB drives, safely and easily. (DEB version)"
arch=('x86_64')
url="https://github.com/balena-io/etcher"
license=("Apache-2.0")
source=("https://github.com/balena-io/etcher/releases/download/v${pkgver}/balena-etcher_${pkgver}_amd64.deb")
sha256sums=('890838ead6683d67e68427c9d40a22aa3ff71431a58dce5de8b7a5c8a18c172e')

package() {
	tar -xf data.tar.bz2 -C "${pkgdir}"
	mkdir -p "${pkgdir}/usr/local/bin"
	ln -s "/opt/balenaEtcher/balena-etcher" "${pkgdir}/usr/local/bin/balena-etcher" 
}
