# Maintainer: mexus <gilaldpellaeon@gmail.com>
pkgname=dua-cli
pkgver=2.1.2
pkgrel=1
pkgdesc="A tool to conveniently learn about the disk usage of directories, fast!"
arch=('x86_64')
url="https://crates.io/crates/$pkgname/$pkgver"
license=('MIT')
depends=()
makedepends=('cargo')

package() {
  cargo install "$pkgname" --version "$pkgver" --root "$pkgdir/usr"
  rm "$pkgdir/usr/.crates.toml"
}
