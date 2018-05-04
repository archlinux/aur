# Maintainer: Papajoker <papajoke [at] manjaro [dot] fr>
pkgname=pkcreate
pkgver=0.8.0
pkgrel=1
pkgdesc="create actions for polkit"
arch=('any')
license=('GPL')
depends=('polkit')
source=("pkcreate")
sha512sums=('c64620b52b8d40f4f5cd45cd1fb480c4ca59e63b154852a44698ef983844f1def278f6e6cdd3446501d4d1b7bbda3d70112f1fd59daa57b8af1b27b79fb8f95d')


package() {
  cd "$srcdir"
  install -Dm755 ${pkgname} ${pkgdir}/usr/bin/${pkgname}
}

