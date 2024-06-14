# Maintainer:
# Contributor: MindLikeWater <mlw att pi dott xelpara dott de>

_fontname="geosans-light"
_pkgname="ttf-$_fontname"
pkgname="$_pkgname"
pkgver=1.0
pkgrel=4
pkgdesc="Asian style font, clean and beautiful"
url="https://www.dafont.com/geo-sans-light.font"
arch=('any')
license=('unknown')

source=("$_pkgname.zip"::"https://dl.dafont.com/dl/?f=geo_sans_light")
sha256sums=('0602c30b44b9c6682c3708e9ff49706a66d1d665613343d5f7744bb63fa943aa')

package() {
  install -Dm755 "$srcdir/"*.ttf -t "$pkgdir/usr/share/fonts/$_fontname/"
}
