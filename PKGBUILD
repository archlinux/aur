# Maintainer: Tim Savannah <kata198@gmail.com>

pkgname=ioschedset
pkgver=1.0.0
pkgrel=1
pkgdesc="Commandline tools to query and/or set the I/O schedulers for block devices on Linux systems."
arch=('any')
license=('GPLv3')
url="http://github.com/kata198/ioschedset"
depends=('bash')
source=("https://github.com/kata198/ioschedset/archive/${pkgver}.tar.gz")
sha512sums=("b2a2a506d8a40e94d4f7870b04e07c8ebc23ab27981bbfce90399c4c44e3ca61b3e54c6f2e2da5223c7fbc2f9d747c1661c5ba3d33a406f4597cdc122f3f66b3")

build() {
  cd "$srcdir"/${pkgname}-$pkgver
}

package() {
  cd "$srcdir"/${pkgname}-$pkgver

  ./install.sh DESTDIR="${pkgdir}"

}
