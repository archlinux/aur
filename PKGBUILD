# Maintainer: wereii <wereii@wereii.cz>
# File Author: Damian Blanco <blanco.damian@gmail.com>
# Note: Copied from
#  https://github.com/deimon777/AUR/blob/4a818c69382b46026e6cf336acbcf716be161957/SimulIDE/PKGBUILD

pkgname=simulide
pkgver=0.4.13.SR5
pkgver_base="0.4.13"
pkgver_dash="0.4.13-SR5"
pkgrel=1
pkgdesc="Real time electronic circuit simulator (supports PIC, AVR and Arduino microcontrollers)"
arch=('x86_64')
url="https://www.simulide.com/"
license=('GPL3')
source=("https://mailfence.com/pub/docs/santigoro/web/SimulIDE_${pkgver_base}/SimulIDE_${pkgver_dash}_Lin64.tar.gz" "simulide.desktop")
md5sums=('b29a3c9fb291ec94a7eb0e12caedb293'
         'beda8f4452562e5cc1e2c9a19ac99bb3')
depends=(
  'gpsim'
  'qt5-multimedia'
  'qt5-serialport'
  'qt5-svg'
  'qt5-tools'
)

package() {
  cp -r ${srcdir}/SimulIDE_${pkgver_dash}_Lin64/ ${pkgdir}/usr/
  install -Dm644 "${srcdir}"/simulide.desktop "${pkgdir}"/usr/share/applications/simulide.desktop
}
