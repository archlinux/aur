# Maintainer: helix <stargr[at]gmail[dot]com>
pkgname=wps-office-extension-romanian-dictionary
pkgver=20140108
pkgrel=4
pkgdesc='Romanian dictionary for WPS Office'
arch=('any')
url='https://github.com/wps-community/wps_community_website/tree/master/root/download/dicts'
license=('custom')
depends=('wps-office')
groups=('wps-office-extensions')
makedepends=('unzip')
source=(https://github.com/wps-community/wps_community_website/raw/master/root/download/dicts/ro_RO.zip)
sha512sums=('be7c63a1f8563110da663572a81599e5042a42ad0a36e319435b918ae41e8c639797a59b7ec271dc3cf737ed9c64ae6ef347fa2a134bdb804b2cc6dc0ee731b2')

package() {
  install -dm755 $pkgdir/usr/lib/office6/dicts/spellcheck
  unzip -q $srcdir/ro_RO.zip -d $pkgdir/usr/lib/office6/dicts/spellcheck
}
