# $Id: PKGBUILD 245414 2017-07-16 19:40:31Z jelle $
# Contributor : Martin Wimpress <code@flexion.org>
# Contributor: Ruben Schuller <r.schuller@orgizm.net>

_pkgname=pybonjour
pkgname=python2-${_pkgname}
pkgver=1.1.1
pkgrel=5
pkgdesc="Pure-Python interface to Apple Bonjour and compatible DNS-SD libraries"
arch=('any')
provides=('pybonjour')
conflicts=('pybonjour')
replaces=('pybonjour')
license=('MIT')
url="https://pypi.python.org/pypi/pybonjour"
depends=('avahi' 'python2')
source=("https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/pybonjour/pybonjour-$pkgver.tar.gz")
md5sums=('30cbfd3e9e9721b39f6aa67df1c315a2')

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python2 setup.py install --root="${pkgdir}"
}

