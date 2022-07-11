# Maintainer: Cedric Girard <cgirard [dot] archlinux [at] valinor [dot] fr>
# Contributor: Christopher Arndt <aur -at- chrisarndt -dot- de>

_pkgname=first
pkgname="python2-${_pkgname}"
pkgver=2.0.2
pkgrel=1
pkgdesc="Provides a Python function to get the first element of an iterator."
arch=('any')
url="https://github.com/hynek/first/"
license=('MIT')
depends=('python2')
makedepends=('python2-setuptools')
source=("https://pypi.python.org/packages/source/f/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('ff285b08c55f8c97ce4ea7012743af2495c9f1291785f163722bd36f6af6d3bf')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
  install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname"
}

# vim:set ts=2 sw=2 et:
