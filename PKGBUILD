# Maintainer: grimsock <lord.grimsock at gmail dot com>
# Contributor: kkb110

pkgname=jgit
pkgver=4.7.0.201704051617_r
pkgrel=2
pkgdesc="A 100% pure java implementation of git"
arch=('any')
url="http://www.eclipse.org/jgit/"
license=('custom:EDL')
depends=('java-runtime-common')
source=("https://repo.eclipse.org/content/groups/releases//org/eclipse/${pkgname}/org.eclipse.${pkgname}.pgm/${pkgver//_/-}/org.eclipse.${pkgname}.pgm-${pkgver//_/-}.sh"
        "license.txt"
        "jgit")
noextract=("org.eclipse.${pkgname}.pgm-${pkgver//_/-}.sh")

md5sums=('0b41435fbe1c3f89b9f0920335a18fb2'
         'e67c5b842365a14ff39a3bd4a02842cb'
         'fe0a7185983127913d27d3e2bbc69626')
sha256sums=('53b15384854c1a7286c9ae5202329615ea293ba1adacceab138c02597cc6ebca'
            '7df6bb0c62b53240372c458dc6f88940f5ed81bde82e54403e1826134592dde5'
            'eeebeec2c9c93661aca250b7530160df710ad5261ddeaf3d4b2bbcd7c31fed78')

package() {
  install -Dm 755 "${srcdir}/org.eclipse.${pkgname}.pgm-${pkgver//_/-}.sh" "${pkgdir}/usr/share/java/${pkgname}/org.eclipse.${pkgname}.pgm-${pkgver//_/-}.sh"
  install -Dm 644 "license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -Dm 755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
