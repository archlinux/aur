# Maintainer: Omansh Krishn <omansh@duck.com>

pkgname=crave
_pkgver=0.2-7183
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

sha256sums=('f1284a43b79cb3e99b9279ff20006d8e4001b2b34c1904e7fe9263bbfcc6655a')

package() {

	install -dm755 "${pkgdir}/usr/bin"
	install -Dm755 "${srcdir}/crave-${_pkgver}" "${pkgdir}/usr/bin/crave"

}
