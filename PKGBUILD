# Maintainer: Benoît Giraudou <bgiraudou @ gmail.com>
relpkgname=obs-ndi
pkgname=${relpkgname}-bin
pkgver=4.3.0
pkgrel=1
pkgdesc="Network A/V in OBS Studio with NewTek's NDI technology"
arch=('x86_64')
license=('LGPL2.1')
url="https://github.com/Palakis/obs-ndi"
depends=('libndi3')

source=("${url}/releases/download/${pkgver}/${relpkgname}_${pkgver}-${pkgrel}_amd64.deb")
sha256sums=('a94ca001b6a0477d95e58ba8bafdc39ec005f9a8312d8c88d27a378ae28aa621')

package() {
	cd "${srcdir}"

	tar -xJf data.tar.xz -C "${pkgdir}"
}
