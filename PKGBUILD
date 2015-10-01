# Maintainer: Meir Kriheli <mkriheli@gmail.com>
# Contributor:

pkgname=python-cookiecutter
_pkgname=cookiecutter
pkgver=1.1.0
pkgrel=2
pkgdesc="A command-line utility that creates projects from project templates"
arch=('any')
url="https://github.com/audreyr/cookiecutter"
license=('BSD')
groups=('devel')
depends=('python-jinja>=2.7'
         'python-yaml>=3.10'
         'python-binaryornot>=0.2.0'
         'python-click>=5.0'
         'python-future>=0.15.2'
         'python-whichcraft>=0.1.1')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
source=("https://github.com/audreyr/${_pkgname}/archive/${pkgver}.tar.gz")
md5sums=('30a39ca93bb24ce345dd0107db7d2a5d')

package() {
  cd "$srcdir/${_pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir/"
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
