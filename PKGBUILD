# Maintainer: A. Richard <dubitae@gmail.com>
# Contributor: Atlanis <emallson@archlinux.us>
pkgname=python2-gmusicapi
_pipyname=gmusicapi
pkgver=9.0.0
pkgrel=1
pkgdesc="Allows control of Google Music with Python"
arch=('any')
url="https://github.com/simon-weber/Unofficial-Google-Music-API"
license=('BSD')
groups=()
depends=(
    'python2'
    'python2-validictory>=0.9'
    'python2-decorator>=3.4.0'
    'mutagen>=1.23'
    'python2-protobuf>=2.5'
    'python2-requests>=2.3'
    'python2-dateutil>=2.2'
    'python2-proboscis>=1.2.6'
    'python2-oauth2client>=1.2'
    'python2-mock>=1.0.1'
    'python2-appdirs>=1.3.0'
    'python2-gpsoauth>=0.0.4'
    'python2-mechanicalsoup>=0.3.1'
    'python2-pyopenssl>=0.15.1'
    'python2-ndg-httpsclient>=0.4.0'
    'python2-pyasn1'
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
md5sums=('3d208660db1bc0a7be518b85ab2daaf9')

package() {
    cd "$srcdir/$_pipyname-$pkgver"
    python2 setup.py install --root="$pkgdir" --optimize=1
}
