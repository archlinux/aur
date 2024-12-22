# Maintainer: Étienne Deparis <etienne@depar.is>
pkgname=carp
pkgver=0.8.2
pkgrel=6
pkgdesc="EncFS gui and cli front-end"
arch=("any")
url="https://git.umaneti.net/carp/about/"
license=("WTFPL")
depends=("encfs" "python-gobject" "python-inotify>=0.2.9" "python-pyxdg")
optdepends=("rsync: sync support")
makedepends=("python-setuptools" "emacs")
source=("https://git.umaneti.net/${pkgname}/snapshot/${pkgname}-${pkgver}.tar.gz")
sha256sums=('0a1cd4e0b8fa799644b116379fecf83f7304cf487ba198e511e52f372e5b1a77')

package() {
  cd "$srcdir/${pkgname}-$pkgver"

  make dist DESTDIR="$pkgdir"
}
