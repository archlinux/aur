# Maintainer: Kevin Klement (klement at philos dot umass dot edu)
pkgname=otf-bergamo
pkgver=1
pkgrel=3    
pkgdesc="Open type serif font resembling Bembo"
arch=('any')
url="http://www.fontsite.com/download-free-fonts/bergamo-std"
license=('custom:FontSite Free Font License')
depends=('fontconfig' 'xorg-font-utils')
makedepends=('unzip')
source=(http://www.fontsite.com/freefonts/BergamoStd.zip)
noextract=(BergamoStd.zip)
install=$pkgname.install
md5sums=('2e0ded1cf1791dc8650510087aaff2de')

package() {
  cd "$srcdir"
  unzip -j BergamoStd.zip
  install -d "$pkgdir/usr/share/fonts/OTF"
  install -m644 *.otf "$pkgdir/usr/share/fonts/OTF"
  install -Dm644 EULA.txt "$pkgdir/usr/share/licenses/$pkgname/EULA.txt"
}

