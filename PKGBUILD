# Maintainer: Étienne Deparis <etienne@depar.is>
pkgname=chwall
pkgver=0.4.1
pkgrel=1
pkgdesc="A tiny wallpaper changer, written in python"
arch=("any")
url="https://git.deparis.io/chwall/about/"
license=("WTFPL")
depends=("gtk3" "python-cssselect" "python-gobject" "python-lxml"
         "python-requests" "python-xdg" "python-yaml")
makedepends=("python-setuptools" "imagemagick")
source=("https://git.deparis.io/${pkgname}/snapshot/${pkgname}-${pkgver}.tar.gz")
sha256sums=('6daeb1e54571284ba5affba5b7d3155b7dfa5f78d0775888a311b28c4c03a9b6')

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make ROOT="$pkgdir/" dist
}
