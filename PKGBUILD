# Maintainer: Sam Rose <hello@samwho.dev>

pkgname='hmm-bin'
pkgdesc='A small command-line note taking app written in Rust.'
pkgver='0.5.2'
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
sha256sums=('ef230a1ca3dba0d3082707e1cf5ddc017e1f849cf92b96c35614e3a5d48ecef8')

package() {
    install -Dm755 "hmm" "$pkgdir/usr/bin/hmm"
    install -Dm755 "hmmq" "$pkgdir/usr/bin/hmmq"
    install -Dm755 "hmmp" "$pkgdir/usr/bin/hmmp"
}
