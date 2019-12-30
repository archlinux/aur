# Maintainer: PitBall

pkgname=wine-gecko-2.47
pkgver=2.47
pkgrel=1
pkgdesc="Wine's built-in replacement for Microsoft's Internet Explorer"
arch=('x86_64')
url="https://wiki.winehq.org/Gecko"
license=('MPL')
optdepends=('wine: require version >1.9.13, <5.0')
replaces=('wine_gecko=2.47')
provides=('wine_gecko=2.47')
conflicts=('wine_gecko=2.47')
source=(https://dl.winehq.org/wine/wine-gecko/$pkgver/wine_gecko-$pkgver-x86.msi)
source_x86_64=(https://dl.winehq.org/wine/wine-gecko/$pkgver/wine_gecko-$pkgver-x86_64.msi)
md5sums=('5ebc4ec71c92b3db3d84b334a1db385d')
md5sums_x86_64=('d93ac0d2e6aceafe9113a9918916df45')

package() {
  install -Dm644 wine_gecko-$pkgver-x86.msi wine_gecko-$pkgver-x86_64.msi -t "$pkgdir"/usr/share/wine/gecko/
}
