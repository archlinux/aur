# Maintainer: Meir Kriheli <mkriheli@gmail.com>
# Contributor:

pkgname=python-cookiecutter
_pkgname=cookiecutter
pkgver=0.9.1
pkgrel=1
pkgdesc="A command-line utility that creates projects from project templates"
arch=('any')
url="https://github.com/audreyr/cookiecutter"
license=('BSD')
groups=('devel')
depends=('python' 'python-jinja' 'python-yaml' 'python-binaryornot')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
source=("https://github.com/audreyr/${_pkgname}/archive/${pkgver}.tar.gz")
md5sums=('ea90dda399071d09ba270ece1b1f2945')
package() {
      cd "$srcdir/${_pkgname}-${pkgver}"
      python setup.py install --root="$pkgdir/"
}

# vim:set ts=2 sw=2 et:
