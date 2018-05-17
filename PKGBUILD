#Maintainer: Julius Härtl <jus@bitgrid.net>

pkgname=krankerl
pkgver=0.7.5
pkgrel=1
pkgdesc=" A CLI helper to manage, package and publish Nextcloud apps"
url="https://github.com/ChristophWurst/krankerl"
makedepends=()
arch=('x86_64')
license=('GPL-3.0')
source=("${pkgname}-${pkgver}::https://github.com/ChristophWurst/krankerl/releases/download/v${pkgver}/krankerl")
sha256sums=('9684d62f9ded593660d90316f1767c3c41b4d91df95e98e2b75cf4e6116d5c77')

package() {
  install -Dm755 "${pkgname}-${pkgver}" "$pkgdir/usr/bin/krankerl"
}

