# Maintainer: TheNeikos
pkgname=ttf-allura
pkgver=1.0
pkgrel=2
pkgdesc='Allura is the script format of the Allura Pro family. Like other designs by Rob Leuschke, Allura is stylized, yet very legible.'
arch=('any')
url='https://fonts.google.com/specimen/Allura'
license=('SIL OPEN FONT LICENSE Version 1.1')
depends=('fontconfig')
source=("${pkgname}.zip::https://fonts.google.com/download?family=Allura")
sha256sums=('0cdb005fb85c4b9bfe4641be578adec8cb161ecd3b845fb93120b09f93d20f83')

package() {
    install -d ${pkgdir}/usr/share/fonts/TTF/
    install -m644 ${srcdir}/*.ttf ${pkgdir}/usr/share/fonts/TTF/
    install -D -m644 ${srcdir}/OFL.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}

