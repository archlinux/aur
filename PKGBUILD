# $Id: PKGBUILD 214918 2017-03-04 19:39:52Z muflone $
# Maintainer: petRUShka, Stunkymonkey

pkgname=telegram_backup
pkgver=1.1.4
pkgrel=1
pkgdesc="Java app to download all your telegram data."
arch=('any')
url="https://github.com/fabianonline/telegram_backup"
license=('GPL')
depends=('java-runtime')
source=("https://github.com/fabianonline/${pkgname}/releases/download/${pkgver}/${pkgname}.jar"
        "${pkgname}.sh")
sha256sums=('80bdfc2bbb60eeca8163fa5608544ee5afe661e920dfb7ff0d0e636f8aad59b1'
            '4ffd955103e1a08ec2d5ba2fd5fd046bd773a91f4b52b519dbcbb6ad4df37203')

package() {
  cd "${srcdir}"
  install -D -m 644 "${pkgname}.jar" "${pkgdir}/usr/share/java/${pkgname}.jar"
  install -D -m 755 "${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
}
