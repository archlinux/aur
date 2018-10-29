# Mainintainer : Lucas Rooyakkers <lucas dot rooyakkers at pm dot me>
pkgname=up
pkgver=0.3
pkgrel=2
license=('Apache')
pkgdesc="Ultimate Plumber is a tool for writing Linux pipes with instant live preview"
url="https://github.com/akavel/up"
arch=('any')
provides=('up')
source=("up-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
md5sums=('612b7d1271120238a79a0c1e355c6aba')

build() {
  cd "up-${pkgver}"
  go build
}

package() {
  cd "up-${pkgver}"
  install -Dm755 "up" "$pkgdir/usr/bin/up"
}
