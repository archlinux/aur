# Maintainer Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=freeorion-data
pkgver=0.4.10.1
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
         'boost-libs-171-opt'
         'glew-2.1')
source=("${pkgname}-${pkgver}.deb::http://ftp.br.debian.org/debian/pool/main/f/freeorion/freeorion-data_${pkgver}-1_all.deb")
sha256sums=('dac43f36da9408ab961c2bb578aeb213b615c69aad11e31f989b6b5b8ced5b5c')

package() {
  tar xvf data.tar.xz -C "${pkgdir}"
}
