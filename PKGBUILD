# Maintainer: Étienne Deparis <etienne@depar.is>
pkgname=chwall
pkgver=0.5.8
pkgrel=1
pkgdesc="A tiny wallpaper changer, written in python"
arch=("any")
url="https://git.umaneti.net/chwall/about/"
license=("WTFPL")
depends=("gtk3" "python-cssselect" "python-gobject" "python-lxml"
         "python-pillow" "python-requests" "python-xdg" "python-yaml")
makedepends=("python-setuptools" "imagemagick")
source=("https://git.umaneti.net/${pkgname}/snapshot/${pkgname}-${pkgver}.tar.gz")
sha256sums=('1e90d1f2e594975be59a92279ce06797c4b8e13acef58528ad6d9c62557967b0')

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make dist DESTDIR="$pkgdir"
}
