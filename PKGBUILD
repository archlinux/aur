pkgname=x-pixiv-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="Pixiv downloader"
url="https://github.com/xiaoxigua-1/XPixiv"
license=("MIT")
arch=("x86_64")
provides=("x-pixiv")
conflicts=("x-pixiv")
depends=("openssl-1.1")
source_x86_64=("https://github.com/xiaoxigua-1/XPixiv/releases/download/v.1.0.0/x-pixiv-1.0.0-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("https://github.com/xiaoxigua-1/XPixiv/releases/download/v.1.0.0/x-pixiv-1.0.0-aarch64-unknown-linux-gnu.tar.gz")

package() {
    install -Dm755 x-pixiv -t "$pkgdir/usr/bin"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
sha256sums_x86_64=('6e4aaa01ac9d816281e20a7de0d6781c630c4eb0e9c37c978fbc379b1dca76b4')
