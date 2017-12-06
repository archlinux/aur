# Maintainer: Bastian Rieck <bastian@rieck.ru>
pkgname=python-miniball
pkgver=1.0.0
pkgrel=1
pkgdesc="Python bindings for the \`miniball\` software by Gärtner et al."
arch=('x86_64')
url="https://github.com/weddige/miniball"
license=('GPL3')
groups=()
depends=('python' 'python-setuptools')
makedepends=()
provides=("${pkgname}")
conflicts=("${pkgname}")
replaces=()
backup=()
options=(!emptydirs)
install=
source=('python-miniball::git+https://github.com/weddige/miniball.git')
noextract=()
md5sums=('SKIP')

package() {
  cd "$srcdir/${pkgname}"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
