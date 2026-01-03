# Maintainer: kamiduki <kamiduki_0@outlook.com>

pkgname=ttf-ob-freie
pkgver=2.0.0
pkgrel=1
pkgdesc='Old Babylonian Freie - A font made for the Institut für Altorientalistik Berlin, based on aBZL.'
url=https://github.com/crzfub/OB-Freie
source=("$url/archive/refs/tags/v.$pkgver.tar.gz")
arch=('any')
license=('SIL')
sha256sums=('87c10c6905d34e9d3ccec3e2e07bb767e6c00b4e9c7486bbdab1ee8635024616')

package() {
  cd OB-Freie-v.2.0.0
  install -Dm644 -t "$pkgdir/usr/share/fonts/${pkgname}" OBFreie/font/ttf/*.ttf
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
