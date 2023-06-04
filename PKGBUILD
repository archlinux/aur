# Maintainer: Sam Rose <hello@samwho.dev>

pkgname='hmm-bin'
pkgdesc='A small command-line note taking app written in Rust.'
pkgver='0.6.0'
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
sha256sums=('3a9d97f4c0d1017230f9d39df4809b3ef6a463ef3821fb12373da1718268512f')

package() {
    install -Dm755 "hmm" "$pkgdir/usr/bin/hmm"
    install -Dm755 "hmmq" "$pkgdir/usr/bin/hmmq"
    install -Dm755 "hmmp" "$pkgdir/usr/bin/hmmp"
}
