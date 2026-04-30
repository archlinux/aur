# Maintainer: indusy <indusywu@qq.com>

pkgname=ttf-plangothic
pkgver=2.9.5792
pkgrel=1
pkgdesc='Plangothic Project (遍黑体), based on Source Han Sans, contains glyphs of Extension blocks of CJK Unified Ideographs.'
arch=(any)
url='https://github.com/Fitzgerald-Porthmouth-Koenigsegg/Plangothic-Project'
license=(OFL-1.1)
depends=(fontconfig)
install=$pkgname.install
source=(
    Plangothic-Static-V$pkgver.zip::"https://github.com/Fitzgerald-Porthmouth-Koenigsegg/Plangothic-Project/releases/download/V$pkgver/Plangothic-Static-V$pkgver.zip"
    $pkgname-$pkgver-$pkgrel-LICENSE::"https://raw.githubusercontent.com/Fitzgerald-Porthmouth-Koenigsegg/Plangothic_Project/V$pkgver/LICENSE-OFL.txt"
)
b2sums=('c097350af7f412d8da0880246454da73d17d1b651ead494216c997b77d02e1332b4633b23050793ed5be6ca5433f904ad29cea1a2c12d00f9fd87f1aba247bf3'
        'e3b7def662ec2412a460be8aebf5da2c2e57955d30438a7222c800c5ef6f5dce32cf510ea3f57f3435d93758725c172ea4e7e28d91f17ef049b45d4a428f88d9')
package() {
    install -Dm644 "$srcdir/Plangothic-Static-V$pkgver/Plangothic.ttc" "$pkgdir/usr/share/fonts/plangothic/Plangothic.ttc"
    install -Dm644 "$srcdir/Plangothic-Static-V$pkgver/PlangothicP1-Regular.ttf" "$pkgdir/usr/share/fonts/plangothic/PlangothicP1-Regular.ttf"
    install -Dm644 "$srcdir/Plangothic-Static-V$pkgver/PlangothicP2-Regular.ttf" "$pkgdir/usr/share/fonts/plangothic/PlangothicP2-Regular.ttf"
    install -Dm644 "$srcdir/$pkgname-$pkgver-$pkgrel-LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
