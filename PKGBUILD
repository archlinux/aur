# Maintainer: Tim Savannah <kata198@gmail.com>

pkgname=ioschedset
pkgver=1.1.0
pkgrel=1
pkgdesc="Commandline tools to query and/or set the I/O schedulers for block devices on Linux systems."
arch=('any')
license=('GPLv3')
url="http://github.com/kata198/ioschedset"
depends=('bash')
source=("https://github.com/kata198/ioschedset/archive/${pkgver}.tar.gz")
sha512sums=("74750e2c92d5c251238c42bab7db946da8558affe413dd13e4078ee91ff66a22c5c079a96a70457e133085b1cb9690b282b253d0c95aa39e63f50649d91c2588")

build() {
  cd "$srcdir"/${pkgname}-$pkgver
}

package() {
  cd "$srcdir"/${pkgname}-$pkgver

  ./install.sh DESTDIR="${pkgdir}"

}
