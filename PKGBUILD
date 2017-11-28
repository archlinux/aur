#Maintainer: Julius Härtl <jus@bitgrid.net>

pkgname=krankerl
pkgver=0.4.2
pkgrel=1
pkgdesc=" A CLI helper to manage, package and publish Nextcloud apps"
url="https://github.com/ChristophWurst/krankerl"
makedepends=('cargo')
arch=('i686' 'x86_64')
license=('GPL-3.0')
source=("${pkgname}::https://github.com/ChristophWurst/krankerl/releases/download/v0.4.2/krankerl")
sha256sums=('1f198e78111cf2a6439d2d7359bec16f1481ea9f78607f8ff39c2a1ddfc9eae9')

package() {
  install -Dm755 $pkgname "$pkgdir/usr/bin/krankerl"
}

