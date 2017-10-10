# Maintainer: Benoît Giraudou <bgiraudou @ gmail.com>
relpkgname=obs-ndi
pkgname=${relpkgname}-bin
pkgver=4.1.3
pkgrel=1
pkgdesc="Network A/V in OBS Studio with NewTek's NDI technology"
arch=('x86_64')
license=('LGPL2.1')
url="https://github.com/Palakis/obs-ndi"
depends=('libndi3')

source=("${url}/releases/download/${pkgver}/${relpkgname}_${pkgver}-${pkgrel}_amd64.deb")
sha256sums=('9f5316bfe50f2ea6ca6e80c872046b6aa6f08fe2d155b8365665e949ffe38a2d')

package() {
	cd "${srcdir}"

	tar -xJf data.tar.xz -C "${pkgdir}"
}
