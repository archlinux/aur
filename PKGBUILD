# Maintainer: Étienne Deparis <etienne@depar.is>
pkgname=chwall
pkgver=0.5.4
pkgrel=1
pkgdesc="A tiny wallpaper changer, written in python"
arch=("any")
url="https://git.deparis.io/chwall/about/"
license=("WTFPL")
depends=("gtk3" "python-cssselect" "python-gobject" "python-lxml"
         "python-pillow" "python-requests" "python-xdg" "python-yaml")
makedepends=("python-setuptools" "imagemagick")
source=("https://git.deparis.io/${pkgname}/snapshot/${pkgname}-${pkgver}.tar.gz")
sha256sums=('f52da0d2468024c35555422afc16fc45d3ee11ee98e8ce40156f3d10840d664f')

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make dist DESTDIR="$pkgdir"
}
