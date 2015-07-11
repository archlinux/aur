# Maintainer: Jeremy Pope <jpope at jpope dot org> PGP-Key: E00B4261

pkgname=gimp-calendar
pkgver=1.0
pkgrel=1
pkgdesc="A GIMP script to create a simple calendar"
url="http://registry.gimp.org/node/20193"
arch=('i686' 'x86_64')
license=("GPL")
depends=('gimp')
source=('http://registry.gimp.org/files/sg-calendar_2.scm')
sha256sums=('401c3582322bde472a6987bc9a4139e20ca4020a64549b115aebf56d6897a6fc')

package() {
  install -D -m 644 sg-calendar_2.scm $pkgdir/usr/share/gimp/2.0/scripts/sg-calendar_2.scm
}
