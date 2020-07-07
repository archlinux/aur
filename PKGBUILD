# Maintainer: Xuanwo <xuanwo.cn#gmail.com>
# Maintainer: chengxuncc <chengxuncc@gmail.com>

pkgname=elvish-bin
pkgver=0.14.0
pkgrel=1
pkgdesc="A friendly and expressive Unix shell."
arch=('x86_64')
url="https://github.com/elves/elvish"
license=('custom:2-clause BSD')
provides=('elvish')
depends=('glibc')
source=(
  "https://dl.elv.sh/linux-amd64/elvish-v${pkgver}.tar.gz"
  "LICENSE"
)
sha256sums=(
  '884041804483415010f80946b00a78aabf1464ac6dcb1e7dfcfcde956e808d28'
  '1912e3785c0eb8d78e0ceed945b32596c11d0f9088aa5c1ad8f18f134f08c500'
)
install=elvish.install

package() {
    # binary
    install -Dm755 elvish-v${pkgver}  "${pkgdir}/usr/bin/elvish"
    # LICENSE
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
