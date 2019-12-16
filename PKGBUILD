# Maintainer: helix <stargr[at]gmail[dot]com>
pkgname=wps-office-extension-english-uk-dictionary
pkgver=20140307
pkgrel=4
pkgdesc='https://github.com/wps-community/wps_community_website/tree/master/root/download/dicts'
arch=('any')
url='http://wps-community.org/download/dicts'
license=('custom')
depends=('wps-office')
groups=('wps-office-extensions')
makedepends=('unzip')
source=(http://wps-community.org/download/dicts/en_GB.zip)
sha512sums=('6af867e1a53f80ae31ddb874f6825453becd4ab77689983e8819db017e9bf89939244c0e4aa8b146f97b4ab5c546f55eea544956297b7bd263236cabe43cced3')

package() {
  install -dm755 $pkgdir/usr/lib/office6/dicts/spellcheck
  unzip -q $srcdir/en_GB.zip -d $pkgdir/usr/lib/office6/dicts/spellcheck
}
