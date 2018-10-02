# Maintainer: Benoît Giraudou <bgiraudou @ gmail.com>
# Updated by: Thomas Hine <thomas@thomashine.xyz>
relpkgname=obs-ndi
pkgname=${relpkgname}-bin
pkgver=4.5.2
_pkgbuild=1
pkgrel=3
pkgdesc="Network A/V in OBS Studio with NewTek's NDI technology"
arch=('x86_64')
license=('LGPL2.1')
url="https://github.com/Palakis/obs-ndi"
depends=('ndi-sdk' 'avahi')

source=("${url}/releases/download/${pkgver}/${relpkgname}_${pkgver}-${_pkgbuild}_amd64.deb")
sha256sums=('9d525c4645e7dce38aceb06480225702f9f4bda3acdd34168522931a10742180')

package() {
	cd "${srcdir}"

	tar -xJf data.tar.xz -C "${pkgdir}"
}
