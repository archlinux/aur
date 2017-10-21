# Maintainer: Jacob Humphrey (kaknife) <jacob.ryan.humphrey@gmail.com>


pkgname=gnome-shell-extension-ubuntu-dock 
pkgver=0.7
pkgrel=1
pkgdesc="The gnome extension that provides the new ubuntu dock"
url="https://github.com/micheleg/dash-to-dock/tree/ubuntu-dock"
arch=(any)
license=(GPL)
depends=(gnome-shell)
makedepends=(git)
md5sums=("26df785c9a7011764e330eee34d4979c")
source=("http://archive.ubuntu.com/ubuntu/pool/main/g/gnome-shell-extension-ubuntu-dock/${pkgname}_${pkgver}.tar.xz")

prepare() {
  bsdtar xf ${pkgname}_${pkgver}.tar.xz
}

package() {
  cd dash-to-dock
  make DESTDIR="$pkgdir" install
}
