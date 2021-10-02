# Maintainer: Yufan You <ouuansteve at gmail>

pkgname=htmltest-bin
pkgver=0.15.0
pkgrel=1
provides=('htmltest')
conflicts=('htmltest')
pkgdesc='Test generated HTML for problems'
arch=('x86_64')
url="https://github.com/wjdp/htmltest"
license=('MIT')
source=(
    "https://github.com/wjdp/htmltest/releases/download/v${pkgver}/htmltest_${pkgver}_linux_amd64.tar.gz"
    "https://github.com/wjdp/htmltest/raw/v${pkgver}/LICENCE"
)
sha256sums=('55d4f0f9b50ff1c7b9629a7ec45dc082c8bda94d1004ee5d1baf3f622727b924'
            '7aa00c7fdb5b0284ee72b0fdb18a0bede0f0479703ca3224e0acb47d2016fb71')

package() {
  install -Dm755 htmltest -t "${pkgdir}"/usr/bin
  install -Dm644 LICENCE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
