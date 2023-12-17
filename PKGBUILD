# Maintainer: SelfRef <arch@selfref.dev>

_basename=mrpack-install
pkgname="${_basename}-bin"
pkgver=0.16.9
pkgrel=1
pkgdesc="Modrinth Modpack server deployment"
arch=('x86_64')
url="https://github.com/nothub/mrpack-install"
license=('MIT')
provides=('mrpack-install')
conflicts=('mrpack-install')
source=("${_basename}"::"https://github.com/nothub/mrpack-install/releases/download/v${pkgver}/mrpack-install-linux")
md5sums=('aedb13fab309ce0d425331585cfe9fca')

package() {
	install -Dm755 -t "${pkgdir}/usr/bin" "${srcdir}/mrpack-install"
}
