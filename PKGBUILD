# Maintainer: AbdAllah Aly Saad <aaly90 4t gma1l
# Maintainer: Babken Vardanyan <483ken 4t gma1l

pkgname=roffit
pkgver=0.8
pkgrel=1
pkgdesc="Converts nroff man pages to HTML"
arch=('any')
url="http://daniel.haxx.se/projects/roffit/"
license=('custom')
depends=('perl')
source=("git://github.com/aaly/roffit.git")
md5sums=('SKIP')

package() {
  install -Dm755 "roffit/roffit" "${pkgdir}/usr/bin/roffit"
  install -Dm644 "roffit/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -d "${pkgdir}/usr/share/man/roffit"
  install -Dm644 "roffit/roffit.1" "${pkgdir}/usr/share/man/roffit"
  install -Dm644 "roffit/testpage.1" "${pkgdir}/usr/share/man/roffit"
}
