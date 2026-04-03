pkgname=noted
pkgver=1.0.0
pkgrel=1
pkgdesc="A terminal note-taking app with a built-in TUI"
arch=('x86_64')
license=('MIT')
depends=('libsodium')
source=("https://github.com/Thalia-the-nerd/noted/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
  cd "$pkgname-$pkgver"
  make
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 noted "$pkgdir/usr/bin/noted"
}
