# Maintainer: Sam Rose <hello@samwho.dev>

pkgname='hmm-bin'
pkgdesc='A small command-line note taking app written in Rust.'
pkgver='0.4.1'
pkgrel='1'
arch=('x86_64')
url='https://github.com/samwho/hmm'
license=('MIT')
depends=()
optdepends=()
makedepends=()
checkdepends=()
provides=(hmm hmmq hmmp)
conflicts=(hmm hmmq hmmp)
source=("${pkgname}-v${pkgver}.tar.gz::https://github.com/samwho/hmm/releases/download/v${pkgver}/hmm-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('88a247940e911b128efa1b7028d23c464ac6b060119b8ace919003a39c75dc39')

package() {
    install -Dm755 "hmm" "$pkgdir/usr/bin/hmm"
    install -Dm755 "hmmq" "$pkgdir/usr/bin/hmmq"
    install -Dm755 "hmmp" "$pkgdir/usr/bin/hmmp"
}
