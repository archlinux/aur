# Maintainer: Attenuation <ouyangjun1999@gmail.com>
pkgname=accepted
pkgver=20190211.074029
pkgrel=1
pkgdesc='A terminal text editor to be ACCEPTED'
arch=('x86_64')
url='https://github.com/hatoo/Accepted'
license=('MIT')
makedepends=('rust')
depends=()
source=("${pkgname}::git+${url}")
sha256sums=('SKIP')

build() {
  cd "$pkgname"
  cargo build --release
}

package() {
  cd "$pkgname"
  install -Dm755 target/release/acc "$pkgdir/usr/bin/acc"
}
