# Maintainer: nukotani<nukotani@incel.email>
pkgname=ttf-noto-sans-javanese-variable
pkgver=2.005
pkgrel=1
pkgdesc="Noto Sans Javanese fonts."
arch=('any')
url='https://github.com/notofonts/javanese'
license=('OFL-1.1')
source=(
    "$pkgname-$pkgver.zip::$url/releases/download/NotoSansJavanese-v2.005/NotoSansJavanese-v2.005.zip"
)
sha256sums=('3d096aeee4dc607a91e7568785595643cb5fde4a0b7c9c7f13a762c48d37a0cf')
package() {
    install -Dm644 \
        "$srcdir/NotoSansJavanese/unhinted/variable-ttf/NotoSansJavanese[wght].ttf" \
        "$pkgdir/usr/share/fonts/noto/NotoSansJavanese[wght].ttf"

    install -Dm644 \
        "$srcdir/OFL.txt" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
