# Maintainer: antechnologic <antechnologic@pm.me>
# Contributor: Sheng Yu <magicfish1990@gmail.com>
# Contributor: Alex Talker <alextalker@yandex.ru>
pkgname=udptunnel
pkgver=r19
pkgrel=2
pkgdesc="Tunnels TCP over UDP packets."
arch=('i686' 'x86_64')
url="http://code.google.com/p/udptunnel/"
license=('GPL3')
groups=()
depends=()
makedepends=('gcc')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/$pkgname/$pkgname-$pkgver.tar.gz)
noextract=()
md5sums=('277088842a092ac34977b371f9b24fc3')

build() {
  cd "$srcdir/$pkgname"
  make
}

package() {
  cd "$srcdir/$pkgname"
  install -d -m 755 "$pkgdir/usr/bin/"
  install -D -m 755 udptunnel "$pkgdir/usr/bin/"
}
