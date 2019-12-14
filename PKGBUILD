# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>
# Contributor:

pkgbase=breeze-extra
pkgname=(breeze-extra breeze-extra-gnome)
pkgver=20191214
pkgrel=1
pkgdesc='Breeze extra icons for GNOME & KDE'
arch=(any)
url='https://store.kde.org/p/1184525/'
license=(GPL3)
makedepends=(git)
_commit=d57f02d82c65923ebca473bc599fc6562dcb77db
source=("${pkgbase}::git+https://github.com/varlesh/breeze-extra.git#commit=$_commit")
sha256sums=('SKIP')

package_breeze-extra() {
  install -d "$pkgdir/usr/share/icons/"
  cp -r "$pkgbase/$pkgname" "$pkgdir/usr/share/icons/"
}

package_breeze-extra-gnome() {
  install -d "$pkgdir/usr/share/icons/"
  cp -r "$pkgbase/$pkgname" "$pkgdir/usr/share/icons/"
}
