# Maintainer: Cyker Way <cykerway at gmail dot com>

pkgname=torita
pkgver=1.2
pkgrel=1
epoch=
pkgdesc="A torrent-aware package downloader."
arch=('i686' 'x86_64')
url="https://github.com/cykerway/torita"
license=('GPL3')
groups=()
depends=('aria2' 'mktorrent')
makedepends=()
checkdepends=()
optdepends=('curl' 'wget')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/cykerway/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('d8f2ae4771cc341181ede8aabf4fd321eb088194b299745c66bbb9224d624d56')
noextract=()
validpgpkeys=()

build() {
	cd "$pkgname-$pkgver"
#	./configure --prefix=/usr
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}

