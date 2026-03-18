#Maintainer: Mickael Guillerm <mickael.grm@gmail.com>
pkgname=shellforge
pkgdesc='Easy-to-use reverse shell generator'
pkgver=1.0.0
pkgrel=1
arch=('x86_64')
url=https://github.com/minosariane/Shellforge
license=('GPL-3.0-only')
depends=()
makedepends=('rust' 'cargo')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/minosariane/Shellforge/archive/refs/tags/1.0.0.tar.gz")
sha256sums=('SKIP')

build() {
  cd "$pkgname-$pkgver"
  cargo build -r
}

package() {
  cd "$pkgname-$pkgver"
  cargo install --path .
}
