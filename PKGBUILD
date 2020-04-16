# Maintainer: Shayne Hartford <shayneehartford@gmail.com>

pkgname=libndi-bin
_pkgname=obs-ndi
pkgver=4.5.1
_pkgver=4.8.0
pkgrel=3
_pkgrel=1
pkgdesc="Custom build of ndi-sdk from obs-ndi"
arch=('x86_64')
license=('LGPL2.0')
url="https://github.com/Palakis/${_pkgname}"
provides=('libndi')
conflicts=('libndi-git' 'ndi-sdk')
source=("${url}/releases/download/${_pkgver}/libndi4_${pkgver}-${_pkgrel}_amd64.1.deb")
sha256sums=('cbcd04e83d960b3b7cef535f75d6e4475ce24a4bdfba074ee2703f2ce7dcabb0')

package() {
	cd "${srcdir}"

	tar -xJf data.tar.xz -C "${pkgdir}"
}
