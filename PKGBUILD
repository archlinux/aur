# Maintainer: Erdal Mutlu <erdalmutlu at yahoo dot com>
pkgname=sisiya-client
pkgver=1.0.63
pkgrel=1
epoch=
pkgdesc="The SisIYA client. This package is installed on every server that is going to be monitored by SisIYA."
arch=('any')
url="https://sisiya.de"
license=('GPL3')
groups=()
depends=('python3' 'sysstat')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=('etc/sisiya-client/config.json')
options=()
install=
changelog=
#source=("$pkgname-$pkgver.tar.gz")
source=("https://gitlab.com/api/v4/projects/70802198/packages/generic/$pkgname/$pkgver/$pkgname-$pkgver.tar.gz")
noextract=()
md5sums=('af950c032c4eefb424fde83a783c26a8') #generate with 'makepkg -g'

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make "DESTDIR=$pkgdir/" install
}
