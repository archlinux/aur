# Maintainer: Ari Mizrahi <codemunchies at debugsecurity dot com>
# Contributor: ArchAssault Project <https://www.archassault.org>

pkgname=dnsbf
pkgver=svn
pkgrel=3
pkgdesc="Search for available domain names in an IP range"
arch=('any')
url=('http://code.google.com/p/dnsbf')
license=('BSD')
makedepends=('subversion')
depends=('python2')
source=('svn+http://dnsbf.googlecode.com/svn/trunk/')
md5sums=('SKIP')

package() {
  cd "$srcdir/trunk"
  install -Dm755 dnsbf.py "$pkgdir/usr/bin/dnsbf"
}
