# Maintainer: Vinicius Correa <vinicius dot correa at zoho dot com>
pkgname=gendev
pkgver=0.3.2
pkgrel=1
pkgdesc="Genesis development environment for Linux"
arch=('any')
url="https://github.com/kubilus1/${pkgname}"
license=('BSD')
depends=('texinfo')
makedepends=('')
optdepends=('')
source=("https://github.com/kubilus1/gendev/releases/download/0.3.2/${pkgname}_${pkgver}.txz")
md5sums=('bee00fcef94169a82cba3c6b6c415777')

package() {
  install -d "${pkgdir}/opt/${pkgname}"

  cp -r "${srcdir}/opt/${pkgname}/"* "${pkgdir}/opt/${pkgname}" -R
}
