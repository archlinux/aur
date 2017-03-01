# Maintainer: Wijnand Modderman-Lenstra <maze@pyth0n.org>
pkgname=python2-sqlitedict
_pkgname=sqlitedict
pkgver=1.5.0
pkgrel=1
pkgdesc="Persistent dict in Python, backed up by sqlite3 and pickle, multithread-safe"
arch=(i686 x86_64)
url="https://github.com/piskvorky/sqlitedict"
license=('MIT')
groups=()
depends=('python2')
makedepends=('python2-setuptools')
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
_hash=7e/ab/e8af7777c1b7daafc9b7594dc17872b72d64cc8524ecd4e7c1f261918e72
source=(https://pypi.python.org/packages/$_hash/$_pkgname-$pkgver.tar.gz)
sha256sums=('76ea12115d3961e2aea2f277a785ac9df3d463d50cc0b02afdcf1ea6ec833f94')
sha512sums=('87c9601b71e93a907b27d4b93f0a7a8e08a07de226cb6f9af158feb93ddd6a96109251d9e5205a47cd38bde919fd33eecadbce2966783a97902a9a1e1cd18c60')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
