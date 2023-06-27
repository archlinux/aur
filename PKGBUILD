# Maintainer: Jake Leahy <jake (at) lowerCaseLastName (dot) dev

pkgname=pkgbuild-updater
pkgver=0.1.1
pkgrel=1
pkgdesc="Automatic PKGBUILD updater script which fetches the new version and then pushes the update"
arch=('any')
url="https://github.com/ire4ever1190/pkgbuild-updater"
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ire4ever1190/pkgbuild-updater/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('2b1877e9a8190c24b7931947f9137dae7b85c4b5281d78cb6b1900df8b4232a8')
provides=('pkgbuild-updater')
depends=('jq' 'pacman-contrib')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 "pkgbuild-updater.sh" "${pkgdir}/usr/bin/pkgbuild-updater"
}
