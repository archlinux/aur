# Maintainer : Simon Doppler <dop dot simon at gmail dot com>

_pkgname=simplekml
pkgname=python-simplekml
pkgver=1.3.1
pkgrel=1
pkgdesc="KML generation helpers"
arch=('any')
url="https://simplekml.readthedocs.io/en/latest/"
license=('GPL3')
depends=('python')
source=("https://files.pythonhosted.org/packages/62/88/feeb5ac5ae528c81daed9fe9864ec42496b80ffbcf83ac60bb6feb5b7f80/simplekml-${pkgver}.tar.gz")
sha256sums=('30c121368ce1d73405721730bf766721e580cae6fbb7424884c734c89ec62ad7')

package() {
    cd "${_pkgname}-${pkgver}"
    python setup.py install --root="$pkgdir"
}
