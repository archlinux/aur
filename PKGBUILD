# Maintainer: Omansh Krishn <omansh@duck.com>

pkgname=crave
pkgver=0.2.7045
_pkgver=0.2-7045
pkgrel=1
pkgdesc="Crave CLI - Binary Version"
arch=('x86_64')
url="https://github.com/accupara/crave"
license=('Proprietary')
depends=( glibc libxcrypt-compat openssh rsync zlib )
provides=('crave' 'crave-bin')
conflicts=('crave-bin')

source=( crave-${_pkgver}::https://github.com/accupara/crave/releases/download/${_pkgver}/crave-${_pkgver}-linux-amd64.bin )

sha256sums=('e106baec68b4c6977a46992299a5f438f1203ba0b5025d3b6ed05bcd3448785f')

package() {

	install -dm755 "${pkgdir}/usr/bin"
	install -Dm755 "${srcdir}/crave-${_pkgver}" "${pkgdir}/usr/bin/crave"

}
