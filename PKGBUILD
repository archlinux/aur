# Maintainer: Thomas Hine <thomas @ thomashine.xyz>
pkgname=obs-ndi
_pkgname=${pkgname%-bin}
pkgver=4.6.0
_pkgbuild=1
pkgrel=1
pkgdesc="Network A/V in OBS Studio with NewTek's NDI technology"
arch=('x86_64')
license=('LGPL2.0')
url="https://github.com/Palakis/obs-ndi"
provides=('obs-ndi')
conflicts=('obs-ndi-git')
depends=('obs-studio' 'ndi-sdk' 'avahi')

source=("${url}/releases/download/${pkgver}/${pkgname}_${pkgver}-${_pkgbuild}_amd64.deb")
sha256sums=('eaf0d451527037b0e1b9af5ad69a3aaffc7b583819a45d6f774e846cd2253e03')

package() {
	cd "${srcdir}"

	tar -xJf data.tar.xz -C "${pkgdir}"
}
