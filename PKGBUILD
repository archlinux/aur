# Maintainer: SelfRef <arch@selfref.dev>

_basename=mrpack-install
pkgname="${_basename}-bin"
pkgver=0.16.10
pkgrel=2
pkgdesc="Modrinth Modpack server deployment"
arch=('x86_64')
url="https://github.com/nothub/mrpack-install"
license=('MIT')
provides=('mrpack-install')
conflicts=('mrpack-install')
source=("${_basename}"::"https://github.com/nothub/mrpack-install/releases/download/v${pkgver}/mrpack-install-linux")
sha256sums=('01eb5c05423a7a94a7f844bde946c1963e296ecd9757c770923aeaf933f06bc1')

package() {
	install -Dm755 -t "${pkgdir}/usr/bin" "${srcdir}/mrpack-install"
}
