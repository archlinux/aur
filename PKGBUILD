# Maintainer: Jacob Humphrey (kaknife) <jacob.ryan.humphrey@gmail.com>


pkgname=gnome-shell-extension-ubuntu-dock 
pkgver=0.7.1
pkgrel=1
pkgdesc="The gnome extension that provides the new ubuntu dock"
url="https://github.com/micheleg/dash-to-dock/tree/ubuntu-dock"
arch=(any)
license=(GPL)
depends=(gnome-shell)
makedepends=(git)
sha256sums=("b239c68ea7f387893d1910335bcf0431af01f2e4e4b6807ed5132653cd5fb0b4")
source=("http://archive.ubuntu.com/ubuntu/pool/main/g/gnome-shell-extension-ubuntu-dock/${pkgname}_${pkgver}.tar.xz")

prepare() {
  bsdtar xf ${pkgname}_${pkgver}.tar.xz
}

package() {
  cd dash-to-dock
  make DESTDIR="$pkgdir" install
}
