# Maintainer: Étienne Deparis <etienne@depar.is>
pkgname=chwall
pkgver=0.4.4
pkgrel=1
pkgdesc="A tiny wallpaper changer, written in python"
arch=("any")
url="https://git.deparis.io/chwall/about/"
license=("WTFPL")
depends=("gtk3" "python-cssselect" "python-gobject" "python-lxml"
         "python-requests" "python-xdg" "python-yaml")
makedepends=("python-setuptools" "imagemagick")
source=("https://git.deparis.io/${pkgname}/snapshot/${pkgname}-${pkgver}.tar.gz")
sha256sums=('7b492ec8c789e25a2b016b3fda6daa5b420c9e4e56a6ba62c60f11a72ddc1037')

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make ROOT="$pkgdir/" dist
}
