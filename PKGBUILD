# Maintainer: zlsun <zlsun1995@gmail.com>

pkgname=yah3c
pkgver=0.6
pkgrel=1
pkgdesc="A program for h3c authentication in SYSU east campus."
arch=('any')
url="https://github.com/zlsun/yah3c"
license=('MIT')
depends=()
makedepends=('python-setuptools')
source=("https://github.com/zlsun/yah3c/archive/v${pkgver}.tar.gz")
md5sums=("e27b277cc79d9e097a6b398397307437")

build ()
{
    cd "$srcdir/${pkgname}-${pkgver}"
    python setup.py build
}

package ()
{
    cd "$srcdir/${pkgname}-${pkgver}"
    python setup.py install --root="$pkgdir" --optimize=1
}
