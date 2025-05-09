# Maintainer: Omansh Krishn <omansh@duck.com>

pkgname=crave
_pkgver=0.2-7085
pkgver="${_pkgver/-/.}"
pkgrel=1
pkgdesc="Crave CLI - Binary Version"
arch=('x86_64')
url="https://github.com/accupara/crave"
license=('Proprietary')
depends=( 'glibc' 'libxcrypt-compat' 'openssh' 'rsync' 'zlib' )
provides=('crave' 'crave-bin')
conflicts=('crave-bin')

source=( crave-${_pkgver}::https://github.com/accupara/crave/releases/download/${_pkgver}/crave-${_pkgver}-linux-amd64.bin )

sha256sums=('ec681d1779fe614d818bd357c53cfd0b1a61a505274084c131bb9ba913d13467')

package() {

	install -dm755 "${pkgdir}/usr/bin"
	install -Dm755 "${srcdir}/crave-${_pkgver}" "${pkgdir}/usr/bin/crave"

}
