# Maintainer: helix <stargr[at]gmail[dot]com>
pkgname=wps-office-extension-croatian-dictionary
pkgver=20160323
pkgrel=1
pkgdesc='Croatian dictionary for WPS Office'
arch=('any')
url='http://wps-community.org/download/dicts'
license=('custom')
depends=('wps-office')
groups=('wps-office-extensions')
makedepends=('unzip')
source=(http://wps-community.org/download/dicts/hr_HR.zip)
sha1sums=('048f06abdb224eaee744f350547576c3be9c485a')

package() {
  install -dm755 $pkgdir/usr/lib/office6/dicts
  unzip -q $srcdir/hr_HR.zip -d $pkgdir/usr/lib/office6/dicts
}
