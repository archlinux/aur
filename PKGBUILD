# Maintainer: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Sebastien Binet <binet@lblbox>

pkgname=python-virtualenvwrapper
pkgver=4.4.1
pkgrel=1
pkgdesc="Extensions to Ian Bicking's virtualenv tool"
arch=('any')
url="https://bitbucket.org/dhellmann/virtualenvwrapper"
license=('MIT')
depends=('python-virtualenv' 'python2-virtualenv' 'python-virtualenv-clone'
         'python-stevedore')
conflicts=('python2-virtualenvwrapper')
replaces=('python2-virtualenvwrapper')
source=(https://pypi.python.org/packages/source/v/virtualenvwrapper/virtualenvwrapper-$pkgver.tar.gz)
sha256sums=('b6ad867c02ef0858cf8c23fe37418f9fb5df134842472c24304700fbcb164220')

package() {
  cd "$srcdir/virtualenvwrapper-$pkgver"

  python3 setup.py install --root="$pkgdir" -O1

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
