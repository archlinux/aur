# Maintainer: lakejason0 <lakesarchive@outlook.com>

pkgname=ttf-plangothic
pkgver=2.9.5771
pkgrel=1
pkgdesc='Plangothic Project (遍黑体), based on Source Han Sans, contains glyphs of Extension blocks of CJK Unified Ideographs.'
arch=(any)
url='https://github.com/Fitzgerald-Porthmouth-Koenigsegg/Plangothic-Project'
license=(OFL-1.1)
depends=(fontconfig)
source=(
    $pkgname-$pkgver-PlangothicP1-Regular.ttf::"https://github.com/Fitzgerald-Porthmouth-Koenigsegg/Plangothic-Project/releases/download/V$pkgver/PlangothicP1-Regular.ttf"
    $pkgname-$pkgver-PlangothicP2-Regular-$pkgver.ttf::"https://github.com/Fitzgerald-Porthmouth-Koenigsegg/Plangothic-Project/releases/download/V$pkgver/PlangothicP2-Regular.ttf"
    $pkgname-$pkgver-LICENSE::"https://raw.githubusercontent.com/Fitzgerald-Porthmouth-Koenigsegg/Plangothic/V$pkgver/LICENSE.txt"
)
b2sums=('144da5b163455247d30ed0a2cbd27dcb448182f12591b5b581e951b3584f10824b4ba22f8d7640f762765b656d76750bcc7abd052680c041bdf93e6fcfd0da3b'
        '5329c860eb94f9ecd69c0e0c46d439f2d396064cfb5cac0907ac737b1dc43aa78d24a338246b791eab3f2a94e68cd34c61f3b3aa20f56289a05133dc81a94250'
        'e3b7def662ec2412a460be8aebf5da2c2e57955d30438a7222c800c5ef6f5dce32cf510ea3f57f3435d93758725c172ea4e7e28d91f17ef049b45d4a428f88d9')

package() {
    install -Dm644 "$srcdir/$pkgname-$pkgver-PlangothicP1-Regular-$pkgver.ttf" "$pkgdir/usr/share/fonts/plangothic/PlangothicP1-Regular.ttf"
    install -Dm644 "$srcdir/$pkgname-$pkgver-PlangothicP2-Regular-$pkgver.ttf" "$pkgdir/usr/share/fonts/plangothic/PlangothicP2-Regular.ttf"
    install -Dm644 "$srcdir/$pkgname-$pkgver-LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
