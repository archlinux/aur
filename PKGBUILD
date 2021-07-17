# Maintainer: Lily Larsen <8o7wermobile at gmail dot com>
pkgname='otf-linja-pona'
pkgver='4.2'
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
source=("linja-pona-${pkgver}.otf::https://github.com/janSame/linja-pona/blob/master/linja-pona-4.2.otf?raw=true")
sha256sums=('8d7664a942ecb293e37dd7c64654e9fd763fa97003ca4e9697e003fb26b05bd3')

package() {
  install -dm 755 "${pkgdir}/usr/share/fonts/OTF"
  install -m 644 "linja-pona-${pkgver}.otf" "${pkgdir}/usr/share/fonts/OTF"
}
