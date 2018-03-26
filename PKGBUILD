# $Id: PKGBUILD 214918 2017-03-04 19:39:52Z muflone $
# Maintainer: petRUShka

pkgname=telegram_backup
pkgver=1.1.3
pkgrel=1
pkgdesc="Java app to download all your telegram data."
arch=('any')
url="https://github.com/fabianonline/telegram_backup"
license=('GPL')
depends=('java-runtime')
source=("https://github.com/fabianonline/${pkgname}/releases/download/${pkgver}/${pkgname}.jar"
        "${pkgname}.sh")

sha256sums=('4519e50835878b9f201fbb31eb928dad5dc1954948cf5ce3a0cf2dcd8a1244ba'
            '4ffd955103e1a08ec2d5ba2fd5fd046bd773a91f4b52b519dbcbb6ad4df37203')

package() {
  cd "${srcdir}"
  install -D -m 644 "${pkgname}.jar" "${pkgdir}/usr/share/java/${pkgname}.jar"
  install -D -m 755 "${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
}
