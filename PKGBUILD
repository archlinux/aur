# Maintainer: Doron Behar <doron.behar@gmail.com>

pkgname=python-click-repl
_name=click-repl
pkgver=0.1.4
pkgrel=1
pkgdesc="Subcommand REPL for click apps"
arch=('any')
url="https://github.com/untitaker/click-repl"
license=('MIT')
groups=()
depends=('python-click' 'python-prompt_toolkit' 'python-six')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
md5sums=('dc7706bbdbfc5aa3d7b49394a479d90e')

package() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
