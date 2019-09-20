# Maintainer: Vinicius Correa <vinicius dot correa at zoho dot com>
pkgname=gendev
pkgver=0.4.0
pkgrel=1
pkgdesc="Genesis development environment for Linux"
arch=('any')
url="https://github.com/kubilus1/${pkgname}"
license=('BSD')
depends=('texinfo' 'jdk8-openjdk')
options=(!strip)
makedepends=('')
optdepends=('')
source=("https://github.com/kubilus1/gendev/releases/download/${pkgver}/${pkgname}_${pkgver}.txz")
md5sums=('37e61b25baa4229aa6b6c3d79d7b7953')

package() {
  install -dm755 "${pkgdir}/opt"
  cp -r "${srcdir}/opt/${pkgname}" "${pkgdir}/opt/${pkgname}"
}
