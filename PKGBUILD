# Maintainer: ImVILLS <ваш@email.com>
pkgname=neocash
pkgver=1.0.2
<<<<<<< HEAD
pkgrel=1
=======
pkgrel=2
>>>>>>> 5dae60d (Fresh AUR submission without subdirectories)
pkgdesc="Modern shell with advanced features"
arch=('x86_64')
url="https://github.com/ImVILLS/neocash"
license=('MIT')
depends=('rust' 'git')
makedepends=('cargo')
<<<<<<< HEAD
=======
install=neocash.install
>>>>>>> 5dae60d (Fresh AUR submission without subdirectories)
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/neocash" "$pkgdir/usr/bin/neocash"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
