# Maintainer: Erdal Mutlu <erdalmutlu at yahoo dot com>
pkgname=sisiya-client
pkgver=1.0.78
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
md5sums=('7e6aceb3e3f500c60735c69a30348cba')

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make "DESTDIR=$pkgdir/" install install_systemd_files
}
