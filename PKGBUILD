pkgname=x-pixiv-bin
pkgver=0.1.6
pkgrel=1
pkgdesc="Pixiv downloader"
url="https://github.com/xiaoxigua-1/XPixiv"
license=("MIT")
arch=("x86_64")
provides=("x-pixiv")
conflicts=("x-pixiv")
depends=("openssl")
source_x86_64=("https://github.com/xiaoxigua-1/XPixiv/releases/download/v.0.1.6/x-pixiv-0.1.6-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("https://github.com/xiaoxigua-1/XPixiv/releases/download/v.0.1.6/x-pixiv-0.1.6-aarch64-unknown-linux-gnu.tar.gz")

package() {
    install -Dm755 x-pixiv -t "$pkgdir/usr/bin"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
sha256sums_x86_64=('c72b47da6f4b761f2cfd8855267261e622adaafdfcf9974fe46050cec750316a')
