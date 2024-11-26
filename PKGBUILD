# Maintainer: Omansh Krishn <omansh@duck.com>

pkgname=crave
_pkgver=0.2-7049
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

sha256sums=('6a8b6abff0ec919ab46e540f69aee77c497d6b04e7ad0f5f8f2ec3697aa90630')

package() {

	install -dm755 "${pkgdir}/usr/bin"
	install -Dm755 "${srcdir}/crave-${_pkgver}" "${pkgdir}/usr/bin/crave"

}
