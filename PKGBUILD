# Maintainer: Jacob Humphrey (kaknife) <jacob.ryan.humphrey@gmail.com>


pkgname=gnome-shell-extension-ubuntu-dock 
pkgver=0.9.1
pkgrel=1
pkgdesc="The gnome extension that provides the new ubuntu dock"
url="https://github.com/micheleg/dash-to-dock/tree/ubuntu-dock"
arch=(any)
license=(GPL)
depends=(gnome-shell)
makedepends=(git)
sha256sums=("bc5aa040fe325cdcbb193fb5269701a6a6f0746d31910d56f23ce576aee31194")
source=("http://archive.ubuntu.com/ubuntu/pool/main/g/gnome-shell-extension-ubuntu-dock/${pkgname}_${pkgver}.tar.xz")

prepare() {
  bsdtar xf ${pkgname}_${pkgver}.tar.xz
}

package() {
  cd dash-to-dock
  make DESTDIR="$pkgdir" install
}
