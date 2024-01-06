# Maintainer: Victor Bonnelle <victor.bonnelle@proton.me>

pkgname=ttf-lucide
pkgver=0.306.0
pkgrel=0
pkgdesc='Beautiful & consistent icon toolkit made by the community.'
arch=('any')
url='https://lucide.dev/'
licenses=('')
source=(
    'https://raw.githubusercontent.com/lucide-icons/lucide/main/LICENSE'
    "https://github.com/lucide-icons/lucide/releases/download/$pkgver/lucide-font-$pkgver.zip"
)
sha256sums=('SKIP' 'SKIP')

package() {
    install -Dm644 "$srcdir/lucide-font/lucide.ttf" "$pkgdir/usr/share/fonts/TTF/lucide.ttf"
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
