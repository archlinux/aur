# Maintainer: helix <stargr[at]gmail[dot]com>
pkgname=libreoffice-extension-libregreek
pkgver=1.0
pkgrel=3
pkgdesc='An advanced Greek & English dictionary for LibreOffice'
arch=('any')
url='https://github.com/squibbylinux/LibreGreek'
license=('BSD-3')
depends=('libreoffice')
groups=('libreoffice-extensions')
conflicts=('languagetool')
source=(https://github.com/squibbylinux/LibreGreek/archive/master.tar.gz)
sha512sums=('6604237e300fdd873c03da58c87d4bce001593cf13173187da1c886eba5ef8f7dff108f3636024c5243288f483477f15c874ed5ec0a525ac0dad1c3f50dbfdd7')

package() {
  install -dm755 $pkgdir/usr/lib/libreoffice/share/extensions
  tar xzf $srcdir/master.tar.gz -C $pkgdir/usr/lib/libreoffice/share/extensions --strip-components=1 LibreGreek-master/libregreek
  install -dm755 $pkgdir/usr/lib/libreoffice/share/extensions/libregreek
}
