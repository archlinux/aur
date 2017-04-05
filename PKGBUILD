# Maintainer: grimsock <lord.grimsock at gmail dot com>
# Contributor: kkb110

pkgname=jgit
pkgver=4.6.1.201703071140_r
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

md5sums=('20e1bf4b0f5734a608221295a2bdb437'
         'e67c5b842365a14ff39a3bd4a02842cb'
         '7344aa74ec3862a5ce6e844271569b46')
sha256sums=('bd142956a08ab252a7016dfe0a3f7e14e92162fe1ea1797255d1dded92ceb858'
            '7df6bb0c62b53240372c458dc6f88940f5ed81bde82e54403e1826134592dde5'
            '29086e86c884b6fc97f952889383f3f3d473b2c0ff86e2b4840141b0cfe6d4f3')

package() {
  install -Dm 755 "${srcdir}/org.eclipse.${pkgname}.pgm-${pkgver//_/-}.sh" "${pkgdir}/usr/share/java/${pkgname}/org.eclipse.${pkgname}.pgm-${pkgver//_/-}.sh"
  install -Dm 644 "license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -Dm 755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
