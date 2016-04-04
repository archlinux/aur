# Maintainer: grimsock <lord.grimsock at gmail dot com>
# Contributor: kkb110

pkgname=jgit
pkgver=4.2.0.201601211800_r
pkgrel=1
pkgdesc="A 100% pure java implementation of git"
arch=('any')
url="http://www.eclipse.org/jgit/"
license=('custom:EDL')
depends=('java-runtime-common')
source=("https://repo.eclipse.org/content/groups/releases//org/eclipse/${pkgname}/org.eclipse.${pkgname}.pgm/${pkgver//_/-}/org.eclipse.${pkgname}.pgm-${pkgver//_/-}.sh"
        "license.txt"
        "jgit")
md5sums=('372a8453acbc782b76ea331e5858279f'
         'e67c5b842365a14ff39a3bd4a02842cb'
         'e18a8b7702ac5d5c97664198343e3f6d')
sha256sums=('032e401957f0eb42b259caefa69904e7b5b34b01d2eab5c09d3565b3aa4a83a2'
            '7df6bb0c62b53240372c458dc6f88940f5ed81bde82e54403e1826134592dde5'
            '15dd64ef5492bbe918e718f4e7e4ba621daa0d2cbfd32408cd329c581a5ca772')

package() {
  install -Dm 755 "${srcdir}/org.eclipse.${pkgname}.pgm-${pkgver//_/-}.sh" "${pkgdir}/usr/share/java/${pkgname}/org.eclipse.${pkgname}.pgm-${pkgver//_/-}.sh"
  install -Dm 644 "license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -Dm 755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
