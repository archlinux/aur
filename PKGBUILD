# Maintainer: dreieck (https://aur.archlinux.org/account/dreieck)

_pkgname=marble-restricted-maps
pkgname="${_pkgname}"
pkgver=1.0
pkgrel=6
pkgdesc='Metapackage that depends on some maps for the Marble desktop globe with restricted licenses (Google Maps, Google Satellite, Bing Maps, Bing Satellite, Sachsen).'
arch=('any')
url="https://gitlab.com/marble-restricted-maps"
license=('custom: metapackage')
depends=(
  'marble-maps-googlemaps'
  'marble-maps-googlesat'
  'marble-maps-virtualearth'
  #'marble-maps-bingsatellite'
  'marble-maps-virtualearthos'
  #'marble-maps-bing'
  'marble-maps-sachsen'
  # 'marble-maps-thueringen'
  # 'marble-maps-hessen'
)
makedepends=()
provides=()
conflicts=()
replaces=(
  'marble-restricted-maps-git<=latest'
)
source=(
  'license-metapackage-pd.txt'
)
sha256sums=(
  'af68dd29515606a94237214e4c33b0e3f4f2408ed92df3674a043bf2fa2c0078'
)

package() {
  install -D -v -m644 "${srcdir}/license-metapackage-pd.txt" "${pkgdir}/usr/share/licenses/${pkgname}/copying.public-domain.txt"
}

# vim:set ts=2 sw=2 et:
