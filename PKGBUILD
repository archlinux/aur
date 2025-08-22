pkgname=rottedfetch
pkgver=0.1.0
pkgrel=1
pkgdesc='just a sys fetch'
arch=('x86_64')
url='https://github.com/Krak9n/rottedfetch'
license=('GPL-3.0-or-later')
depends=(
  'cargo'
)
source=(git+${url}.git)
sha512sums=("SKIP")

build() {
  cd rottedfetch
  cargo install --path .
}

package() {
  echo "done"
  cd ~
}
