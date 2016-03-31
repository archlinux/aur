# Maintainer: A. Richard <dubitae@gmail.com>
pkgname=python2-gpsoauth
_pipyname=gpsoauth
pkgver=0.2.0
pkgrel=2
pkgdesc="client library for Google Play Services OAuth"
arch=('any')
url="https://github.com/simon-weber/gpsoauth"
license=('BSD')
groups=()
depends=(
    'python2'
    'python2-requests>=2.9'
    'python2-pycryptodomex'
)
makedepends=('python2-setuptools')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
changelog=
source=("https://pypi.python.org/packages/source/g/$_pipyname/$_pipyname-$pkgver.tar.gz")
noextract=()
md5sums=('549da992b843cb3bc5973145104cd77e')

package() {
    cd "$srcdir/$_pipyname-$pkgver"
    python2 setup.py install --root="$pkgdir" --optimize=1
}
