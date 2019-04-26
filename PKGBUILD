# Maintainer: Étienne Deparis <etienne@depar.is>
pkgname=chwall
pkgver=0.4.3
pkgrel=1
pkgdesc="A tiny wallpaper changer, written in python"
arch=("any")
url="https://git.deparis.io/chwall/about/"
license=("WTFPL")
depends=("gtk3" "python-cssselect" "python-gobject" "python-lxml"
         "python-requests" "python-xdg" "python-yaml")
makedepends=("python-setuptools" "imagemagick")
source=("https://git.deparis.io/${pkgname}/snapshot/${pkgname}-${pkgver}.tar.gz")
sha256sums=('44c68bf90c715ad65a334c2fb0dc44917be3d1c9436eb4b24c88e18616481377')

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make ROOT="$pkgdir/" dist
}
