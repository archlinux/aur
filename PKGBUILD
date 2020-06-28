# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=finalcrypt
pkgver=6.3.8
pkgrel=1
pkgdesc="The World's Strongest Encryption"
arch=('x86_64')
url='http://www.finalcrypt.org'
license=('CCPL')
depends=('java-runtime>=8'
         'gtk2'
         'libnet'
         'ffmpeg'
         'gtk3')
makedepends=('tar')
source=("${pkgname}-${pkgver}.deb::http://www.finalcrypt.org/downloads/linux/finalcrypt_linux_x86_64_debian_based.deb")
sha256sums=('e44a18990c793eff06580757bd66be777f052cc10d13dfc9be187f6157129c87')

package() {
  tar xvf data.tar.xz -C "${pkgdir}/"
  install -Dm644 "${pkgdir}/opt/FinalCrypt/FinalCrypt.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  rm "${pkgdir}/opt/FinalCrypt/FinalCrypt.desktop"
}