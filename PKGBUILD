#Maintainer: Julius Härtl <jus@bitgrid.net>

pkgname=krankerl
pkgver=0.12.2
pkgrel=1
pkgdesc=" A CLI helper to manage, package and publish Nextcloud apps"
url="https://github.com/ChristophWurst/krankerl"
makedepends=()
arch=('x86_64')
license=('GPL-3.0')
depends=('libcurl-gnutls')
source=("${pkgname}-${pkgver}::https://github.com/ChristophWurst/krankerl/releases/download/v${pkgver}/krankerl")
sha256sums=('7f468782718475598f9a8f4d5fa25ade089a7db77be794b050051c73d3a7e9d8')

package() {
  install -Dm755 "${pkgname}-${pkgver}" "$pkgdir/usr/bin/krankerl"
}

