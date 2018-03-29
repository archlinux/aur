# Maintainer: Benoît Giraudou <bgiraudou @ gmail.com>
relpkgname=obs-ndi
pkgname=${relpkgname}-bin
pkgver=4.4.0
pkgrel=1
pkgdesc="Network A/V in OBS Studio with NewTek's NDI technology"
arch=('x86_64')
license=('LGPL2.1')
url="https://github.com/Palakis/obs-ndi"
depends=('libndi3')

source=("${url}/releases/download/${pkgver}/${relpkgname}_${pkgver}-${pkgrel}_amd64.deb")
sha256sums=('e2ee5e945fffa29c412c9699e329e90832322f102edc46c75bdbd0dc28bfd329')

package() {
	cd "${srcdir}"

	tar -xJf data.tar.xz -C "${pkgdir}"
}
