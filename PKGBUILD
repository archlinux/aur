# Maintainer: Fabien Devaux <fdev31@gmail.com>
pkgname=aury
pkgver=1.1.3
pkgrel=2
pkgdesc="Automates maintenance of AUR python packages"
arch=('any')
url="https://github.com/fdev31/aury.git"
license=('MIT')
groups=()
depends=('python' 'git')
makedepends=()
provides=()
conflicts=('aury-git')
replaces=()
backup=()
options=(!emptydirs)
install=
source=("https://pypi.python.org/packages/source/a/aury/aury-${pkgver}.tar.gz")
md5sums=('621bc74f7e03d2fdbb69ac7260efff82')

package() {
  cd "$srcdir/aury-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
