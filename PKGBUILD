# Maintainer: Fabien Devaux <fdev31@gmail.com>
pkgname=aury
pkgver=1.0
pkgrel=1
pkgdesc="Automates maintenance of AUR python packages"
arch=('any')
url="https://github.com/fdev31/aury.git"
license=('MIT')
groups=()
depends=('python' 'burp')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=('https://pypi.python.org/packages/source/a/aury/aury-1.0.tar.gz#md5=d1d6600a17f6d80e322165366534c4e6')
md5sums=('d1d6600a17f6d80e322165366534c4e6')

package() {
  cd "$srcdir/aury-1.0"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
