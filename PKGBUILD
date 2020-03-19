# Maintainer: Sam Rose <hello@samwho.dev>

pkgname='hmm-bin'
pkgdesc='A small command-line note taking app written in Rust.'
pkgver='0.2'
pkgrel='1'
arch=('x86_64')
url='https://github.com/samwho/hmm'
license=('MIT')
depends=()
optdepends=()
makedepends=()
checkdepends=()
provides=(hmm hmmq)
conflicts=(hmm hmmq)
source=("${pkgname}-v${pkgver}.tar.gz::https://github.com/samwho/hmm/releases/download/v${pkgver}/hmm-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('bad645453db646c9316d95ccda9f3f15d1bb9ca9d05c66cb184b40c20457c5c6')

package() {
    install -Dm755 "hmm" "$pkgdir/usr/bin/hmm"
    install -Dm755 "hmmq" "$pkgdir/usr/bin/hmmq"
}
