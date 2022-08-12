pkgname=ttf-plangothic
pkgver=0.4.4086
pkgrel=1
pkgdesc='遍黑体项目（Plangothic Project）'
arch=('any')
url='https://github.com/Fitzgerald-Porthmouth-Koenigsegg/Plangothic'
license=('SIL Open Font License')
depends=('fontconfig')
source=("https://github.com/Fitzgerald-Porthmouth-Koenigsegg/Plangothic/releases/download/V$pkgver/PlangothicP1-Regular.ttf"
"https://github.com/Fitzgerald-Porthmouth-Koenigsegg/Plangothic/releases/download/V$pkgver/PlangothicP2-Regular.ttf"
"https://github.com/Fitzgerald-Porthmouth-Koenigsegg/Plangothic/raw/main/LICENSE.txt")
md5sums=('d1f3ca0065111337a250347e2394f652'
         '2660e23c0c66e3789c39e89d1866a2a3'
         '2acc3a3b3765fa2098197e7b51871bd7')

package() {
    install -Dm644 "$srcdir/PlangothicP1-Regular.ttf" "$pkgdir/usr/share/fonts/plangothic/PlangothicP1-Regular.ttf"
    install -Dm644 "$srcdir/PlangothicP2-Regular.ttf" "$pkgdir/usr/share/fonts/plangothic/PlangothicP2-Regular.ttf"
    install -Dm644 "$srcdir/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
