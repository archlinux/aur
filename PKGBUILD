# Maintainer: Étienne Deparis <etienne@depar.is>
pkgname=chwall
pkgver=0.4.5
pkgrel=2
pkgdesc="A tiny wallpaper changer, written in python"
arch=("any")
url="https://git.deparis.io/chwall/about/"
license=("WTFPL")
depends=("gtk3" "python-cssselect" "python-gobject" "python-lxml"
         "python-requests" "python-xdg" "python-yaml")
makedepends=("python-setuptools" "imagemagick")
source=("https://git.deparis.io/${pkgname}/snapshot/${pkgname}-${pkgver}.tar.gz")
sha256sums=('ca66837f72789dcea7f2a0ef3b1538477355432c249ff8e37db48f6983cded19')

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make dist DESTDIR="$pkgdir"
}
