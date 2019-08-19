# Maintainer: Salif Mehmed <salif@programmer.net>
pkgname=projstats
pkgver=1908.20.0
pkgrel=1
pkgdesc="Count source lines of code"
arch=("x86_64")
url="https://github.com/salifm/projstats"
license=("MIT")
depends=("java-runtime")
source=("$pkgname-$pkgver-linux.zip::https://github.com/salifm/projstats/releases/download/v${pkgver}/projstats-v${pkgver}-linux.zip")
sha512sums=('2793ab64b46553360240510c5f12a07ff3ecdbf4edec2b7352e6a016bc71f54e372bfd3b93db49afde26c2f1369dbb2c43faa9b05bc9634e6bfaad42e6d09ed0')
package() {
  cd "$pkgname-v$pkgver-linux"
  make DESTDIR="$pkgdir/" install
}
