# Maintainer: Kyuunex <kyuunex at protonmail dot ch>

pkgname=ttf-ohruri
pkgver=20221103
pkgrel=1
pkgdesc="Japanese TrueType font obtained by mixing M+ FONTS, Source Han Sans, and Open Sans."
arch=('any')
url="https://github.com/Koruri/Ohruri"
license=('Apache-2.0')
source=("https://github.com/Koruri/Ohruri/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('3151949ea431012447f247690e2722362ef059f797e83a167a8b0223f8b54aa3')

package() {
    install -Dm644 -t "$pkgdir/usr/share/fonts/TTF" "$srcdir/Ohruri-$pkgver/Ohruri-Bold.ttf"
    install -Dm644 -t "$pkgdir/usr/share/fonts/TTF" "$srcdir/Ohruri-$pkgver/Ohruri-Extrabold.ttf"
    install -Dm644 -t "$pkgdir/usr/share/fonts/TTF" "$srcdir/Ohruri-$pkgver/Ohruri-Light.ttf"
    install -Dm644 -t "$pkgdir/usr/share/fonts/TTF" "$srcdir/Ohruri-$pkgver/Ohruri-Regular.ttf"
    install -Dm644 -t "$pkgdir/usr/share/fonts/TTF" "$srcdir/Ohruri-$pkgver/Ohruri-Semibold.ttf"

    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" "$srcdir/Ohruri-$pkgver/LICENSE"
}
