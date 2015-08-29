# Maintainer: A. Richard <dubitae@gmail.com>
# Contributor: Atlanis <emallson@archlinux.us>
pkgname=python2-validictory
pkgver=0.9.1
pkgrel=3
pkgdesc="General purpose Python data validator that allows validation of arbitrary Python data structures."
arch=('any')
url="https://readthedocs.org/projects/validictory/"
license=('MIT')
groups=()
depends=('python2')
makedepends=('python2-setuptools')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
changelog=
source=("https://github.com/sunlightlabs/validictory/archive/0.9.1.tar.gz")
noextract=()
md5sums=('aee1a43aae0da08d49c7b949982ec169')

package() {
    cd "$srcdir/validictory-$pkgver"
    python2 setup.py install --root="$pkgdir" --optimize=1
}
