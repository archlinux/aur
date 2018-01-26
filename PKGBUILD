# Maintainer: Benoît Giraudou <bgiraudou @ gmail.com>
relpkgname=obs-ndi
pkgname=${relpkgname}-bin
pkgver=4.2.2
pkgrel=1
pkgdesc="Network A/V in OBS Studio with NewTek's NDI technology"
arch=('x86_64')
license=('LGPL2.1')
url="https://github.com/Palakis/obs-ndi"
depends=('libndi3')

source=("${url}/releases/download/${pkgver}/${relpkgname}_${pkgver}-${pkgrel}_amd64.deb")
sha256sums=('a948faea607e61b63cfc2b88677632055f0741748eadf6ce56aa8c9d72e80f45')

package() {
	cd "${srcdir}"

	tar -xJf data.tar.xz -C "${pkgdir}"
}
