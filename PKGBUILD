# Maintainer: Slash

pkgname=mopidy-local-sqlite
pkgver=1.0.0
pkgrel=1
pkgdesc="Mopidy SQLite local library extension"
arch=('any')
url="https://github.com/mopidy/mopidy-local-sqlite"
license=('Apache')
depends=('mopidy' 'python2-pykka' 'python2-uritools>=1.0')
makedepends=('python2' 'python2-setuptools')
source=("https://github.com/mopidy/mopidy-local-sqlite/archive/v${pkgver}.tar.gz")
sha256sums=('67a0a94fd26d0e7b59886f454fd74b6f22aa80796a8c3ed0e33c1d22c79411ae')

package() {
    cd "${srcdir}/mopidy-local-sqlite-${pkgver}"

    python2 setup.py install --root="${pkgdir}/" --optimize=1
}

