# Maintainer Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=freeorion-data
pkgver=0.4.10
pkgrel=1
pkgdesc='A free, Open Source, turn-based space empire and galactic conquest computer game (data files)'
url='https://www.freeorion.org'
arch=('any')
license=('GPL2')
depends=('bash'
         'ttf-dejavu'
         'ttf-roboto'
         'python2'
         'hicolor-icon-theme'
         'boost171'
         'glew-2.1')
source=("${pkgname}-${pkgver}.deb::http://http.us.debian.org/debian/pool/main/f/freeorion/freeorion-data_${pkgver}-1_all.deb")
sha256sums=('06d48663a2467a0830de9af590979e57c87cbef5b3f91244ee11d936da08a7a7')

package() {
  tar xvf data.tar.xz -C "${pkgdir}"
}