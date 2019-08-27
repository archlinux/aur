# Maintainer: Jameson Pugh <imntreal@gmail.com>

pkgname=tnscmd10g
pkgver=1.3
pkgrel=1
pkgdesc="Tool to enumerate the oracle tnslsnr process (1521/tcp)"
url="http://www.red-database-security.com"
arch=('any')
license=('GPL')
depends=('perl')
replaces=('tnscmd')
source=("http://www.red-database-security.com/scripts/tnscmd10g.pl.txt")
sha256sums=('d3c0185f5db4d93e0d2b6918ea0700727417735ee298271c6bf4e98e453b3af0')

package() {
  cd "$srcdir"
  install -Dm755 tnscmd10g.pl.txt "$pkgdir/usr/bin/tnscmd10g"
}

# vim:set ts=2 sw=2 et:
