#Maintainer: Julius Härtl <jus@bitgrid.net>

pkgname=krankerl
pkgver=0.9.1
pkgrel=1
pkgdesc=" A CLI helper to manage, package and publish Nextcloud apps"
url="https://github.com/ChristophWurst/krankerl"
makedepends=()
arch=('x86_64')
license=('GPL-3.0')
source=("${pkgname}-${pkgver}::https://github.com/ChristophWurst/krankerl/releases/download/v${pkgver}/krankerl")
sha256sums=('4d8e0cf102e1a6ef1e676e49d268451b6802b70632ccf29996a9c3d6712c9bc1')

package() {
  install -Dm755 "${pkgname}-${pkgver}" "$pkgdir/usr/bin/krankerl"
}

