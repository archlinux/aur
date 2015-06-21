# Maintainer: Jan Holthuis <holthuis.jan@googlemail.com>

pkgname=python-tempmail
_pypiname=temp-mail
pkgver=0.2
pkgrel=1
pkgdesc="Wrapper for online service which provides temporary email address: https://temp-mail.ru/"
arch=('any')
url="https://github.com/saippuakauppias/temp-mail"
license=('MIT')
depends=('python'
         'python-requests')
makedepends=('python-setuptools')
optdepends=('python-simplejson: For a serious speed boost in JSON decode')
conflics=('python-tempmail-git')
provides=('python-tempmail')
source=("https://pypi.python.org/packages/source/t/${_pypiname}/${_pypiname}-${pkgver}.tar.gz")
md5sums=('f625c6b699769cd83b133fdc8d5bec92')

package() {
  cd "$srcdir/$_pypiname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}