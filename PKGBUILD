# Mainintainer : Lucas Rooyakkers <lucas dot rooyakkers at pm dot me>
pkgname=up
pkgver=0.3.1
pkgrel=3
license=('Apache')
pkgdesc="Ultimate Plumber is a tool for writing Linux pipes with instant live preview"
url="https://github.com/akavel/up"
arch=('any')
provides=('up')
makedepends=('go')
source=("up-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
md5sums=('35903a3bcf3a2e975e98c2026e404a44')

build() {
  cd "up-${pkgver}"
  go build
}

package() {
  cd "up-${pkgver}"
  install -Dm755 "up" "$pkgdir/usr/bin/up"
}
