# $Id: PKGBUILD 214918 2017-03-04 19:39:52Z muflone $
# Maintainer: petRUShka

pkgname=telegram_backup
pkgver=1.0.6
pkgrel=1
pkgdesc="Java app to download all your telegram data."
arch=('any')
url="https://github.com/fabianonline/telegram_backup"
license=('GPL')
depends=('java-runtime')
source=("https://github.com/fabianonline/${pkgname}/releases/download/${pkgver}/${pkgname}.jar"
        "${pkgname}.sh")

sha256sums=('1e93e42b52d04e07b9cdf46b10bc8d9c6726f17dd2f04a2e69fd582ce679d780'
            'c2e8fc8fb29761a1b273edba2a55bd57b48fa936815fcb2988a3f2a92bf30231')

package() {
  cd "${srcdir}"
  install -D -m 644 "${pkgname}.jar" "${pkgdir}/usr/share/java/${pkgname}.jar"
  install -D -m 755 "${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
}
