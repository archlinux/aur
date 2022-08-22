# Maintainer: Étienne Deparis <etienne@depar.is>
pkgname=chwall
pkgver=0.5.10
pkgrel=1
pkgdesc="A tiny wallpaper changer, written in python"
arch=("any")
url="https://git.umaneti.net/chwall/about/"
license=("WTFPL")
depends=("gtk3" "python-cssselect" "python-gobject" "python-lxml"
         "python-pillow" "python-requests" "python-xdg" "python-yaml")
makedepends=("python-setuptools" "imagemagick")
source=("https://git.umaneti.net/${pkgname}/snapshot/${pkgname}-${pkgver}.tar.gz")
sha256sums=('091da3760b98a83d90d6260fa95b57619b2b77a2c6cdddb7416b3894c0fa4674')

package() {
  cd "$pkgname-$pkgver"

  make dist DESTDIR="$pkgdir"
}
