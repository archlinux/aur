# Maintainer: Brett Cornwall <ainola@archlinux.org>

pkgname=ttf-kridhamardawa
pkgver=1.0
pkgrel=1
pkgdesc='A font based on KepatihanPro for the notation of gamelan music'
url="https://www.kratonjogja.id/peristiwa/110/keraton-yogyakarta-luncurkan-font-baru-untuk-notasi-gendhing-gamelan"
license=('custom')
arch=('any')
source=(
    "$pkgname-$pkgver.zip::https://www.kratonjogja.id/upload/files/kridhamardawa-font.zip"
    "https://www.kratonjogja.id/upload/files/Petunjuk_Teknis_Font_Kridhamardawa.pdf"
)
sha256sums=('b2e599009eed75159c05f255124c5d54ca3af4a3865c2f4732630ecd725cba59'
            'b7771b6330b39480279d263a396a6da9bbf1e566116038a2fb86a38a0580079a')

package() {
    install -Dm644 kridhamardawa-bold.ttf "$pkgdir/usr/share/fonts/TTF/Kridhamardawa-Bold.ttf"
    install -Dm644 kridhamardawa-regular.ttf "$pkgdir/usr/share/fonts/TTF/Kridhamardawa-regular.ttf"
    install -Dm644 Petunjuk_Teknis_Font_Kridhamardawa.pdf -t "$pkgdir/usr/share/doc/$pkgname/"
}
