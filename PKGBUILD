# Maintainer: omansh-krishn <omanshkrishn@duck.com>

pkgname=crave
pkgver=0.2.7029
_pkgver=0.2-7029
pkgrel=1
pkgdesc="Crave CLI - Binary Version"
arch=('x86_64')
url="https://github.com/accupara/crave"
license=('Proprietary')
depends=( glibc libxcrypt-compat openssh rsync zlib )
provides=('crave' 'crave-bin')
conflicts=('crave-bin')

source=( crave::https://github.com/accupara/crave/releases/download/${_pkgver}/crave-${_pkgver}-linux-amd64.bin )

sha256sums=('4ea17db37234fce019f13b9cbb070b497d80e79a7a6dea1916351471cc6c2451')

package() {

	install -dm755 "$pkgdir/usr/bin"
	install -Dm755 "$srcdir/crave" "$pkgdir/usr/bin/crave"

}
