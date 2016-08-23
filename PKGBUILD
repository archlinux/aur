# Maintainer: grimsock <lord.grimsock at gmail dot com>
# Contributor: kkb110

pkgname=jgit
pkgver=4.4.1.201607150455_r
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

md5sums=('40dca11cca5b1160545b02df2663fff8'
         'e67c5b842365a14ff39a3bd4a02842cb'
         '1c65b91ccf1c9b192ebe9a3a565d0d3c')
sha256sums=('62c4fcb0e265e644a9cad372d3f60943fb2b2ee809895f16ef0e552810528b77'
            '7df6bb0c62b53240372c458dc6f88940f5ed81bde82e54403e1826134592dde5'
            'a8eae456761531d3c617b433d4eb88879aec74d371c22092d72e2584768a782c')

package() {
  install -Dm 755 "${srcdir}/org.eclipse.${pkgname}.pgm-${pkgver//_/-}.sh" "${pkgdir}/usr/share/java/${pkgname}/org.eclipse.${pkgname}.pgm-${pkgver//_/-}.sh"
  install -Dm 644 "license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -Dm 755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
