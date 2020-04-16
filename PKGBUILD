# Maintainer: Shayne Hartford <shayneehartford@gmail.com>

pkgname=obs-ndi-bin
_pkgname=obs-ndi
pkgver=4.8.0
pkgrel=1
_pkgrel=1
pkgdesc="Network A/V in OBS Studio with NewTek's NDI technology"
arch=('x86_64')
license=('LGPL2.0')
url="https://github.com/Palakis/${_pkgname}"
provides=('obs-ndi')
conflicts=('obs-ndi-git')
depends=('obs-studio' 'avahi' 'libndi')
source=("${url}/releases/download/${pkgver}/obs-ndi_${pkgver}-${_pkgrel}_amd64.deb")
sha256sums=('763b7bf1309d19828170ba6232a0396132d801473a40ba28431e2f26bd32fd1e')

package() {
	cd "${srcdir}"

	tar -xJf data.tar.xz -C "${pkgdir}"
}
