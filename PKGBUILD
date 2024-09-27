# Maintainer: Omansh Krishn <omansh@duck.com>

pkgname=crave
pkgver=0.2.7037
_pkgver=0.2-7037
pkgrel=1
pkgdesc="Crave CLI - Binary Version"
arch=('x86_64')
url="https://github.com/accupara/crave"
license=('Proprietary')
depends=( glibc libxcrypt-compat openssh rsync zlib )
provides=('crave' 'crave-bin')
conflicts=('crave-bin')

source=( crave::https://github.com/accupara/crave/releases/download/${_pkgver}/crave-${_pkgver}-linux-amd64.bin )

sha256sums=('4c959ec66545c1d968585ef4d39c7ce9886175261bab503e1a8fade6bd347c12')

package() {

	install -dm755 "$pkgdir/usr/bin"
	install -Dm755 "$srcdir/crave" "$pkgdir/usr/bin/crave"

}
