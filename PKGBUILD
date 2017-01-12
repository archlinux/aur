# Contributor: 100best

pkgname=openspades-notofonts
pkgver=unknown
pkgrel=2
pkgdesc="Google Noto Fonts for OpenSpades."
url="http://openspades.yvt.jp"
arch=('any')
license=('OFL')
depends=('openspades')
source=('https://github.com/yvt/openspades/releases/download/v0.1.0/NotoFonts.pak')
md5sums=('0070aec391df4ed1cb3170a1df90f071')

package() {
  mkdir -p $pkgdir/usr/share/openspades/Resources
  cp NotoFonts.pak $pkgdir/usr/share/openspades/Resources 
}
