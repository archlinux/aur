# Maintainer: Yufan You <ouuansteve at gmail>

pkgname=htmltest-bin
pkgver=0.14.0
pkgrel=2
provides=('htmltest')
conflicts=('htmltest')
pkgdesc='Test generated HTML for problems'
arch=('x86_64')
url="https://github.com/wjdp/htmltest"
license=('MIT')
source=("https://github.com/wjdp/htmltest/releases/download/v${pkgver}/htmltest_${pkgver}_linux_amd64.tar.gz")
sha256sums=('ac47355b06ec9ee59d4a6cbd51be6402c3e6b7211275bd3e307c684ed74c1eba')

package() {
  install -Dm755 htmltest -t "${pkgdir}"/usr/bin
  install -Dm644 LICENCE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
