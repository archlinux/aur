# Autor:  Alexey Korop akorop@ukr.net

pkgname=obmenu3
pkgver=1.04
pkgrel=1
pkgdesc="Openbox menu editor - replacement of obmenu"
url="http://sourceforge.net/projects/obmenu3"
license=('GPL')
depends=('gtk2')
makedepends=('')
arch=('i686' 'x86_64')
source=(http://sourceforge.net/projects/obmenu3/files/$pkgver/obmenu3-$pkgver-$CARCH.tgz)
if [[ $CARCH == 'i686' ]]; then
  md5sums=('fe8f05934510a0e28981d064540dd7c6')
else
  md5sums=('64d30613ac5881f4808b3302ad7f8e98')
fi
package() {
  cp -R "$srcdir/usr" "$pkgdir"
}
