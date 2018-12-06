# Maintainer: Tim Savannah <kata198@gmail.com>

pkgname=ioschedset
pkgver=1.0.1
pkgrel=1
pkgdesc="Commandline tools to query and/or set the I/O schedulers for block devices on Linux systems."
arch=('any')
license=('GPLv3')
url="http://github.com/kata198/ioschedset"
depends=('bash')
source=("https://github.com/kata198/ioschedset/archive/${pkgver}.tar.gz")
sha512sums=("cef0a8177641fa542a02ff79e6226f0111176752167185173ba8f1b6a0243806ba91edf2bb1cb62b3f98ce4f0ff42ee7f0c8a7ee658f42bd62d943f7b7f0e092")

build() {
  cd "$srcdir"/${pkgname}-$pkgver
}

package() {
  cd "$srcdir"/${pkgname}-$pkgver

  ./install.sh DESTDIR="${pkgdir}"

}
