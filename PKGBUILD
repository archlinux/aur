# Maintainer: A. Richard <dubitae@gmail.com>
pkgname=python2-gpsoauth
_pipyname=gpsoauth
pkgver=0.2.0
pkgrel=1
pkgdesc="client library for Google Play Services OAuth"
arch=('any')
url="https://github.com/simon-weber/gpsoauth"
license=('BSD')
groups=()
depends=(
    'python2'
    'python2-requests>=2.7'
    'python2-crypto>=2.6'
    'python2-pyasn1>=0.1.7'
    'python2-pyopenssl>=0.15'
    'python2-ndg-httpsclient>=0.4'
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
