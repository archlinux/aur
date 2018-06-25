# Maintainer: Raphaël Doursenaud <rdoursenaud@free.fr>
# Previous maintainer: psycepa <psycepa [at] mail.ru>

pkgname=totalvalidatorbasic
pkgver=11.9.0
pkgrel=2
pkgdesc="(X)HTML validator, an accessibility validator, a spell checker, and a broken links checker"
arch=('any')
url='https://www.totalvalidator.com'
license=('custom')
depends=('java-environment>=7' 'bash')
install='totalvalidatorbasic.install'
source=("https://www.totalvalidator.com/downloads/${pkgname}.tar.gz")
sha512sums=('f15a2e2110a358ba3f147a43bedbbee2a3725cae72bf9d7b815d8993d56881b2d82509419889511415b3a4527bd84cc79d551e9b2d987e60f2a6891e08c4d7a1')
package() {
  cd ${pkgdir}
  mkdir -p ${pkgdir}/opt/${pkgname}
  cp -r ${srcdir}/${pkgname}/* ${pkgdir}/opt/${pkgname}/
  # Install license
  mkdir -p ${pkgdir}/usr/share/licenses/${pkgname}
  cp ${srcdir}/${pkgname}/Licence.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
