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
source=("Shellforge-${pkgver}.tar.gz::https://github.com/minosariane/shellforge/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
  cd "Shellforge-$pkgver"
  cargo build -r
}

package() {
  cd "Shellforge-$pkgver"
  cargo install --path .
}
