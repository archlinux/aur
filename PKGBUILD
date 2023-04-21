pkgname=x-pixiv-bin
pkgver=1.0.1
pkgrel=1
pkgdesc="Pixiv downloader"
url="https://github.com/xiaoxigua-1/XPixiv"
license=("MIT")
arch=("x86_64")
provides=("x-pixiv")
conflicts=("x-pixiv")
depends=("openssl-1.1")
source_x86_64=("https://github.com/xiaoxigua-1/XPixiv/releases/download/v.1.0.1/x-pixiv-1.0.1-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("https://github.com/xiaoxigua-1/XPixiv/releases/download/v.1.0.1/x-pixiv-1.0.1-aarch64-unknown-linux-gnu.tar.gz")

package() {
    install -Dm755 x-pixiv -t "$pkgdir/usr/bin"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
sha256sums_x86_64=('39a413ee7f566eb5651c8eaa222bd57f38218a69a9f07f164c60a4697666bc79')
