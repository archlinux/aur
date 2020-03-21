# Maintainer: Étienne Deparis <etienne@depar.is>
pkgname=chwall
pkgver=0.5.2
pkgrel=1
pkgdesc="A tiny wallpaper changer, written in python"
arch=("any")
url="https://git.deparis.io/chwall/about/"
license=("WTFPL")
depends=("gtk3" "python-cssselect" "python-gobject" "python-lxml"
         "python-pillow" "python-requests" "python-xdg" "python-yaml")
makedepends=("python-setuptools" "imagemagick")
source=("https://git.deparis.io/${pkgname}/snapshot/${pkgname}-${pkgver}.tar.gz")
sha256sums=('41dc256e8cdcf3ea59b45c7a78c41fcc5264d014204dba1190fe5ab09c793bc7')

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make dist DESTDIR="$pkgdir"
}
