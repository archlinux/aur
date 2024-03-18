# Maintainer: Sosuke Inaba <mail[at]daizu[dot]dev>

pkgname=ttf-pending-mono
pkgver=0.0.2
pkgrel=1
pkgdesc="A composite font of BIZ UD Gothic and Commit Mono"
arch=(any)
url="https://github.com/yuru7/pending-mono"
license=(custom:SIL)
source=("$url/releases/download/v$pkgver/PendingMono_v$pkgver.zip"
        "$url/releases/download/v$pkgver/PendingMonoNF_v$pkgver.zip"
        "$url/releases/download/v$pkgver/PendingMonoJPDOC_v$pkgver.zip"
        "$url/releases/download/v$pkgver/PendingMonoHW_v$pkgver.zip"
        "$url/releases/download/v$pkgver/PendingMonoHWNF_v$pkgver.zip"
        "$url/releases/download/v$pkgver/PendingMonoHWJPDOC_v$pkgver.zip"
        "https://raw.githubusercontent.com/yuru7/pending-mono/v$pkgver/LICENSE")
sha256sums=('76388ee21bb11cf09b43fac154826e0da0499be6ffc49633e3f85b53f0947e3d'
            'fefafcaa1af11c1841f8aa943205a7303b1a091f20ded17467cc414a9e863106'
            '9aadcdd6c95a737330842b23b0adba3eb6ad7208c377ee4823592f83c90c4da1'
            'c03d8b16af20718fd0ce94b8658912f4f706e8ea8558b0564f6a90888e00460c'
            '67a2f9142999e19d30e8aeaac19ae15caf9d348fa726d17e80bb753f64ea50e4'
            'fdf487f62573c5d37b28f50500d1bb94e2275209c4a23ada28ae724169411167'
            '9d23767271951afeaddbe5de4dec5d1cb60456c06f45e4d04fbb9ab517d79e30')

package() {
    install -d $pkgdir/usr/share/fonts/TTF
    install -m644 PendingMono_v$pkgver/*.ttf $pkgdir/usr/share/fonts/TTF
    install -m644 PendingMonoNF_v$pkgver/*.ttf $pkgdir/usr/share/fonts/TTF
    install -m644 PendingMonoJPDOC_v$pkgver/*.ttf $pkgdir/usr/share/fonts/TTF
    install -m644 PendingMonoHW_v$pkgver/*.ttf $pkgdir/usr/share/fonts/TTF
    install -m644 PendingMonoHWNF_v$pkgver/*.ttf $pkgdir/usr/share/fonts/TTF
    install -m644 PendingMonoHWJPDOC_v$pkgver/*.ttf $pkgdir/usr/share/fonts/TTF
    install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE.txt
}
