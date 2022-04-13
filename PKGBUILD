# Maintainer: Yufan You <ouuansteve at gmail>

pkgname=htmltest-bin
pkgver=0.16.0
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
sha256sums=('4835e857f75d317e84fda6f9b112c70696095f8656740ca9421e74eb7e75f041'
            '7aa00c7fdb5b0284ee72b0fdb18a0bede0f0479703ca3224e0acb47d2016fb71')

package() {
  install -Dm755 htmltest -t "${pkgdir}"/usr/bin
  install -Dm644 LICENCE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
