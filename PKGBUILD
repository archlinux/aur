# Maintainer: Jake Leahy <jake (at) lowerCaseLastName (dot) dev

pkgname=pkgbuild-updater
pkgver=0.2.0
pkgrel=1
pkgdesc="Automatic PKGBUILD updater script which fetches the new version and then pushes the update"
arch=('any')
url="https://github.com/ire4ever1190/pkgbuild-updater"
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ire4ever1190/pkgbuild-updater/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('8e78f34404b358ebc0f431065a5fb8e5f184268b4daabcdbe01a8c9362701166')
provides=('pkgbuild-updater')
depends=('jq' 'pacman-contrib')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 "pkgbuild-updater.sh" "${pkgdir}/usr/bin/pkgbuild-updater"
}
