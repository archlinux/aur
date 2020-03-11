# Maintainer: Kenneth Endfinger <kaendfinger@gmail.com>

pkgname=jgit
pkgver=5.7.0.202003110725_r
pkgrel=1
pkgdesc="A 100% pure java implementation of git"
arch=('any')
url="http://www.eclipse.org/jgit/"
license=('custom:EDL')
depends=('java-runtime-common')
source=("jgit-${pkgver}.sh::https://repo.eclipse.org/content/groups/releases//org/eclipse/${pkgname}/org.eclipse.${pkgname}.pgm/${pkgver//_/-}/org.eclipse.${pkgname}.pgm-${pkgver//_/-}.sh"
        "license.txt"
)
noextract=("org.eclipse.${pkgname}.pgm-${pkgver//_/-}.sh")

sha512sums=('52289b9f53deb1514fe2d69cb356619a4d690baed2625476d8017a5d1122edf491a69dffc264cabd9b335e8f3aa61304c93503e9a61d38b87a8448a1edd06d83'
            '289185bead9328258444210c1bfc1867f54ebb3cd6112b7b8e05da8e1aee32ceab0a8da3c99aaf5615cb00fe0bd174a0dca43922baa53775688bbef0b86ceadb')

package() {
  install -Dm 755 "${srcdir}/jgit-${pkgver}.sh" "${pkgdir}/usr/bin/jgit"
  install -Dm 644 "license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
