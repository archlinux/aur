# Maintainer: Jacob Humphrey (kaknife) <jacob.ryan.humphrey@gmail.com>


pkgname=gnome-shell-extension-ubuntu-dock 
pkgver=0.8.1
pkgrel=1
pkgdesc="The gnome extension that provides the new ubuntu dock"
url="https://github.com/micheleg/dash-to-dock/tree/ubuntu-dock"
arch=(any)
license=(GPL)
depends=(gnome-shell)
makedepends=(git)
sha256sums=("07dff979b646ee00427045a72698ec0fb2993174e41a874471c41b2bc075c64f")
source=("http://archive.ubuntu.com/ubuntu/pool/main/g/gnome-shell-extension-ubuntu-dock/${pkgname}_${pkgver}.tar.xz")

prepare() {
  bsdtar xf ${pkgname}_${pkgver}.tar.xz
}

package() {
  cd dash-to-dock
  make DESTDIR="$pkgdir" install
}
