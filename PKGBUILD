# Maintainer: adamanteye <ada@adamanteye.cc>
pkgname=ttf-noto-sans-mongolian
pkgver=3.002
pkgrel=1
pkgdesc="Noto Sans Mogolian fonts."
arch=('any')
url='https://github.com/notofonts/mongolian'
license=('OFL-1.1')
source=(
    "$pkgname-$pkgver.zip::$url/releases/download/NotoSansMongolian-v3.002/NotoSansMongolian-v3.002.zip"
)
sha256sums=(
    'a5d3085d4040ecd92d44bf5c4f8faaeae7ba3147cf82e09aa2ef5ad46475de6c'
)
package() {
    install -Dm644 "OFL.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    cd "NotoSansMongolian/full/ttf"
    install -Dm644 "NotoSansMongolian-Regular.ttf" "$pkgdir/usr/share/fonts/noto/NotoSansMongolian-Regular.ttf"
}
