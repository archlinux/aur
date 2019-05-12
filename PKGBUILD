# Maintainer: Michael Picht <michael.picht@ussenterprise.de>

pkgorg=github.com/mipimipi
pkgname=crema-git
_pkgname=crema
pkgver=1.0
pkgrel=1
pkgdesc="Manage your custom Arch Linux repository"
arch=('any')
url="https://$pkgorg/$_pkgname"
license=('GPL3')
source=("git://$pkgorg/$_pkgname.git")
md5sums=(SKIP)
depends=('aurutils')

package() {
  cd "$srcdir/$_pkgname"

  install -D -m 755 $_pkgname "$pkgdir/usr/bin"
}
