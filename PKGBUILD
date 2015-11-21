# Maintainer: grimsock <lord.grimsock at gmail dot com>
# Contributor: kkb110

pkgname=jgit
pkgver=4.1.1.201511131810_r
pkgrel=1
pkgdesc="A 100% pure java implementation of git"
arch=('any')
url="http://www.eclipse.org/jgit/"
license=('custom:EDL')
depends=('java-runtime-common')
source=("https://repo.eclipse.org/content/groups/releases//org/eclipse/${pkgname}/org.eclipse.${pkgname}.pgm/${pkgver//_/-}/org.eclipse.${pkgname}.pgm-${pkgver//_/-}.sh"
        "license.txt"
        "jgit")
md5sums=('33b5ee51ba76625bb862d5042211d976'
         'e67c5b842365a14ff39a3bd4a02842cb'
         '9488936febf2d5b0f90fb13d93cc0c32')
sha256sums=('1ffa7073b267bae63d965597c2fd18b84d1acc47cd69ccca8b503f362abec9e1'
            '7df6bb0c62b53240372c458dc6f88940f5ed81bde82e54403e1826134592dde5'
            'daa8aefe66460073b853635859bf08745e668b55f75a7866443fc1e9a61965a7')

package() {
  install -Dm 755 "${srcdir}/org.eclipse.${pkgname}.pgm-${pkgver//_/-}.sh" "${pkgdir}/usr/share/java/${pkgname}/org.eclipse.${pkgname}.pgm-${pkgver//_/-}.sh"
  install -Dm 644 "license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -Dm 755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
