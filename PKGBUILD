# Maintainer: Lily Larsen <8o7wermobile at gmail dot com>
pkgname='otf-linja-pona'
pkgver='4.9'
pkgrel=1
pkgdesc="A toki pona font for the sitelen pona writing system"
arch=('any')
url="http://musilili.net/linja-pona/"
# jan Same needs to be contacted about the license of the work, the font metadata says ofl but no 
# copy of the license is provided with the font, leading me to be uncomfortable with saying it is
# OFL
license=('unknown')
# This package could build from source and then would require python-fontmake, however to me it
# isn't worth it to compile fonts, especially with how prone to failure python toolchains can be
source=("linja-pona-${pkgver}.otf::https://github.com/janSame/linja-pona/blob/master/linja-pona-4.9.otf?raw=true")
sha256sums=('c107d32b86ff4be37e60b74af3750289ed8baae4d03b8e05844e394c4b9725cb')

package() {
  install -dm 755 "${pkgdir}/usr/share/fonts/OTF"
  install -m 644 "linja-pona-${pkgver}.otf" "${pkgdir}/usr/share/fonts/OTF"
}
