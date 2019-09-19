# Maintainer: Ivan Semkin (ivan at semkin dot ru)

appname=PyInquirer
pkgname=(python-pyinquirer python2-pyinquirer)
pkgver=1.0.3
pkgrel=1
pkgdesc='A Python module for collection of common interactive command line user interfaces, based on Inquirer.js'
arch=('any')
url='https://github.com/CITGuru/PyInquirer'
license=('MIT')
depends=()
makedepends=('python-setuptools')
provides=('python-pyinquirer')
conflicts=('python-pyinquirer')
source=("https://github.com/CITGuru/PyInquirer/archive/$pkgver.tar.gz")
sha256sums=('943d6851493a7b8625883dddcd3790361d39aa2c9e8706f62b43effb58915785')

package_python-pyinquirer() {
  depends=('python' 'python-pygments' 'python-prompt_toolkit' 'python-regex')

  cd "$srcdir/$appname-$pkgver"
  python setup.py install --optimize=1 --root="${pkgdir}/"
}

package_python2-pyinquirer() {
  depends=('python2' 'python2-pygments' 'python2-prompt_toolkit' 'python2-regex')

  cd "$srcdir/$appname-$pkgver"
  python2 setup.py install --optimize=1 --root="${pkgdir}/"
}
# vim:set ts=2 sw=2 et:
