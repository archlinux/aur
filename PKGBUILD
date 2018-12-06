# Mainintainer : Lucas Rooyakkers <lucas dot rooyakkers at pm dot me>
pkgname=up
pkgver=0.3.2
pkgrel=1
license=('Apache')
pkgdesc="Ultimate Plumber is a tool for writing Linux pipes with instant live preview"
url="https://github.com/akavel/up"
arch=('any')
provides=('up')
makedepends=('go')
source=("up-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
md5sums=('8af47f9d48d0a6b428b843c5c107244f')

build() {
  cd "up-${pkgver}"
  go build
}

package() {
  cd "up-${pkgver}"
  install -Dm755 "up" "$pkgdir/usr/bin/up"
}
