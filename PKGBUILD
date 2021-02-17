# Maintainer: Yarema aka Knedlyk <yupadmin at gmail dot com>
# Contributor: Yarema aka Knedlyk <yupadmin at gmail dot com>

pkgbase=python-getdevinfo
pkgname=('python-getdevinfo')
pkgver=1.1.1
pkgrel=1
pkgdesc="A device information gatherer for Linux and macOS."
arch=('any')
url="https://www.hamishmb.com/html/downloads.php?program_name=getdevinfo"
license=('PSF')
makedepends=('python-setuptools')
depends=('python')

source=("https://www.hamishmb.com/files/Downloads/getdevinfo/${pkgver}/Python/getdevinfo-${pkgver}.tar.gz")

prepare() {
  cd "$srcdir"/getdevinfo-$pkgver
}

build() {
  cd "$srcdir"/getdevinfo-$pkgver
  python setup.py build

#  cd "$srcdir"/getdevinfo-$pkgver
#  python setup.py build
}

package() {

  cd getdevinfo-$pkgver
  python setup.py install --root="$pkgdir"
}
md5sums=('340e1ae3c24591ac27d677a7901e94d6')