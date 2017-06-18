# Maintainer: grimsock <lord.grimsock at gmail dot com>
# Contributor: kkb110

pkgname=jgit
pkgver=4.7.1.201706071930_r
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

md5sums=('f87a17986d3bd071eb431526ae9085cd'
         'e67c5b842365a14ff39a3bd4a02842cb'
         '22ed2c26a3e11577c107f6122a0d6cbf')
sha256sums=('cbcaeeea43e7d9e930df90b7e5205f4ebd156c0e526eca21f1b87b523056e8f8'
            '7df6bb0c62b53240372c458dc6f88940f5ed81bde82e54403e1826134592dde5'
            '4b583ac0ca21db8954af0fcd0d5534f9afd7b71ed30ec7c8765c3938d897b6d5')

package() {
  install -Dm 755 "${srcdir}/org.eclipse.${pkgname}.pgm-${pkgver//_/-}.sh" "${pkgdir}/usr/share/java/${pkgname}/org.eclipse.${pkgname}.pgm-${pkgver//_/-}.sh"
  install -Dm 644 "license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -Dm 755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
