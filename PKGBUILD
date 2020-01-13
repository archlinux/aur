#Maintainer: Julius Härtl <jus@bitgrid.net>

pkgname=krankerl
pkgver=0.11.0
pkgrel=1
pkgdesc=" A CLI helper to manage, package and publish Nextcloud apps"
url="https://github.com/ChristophWurst/krankerl"
makedepends=()
arch=('x86_64')
license=('GPL-3.0')
depends=('libcurl-gnutls')
source=("${pkgname}-${pkgver}::https://github.com/ChristophWurst/krankerl/releases/download/v${pkgver}/krankerl")
sha256sums=('b3b3750999264aeb6799583360ec9bf6900e2bb007f8ea56e1c57c0923139155')

package() {
  install -Dm755 "${pkgname}-${pkgver}" "$pkgdir/usr/bin/krankerl"
}

