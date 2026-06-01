# Maintainer: mhpsy <woxiwangrenmendouxihuanwo@gmail.com>
pkgname=xiaohe-bin
_pkgname=xiaohe
pkgver=0.1.2
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
    '873f2a859bcd034aac3bf7d62e0169c337ba1d71b1b35bdc07a3ca773c86b4d2'
    'fc3bc58f892ca8b114acf16f65dadf53c7c3887ae5ef9511d97ede3f999136a1'
)

package() {
    install -Dm755 "$srcdir/xiaohe" "$pkgdir/usr/bin/xiaohe"
    install -Dm644 "$srcdir/LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
