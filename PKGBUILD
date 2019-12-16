# Maintainer: helix <stargr[at]gmail[dot]com>
pkgname=wps-office-extension-croatian-dictionary
pkgver=20160323
pkgrel=4
pkgdesc='Croatian dictionary for WPS Office'
arch=('any')
url='https://github.com/wps-community/wps_community_website/tree/master/root/download/dicts'
license=('custom')
depends=('wps-office')
groups=('wps-office-extensions')
makedepends=('unzip')
source=(https://github.com/wps-community/wps_community_website/raw/master/root/download/dicts/hr_HR.zip)
sha512sums=('1ae43d506bf35483e65a8ef2f289a854785269a9ef5a39126996d17cd0c9469381cd567925e98cd863bddf2d981bf281880be94250579b506e82e9747114fb35')

package() {
  install -dm755 $pkgdir/usr/lib/office6/dicts/spellcheck
  unzip -q $srcdir/hr_HR.zip -d $pkgdir/usr/lib/office6/dicts/spellcheck
}
