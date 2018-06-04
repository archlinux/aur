# Maintainer: Raphaël Doursenaud <rdoursenaud@free.fr>
# Previous maintainer: psycepa <psycepa [at] mail.ru>

pkgname=totalvalidatorbasic
pkgver=11.9.0
pkgrel=1
pkgdesc="(X)HTML validator, an accessibility validator, a spell checker, and a broken links checker"
arch=('any')
url='https://www.totalvalidator.com'
license=('custom')
depends=('java-environment>=7' 'bash')
install='totalvalidatorbasic.install'
source=("https://www.totalvalidator.com/downloads/${pkgname}.tar.gz")
sha512sums=('5e47dbb6bdb70c9b475c4790cdf6812cc8ee2e102c7f233cd5ab685e2ee751cb677d4150e3e06e593071b0a7f61f12ff6198b761e9fd35515e2d4f413d7dfa53')
package() {
  cd ${pkgdir}
  mkdir -p ${pkgdir}/opt/${pkgname}
  cp -r ${srcdir}/${pkgname}/* ${pkgdir}/opt/${pkgname}/
  # Install license
  mkdir -p ${pkgdir}/usr/share/licenses/${pkgname}
  cp ${srcdir}/${pkgname}/Licence.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
