# Maintainer: Samuel Åkesson <sermuns@lysator.liu.se>
pkgname=stil
pkgver=
pkgrel=1
pkgdesc="generate STatic site from Index Listing of directory"
url="https://github.com/sermuns/stil"
license=("WTFPL")
provides=("stil")
conflicts=("stil")
source=("https://github.com/sermuns/stil/archive/refs/tags/v$pkgver=
arch=('x86_64')
makedepends=('cargo')
sha256sums=('d5558cd419c8d46bdc958064cb97f963d1ea793866414c025906ec15033512ed')
options=(!debug)

build() {
  cd "stil-$pkgver=
  cargo build --release
}

package() {
  cd "stil-$pkgver=
  install -Dm755 target/release/$pkgname "$pkgdir/usr/bin/$pkgname"
}
