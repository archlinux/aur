# Maintainer: Shayne Hartford <shayneehartford@gmail.com>

pkgname=obs-ndi-bin
_pkgname=obs-ndi
pkgver=4.9.0
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
sha256sums=('eb8b30007e8d0521ea0e7b41da8d9ad1dc89404cfdc390ccf832ab7d1c66050e')

package() {
	cd "${srcdir}"

	tar -xJf data.tar.xz -C "${pkgdir}"
}
