# Maintainer: Sam Rose <hello@samwho.dev>

pkgname='hmm-bin'
pkgdesc='A small command-line note taking app written in Rust.'
pkgver='0.5.0'
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
sha256sums=('c9ed4106ac523f05be10741e1c09db12da21017813cb5d8888a0075a97a9d12b')

package() {
    install -Dm755 "hmm" "$pkgdir/usr/bin/hmm"
    install -Dm755 "hmmq" "$pkgdir/usr/bin/hmmq"
    install -Dm755 "hmmp" "$pkgdir/usr/bin/hmmp"
}
