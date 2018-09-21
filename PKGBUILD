# Maintainer: Xuanwo <xuanwo.cn#gmail.com>

pkgname=elvish-bin
pkgver=0.12
pkgrel=1
pkgdesc="A friendly and expressive Unix shell."
arch=('x86_64')
url="https://github.com/elves/elvish"
license=('custom:2-clause BSD')
provides=('elvish')
depends=('glibc')
source=(
  "https://dl.elv.sh/elvish-linux-amd64-${pkgver}.tar.gz"
  "LICENSE"
)
sha256sums=(
  '3dabcce5b8c4c6a277ff5b31793dab728fef952180c82099de7303ee43a001bc'
  '1912e3785c0eb8d78e0ceed945b32596c11d0f9088aa5c1ad8f18f134f08c500'
)
install=elvish.install

package() {
    # binary
    install -Dm755 elvish-linux-amd64-${pkgver}  "${pkgdir}/usr/bin/elvish"
    # LICENSE
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
