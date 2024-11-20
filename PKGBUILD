# Maintainer: Omansh Krishn <omansh@duck.com>

pkgname=crave
pkgver=0.2.7043
_pkgver=0.2-7043
pkgrel=1
pkgdesc="Crave CLI - Binary Version"
arch=('x86_64')
url="https://github.com/accupara/crave"
license=('Proprietary')
depends=( glibc libxcrypt-compat openssh rsync zlib )
provides=('crave' 'crave-bin')
conflicts=('crave-bin')

source=( crave-${_pkgver}::https://github.com/accupara/crave/releases/download/${_pkgver}/crave-${_pkgver}-linux-amd64.bin )

sha256sums=('5838ecb9bab91a5f6be117567e68f0b24c3e66e3740c80f5770bb9e91c65db6a')

package() {

	install -dm755 "${pkgdir}/usr/bin"
	install -Dm755 "${srcdir}/crave-${_pkgver}" "${pkgdir}/usr/bin/crave"

}
