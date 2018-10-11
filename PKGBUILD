# Maintainer: Thomas Hine <thomas @ thomashine.xyz>
relpkgname=obs-ndi
pkgname=${relpkgname}-bin
pkgver=4.5.3
_pkgbuild=1
pkgrel=1
pkgdesc="Network A/V in OBS Studio with NewTek's NDI technology"
arch=('x86_64')
license=('LGPL2.0')
url="https://github.com/Palakis/obs-ndi"
depends=('obs-studio' 'ndi-sdk' 'avahi')

source=("${url}/releases/download/${pkgver}/${relpkgname}_${pkgver}-${_pkgbuild}_amd64.deb")
sha256sums=('76811c32516e21efc5b72360aae2921392d1924bf2247ab13831cbc128d0a6c6')

package() {
	cd "${srcdir}"

	tar -xJf data.tar.xz -C "${pkgdir}"
}
