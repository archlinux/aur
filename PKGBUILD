# Maintainer: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Sebastien Binet <binet@lblbox>

pkgname=python-virtualenvwrapper
pkgver=4.5.1
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
sha256sums=('ac0b09ce7409ec9d5b8ec90d073641b86bbafc3161f844347b89cc25b2e3a3d9')

package() {
  cd "$srcdir/virtualenvwrapper-$pkgver"

  python3 setup.py install --root="$pkgdir" -O1

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
