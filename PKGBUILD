# Maintainer: Doron Behar <doron.behar@gmail.com>

pkgname=syncthingmanager
_name=syncthingmanager
pkgver=0.1.0
pkgrel=1
pkgdesc="A commandline tool for configuring Syncthing"
arch=('any')
url="https://github.com/classicsc/syncthingmanager"
license=('GPL')
groups=()
depends=('python' 'python-syncthing')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
md5sums=('8a0741f28df3e2f37dd9a93bd833ad6a')

package() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
