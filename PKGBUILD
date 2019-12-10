# Maintainer: Igor Wong <983 at protonmail dot com>
pkgname=ya_test_pkg
pkgver=1
pkgrel=1
pkgdesc="Yet another test pkg"
arch=('any')
license=('custom')

package() {
  mkdir -p $pkgdir/usr/bin
  echo 'echo hello, world!' > $pkgdir/usr/bin/ya_test_pkg
  chmod +x $pkgdir/usr/bin/ya_test_pkg
}
