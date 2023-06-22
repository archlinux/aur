# Maintainer: Jake Leahy <jake (at) lowerCaseLastName (dot) dev

pkgname=pkgbuild-updater
pkgver=0.1.0
pkgrel=1
pkgdesc="Automatic PKGBUILD updater script which fetches the new version and then pushes the update"
arch=('any')
url="https://github.com/ire4ever1190/pkgbuild-updater"
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ire4ever1190/pkgbuild-updater/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('a0fd18d720f52c3dac0fd4c0ef871ff0738a9efba4bf3673af18834a342a1784')
provides=('pkgbuild-updater')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 "pkgbuild-updater.sh" "${pkgdir}/usr/bin/pkgbuild-updater"
}
