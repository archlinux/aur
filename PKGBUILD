# Maintainer: Wijnand Modderman-Lenstra <maze@pyth0n.org>
pkgname=python2-sauce
_pkgname=sauce
pkgver=0.1.1
pkgrel=1
pkgdesc="SAUCE record parser"
arch=(i686 x86_64)
url="https://github.com/tehmaze/sauce"
license=('MIT')
groups=()
depends=('python2')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=(https://pypi.python.org/packages/source/s/$_pkgname/$_pkgname-$pkgver.tar.gz)
md5sums=('ea17431679c95a86d6c06e8f07591d25')
sha1sums=('08cd4a8ba6eb01e5bb06eab05fed729763eab833')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
