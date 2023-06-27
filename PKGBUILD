# Maintainer: Jake Leahy <jake (at) lowerCaseLastName (dot) dev

pkgname=pkgbuild-updater
pkgver=0.1.1
pkgrel=2
pkgdesc="Automatic PKGBUILD updater script which fetches the new version and then pushes the update"
arch=('any')
url="https://github.com/ire4ever1190/pkgbuild-updater"
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ire4ever1190/pkgbuild-updater/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('da3630b28486b29cd28fd9b22c8be94464d8d137a14e485cef0d39d260f21348')
provides=('pkgbuild-updater')
depends=('jq' 'pacman-contrib')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 "pkgbuild-updater.sh" "${pkgdir}/usr/bin/pkgbuild-updater"
}
