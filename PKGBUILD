# Maintainer: grimsock <lord.grimsock at gmail dot com>
# Contributor: kkb110

pkgname=jgit
pkgver=4.11.0.201803080745_r
pkgrel=1
pkgdesc="A 100% pure java implementation of git"
arch=('any')
url="http://www.eclipse.org/jgit/"
license=('custom:EDL')
depends=('java-runtime-common')
source=("https://repo.eclipse.org/content/groups/releases//org/eclipse/${pkgname}/org.eclipse.${pkgname}.pgm/${pkgver//_/-}/org.eclipse.${pkgname}.pgm-${pkgver//_/-}.sh"
        "license.txt"
        "jgit")
noextract=("org.eclipse.${pkgname}.pgm-${pkgver//_/-}.sh")

md5sums=('1e42f29bdb0832bc57808dfba2c5f1bd'
         'e67c5b842365a14ff39a3bd4a02842cb'
         '7fe47651a0cef93febd15491b2d73cd6')
sha256sums=('f12ec2fe7bb6a9a7899bf0628a98a303c2b325640021afb883bebc1d42fb41cf'
            '7df6bb0c62b53240372c458dc6f88940f5ed81bde82e54403e1826134592dde5'
            'b89a54dd77a18813b0766d0577c1e99b6b1feb848d1d02c7e01fad63785d0731')

package() {
  install -Dm 755 "${srcdir}/org.eclipse.${pkgname}.pgm-${pkgver//_/-}.sh" "${pkgdir}/usr/share/java/${pkgname}/org.eclipse.${pkgname}.pgm-${pkgver//_/-}.sh"
  install -Dm 644 "license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -Dm 755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
