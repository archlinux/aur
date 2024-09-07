# Maintainer: Omansh Krishn <omanshkrishn@duck.com>

pkgname=crave
pkgver=0.2.7033
_pkgver=0.2-7033
pkgrel=1
pkgdesc="Crave CLI - Binary Version"
arch=('x86_64')
url="https://github.com/accupara/crave"
license=('Proprietary')
depends=( glibc libxcrypt-compat openssh rsync zlib )
provides=('crave' 'crave-bin')
conflicts=('crave-bin')

source=( crave::https://github.com/accupara/crave/releases/download/${_pkgver}/crave-${_pkgver}-linux-amd64.bin )

sha256sums=('69aeabe2112ccd651874e14785dc6100bd2012e9d7491d5002453ee763a4d987')

package() {

	install -dm755 "$pkgdir/usr/bin"
	install -Dm755 "$srcdir/crave" "$pkgdir/usr/bin/crave"

}
