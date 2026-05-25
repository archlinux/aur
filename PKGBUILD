# Maintainer: mhpsy <woxiwangrenmendouxihuanwo@gmail.com>
pkgname=xiaohe-bin
_pkgname=xiaohe
pkgver=0.1.1
pkgrel=1
pkgdesc="CLI for querying the Xiaohe Shuangpin (小鹤双拼) scheme"
arch=('x86_64')
url="https://github.com/mhpsy/xiaohe"
license=('MIT')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=(
    "$_pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/xiaohe-x86_64-unknown-linux-gnu.tar.gz"
    "LICENSE-$pkgver::https://raw.githubusercontent.com/mhpsy/xiaohe/v$pkgver/LICENSE"
)
sha256sums=(
    '189abfd68a2242c3dacaffda8f7c12c2bb60105775fec7cdaa7e773a146445a7'
    'fc3bc58f892ca8b114acf16f65dadf53c7c3887ae5ef9511d97ede3f999136a1'
)

package() {
    install -Dm755 "$srcdir/xiaohe" "$pkgdir/usr/bin/xiaohe"
    install -Dm644 "$srcdir/LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
