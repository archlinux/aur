# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=reviewdog-bin
pkgver=0.11.0
pkgrel=1
pkgdesc='Automated code review tool integrated with any code analysis tools regardless of programming language'
arch=('x86_64')
url="https://github.com/reviewdog/reviewdog"
license=('MIT')
provides=('reviewdog')
source=("${pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/reviewdog_${pkgver}_Linux_x86_64.tar.gz")
sha256sums=('94eac7f09d4b8a3d8b03e0b164746d8fb07f27dd6c60dad22e84cd68f4dcb54c')

package() {
  install -Dm644 "${srcdir}"/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm755 "${srcdir}"/reviewdog "${pkgdir}/usr/bin/reviewdog"
}
# vim:set ts=2 sw=2 et:
