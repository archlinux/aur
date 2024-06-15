# Maintainer: iamawacko <iamawacko@protonmail.com>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=finalcrypt
pkgver=6.8.0
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
sha256sums=('f6df42b3ff05dced53efc33760028d62375e52fc7a1988790e54a670073e891c')

package() {
  tar xvf data.tar.xz -C "${pkgdir}/"
  install -Dm644 "${pkgdir}/opt/FinalCrypt/FinalCrypt.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  rm "${pkgdir}/opt/FinalCrypt/FinalCrypt.desktop"
}
