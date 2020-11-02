# Mainintainer : Lucas Rooyakkers <lucas dot rooyakkers at pm dot me>
pkgname=up
pkgver=0.4
pkgrel=1
license=('Apache')
pkgdesc="Ultimate Plumber is a tool for writing Linux pipes with instant live preview"
url="https://github.com/akavel/up"
arch=('any')
provides=('up')
makedepends=('go')
source=("up-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
md5sums=('f7e47196a82a8a98c55812c6ba2d94b3')

build() {
  cd "up-${pkgver}"
  go build
}

package() {
  cd "up-${pkgver}"
  install -Dm755 "up" "$pkgdir/usr/bin/up"
}
