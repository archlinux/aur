# Maintainer: Jan Holthuis <holthuis.jan@googlemail.com>

pkgname=python2-mstranslator
_pypiname=mstranslator
pkgver=0.2.5
pkgrel=1
pkgdesc="Microsoft Translator API wrapper"
arch=('any')
url="https://github.com/wronglink/mstranslator"
license=('MIT')
depends=('python2')
makedepends=('python2-setuptools')
source=("https://pypi.python.org/packages/source/m/${_pypiname}/${_pypiname}-${pkgver}.tar.gz")
md5sums=('9f45698dbf06a6ccb2a85efc48e0726e')

package() {
  cd "$srcdir/$_pypiname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}
