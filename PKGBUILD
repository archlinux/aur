# Maintainer: Jacob Humphrey (kaknife) <jacob.ryan.humphrey@gmail.com>


pkgname=gnome-shell-extension-ubuntu-dock 
pkgver=0.9
pkgrel=1
pkgdesc="The gnome extension that provides the new ubuntu dock"
url="https://github.com/micheleg/dash-to-dock/tree/ubuntu-dock"
arch=(any)
license=(GPL)
depends=(gnome-shell)
makedepends=(git)
sha256sums=("cd708d2e923e01af73d1e1d4f4c7a739469c44692c066e027cfacd2bf7269683")
source=("http://archive.ubuntu.com/ubuntu/pool/main/g/gnome-shell-extension-ubuntu-dock/${pkgname}_${pkgver}.tar.xz")

prepare() {
  bsdtar xf ${pkgname}_${pkgver}.tar.xz
}

package() {
  cd dash-to-dock
  make DESTDIR="$pkgdir" install
}
