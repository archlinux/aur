# Maintainer: helix <stargr[at]gmail[dot]com>
pkgname=wps-office-extension-english-uk-dictionary
pkgver=20140307
pkgrel=2
pkgdesc='English (UK) dictionary for WPS Office'
arch=('any')
url='http://wps-community.org/download/dicts'
license=('custom')
depends=('wps-office')
groups=('wps-office-extensions')
makedepends=('unzip')
source=(http://wps-community.org/download/dicts/en_GB.zip)
sha1sums=('24ba8db91b0913a033fab1c44da0e654e4449c5c')

package() {
  install -dm755 $pkgdir/usr/lib/office6/dicts
  unzip -q $srcdir/en_GB.zip -d $pkgdir/usr/lib/office6/dicts
}
