# Maintainer: Jake Leahy <jake (at) lowerCaseLastName (dot) dev

pkgname=pkgbuild-updater
pkgver=0.1.2
pkgrel=1
pkgdesc="Automatic PKGBUILD updater script which fetches the new version and then pushes the update"
arch=('any')
url="https://github.com/ire4ever1190/pkgbuild-updater"
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ire4ever1190/pkgbuild-updater/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('beb6c2fb4b62360b910afa1a5138e597a7c2dc8900b46d8f5f8c3b55aa450ff4')
provides=('pkgbuild-updater')
depends=('jq' 'pacman-contrib')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 "pkgbuild-updater.sh" "${pkgdir}/usr/bin/pkgbuild-updater"
}
