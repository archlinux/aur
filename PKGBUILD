# Maintainer: Kyuunex <kyuunex at protonmail dot ch>
# Contributor: orumin <dev at orum.in>

pkgname=ttf-koruri
pkgver=20210720
pkgrel=1
pkgdesc="Japanese TrueType font obtained by mixing M+ and Open Sans"
arch=('any')
url="https://github.com/Koruri/Koruri"
license=('Apache-2.0')
source=("https://github.com/Koruri/Koruri/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('f6cb55533a1f6b4a733152edc4153840151304e0fc4c232e586d4ec38e18cea1')

package() {
    install -Dm644 -t "$pkgdir/usr/share/fonts/TTF" "$srcdir/Koruri-$pkgver/Koruri-Bold.ttf"
    install -Dm644 -t "$pkgdir/usr/share/fonts/TTF" "$srcdir/Koruri-$pkgver/Koruri-Extrabold.ttf"
    install -Dm644 -t "$pkgdir/usr/share/fonts/TTF" "$srcdir/Koruri-$pkgver/Koruri-Light.ttf"
    install -Dm644 -t "$pkgdir/usr/share/fonts/TTF" "$srcdir/Koruri-$pkgver/Koruri-Regular.ttf"
    install -Dm644 -t "$pkgdir/usr/share/fonts/TTF" "$srcdir/Koruri-$pkgver/Koruri-Semibold.ttf"

    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" "$srcdir/Koruri-$pkgver/LICENSE"
}
