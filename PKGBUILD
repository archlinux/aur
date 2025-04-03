pkgname=ttf-fluent-emoji
pkgver=0.8.2
pkgrel=1
pkgdesc="fluent-emoji by Microsoft"
arch=('any')
url="https://github.com/tetunori/fluent-emoji-webfont"
license=('MIT')
depends=('fontconfig')
source=(
    "https://github.com/tetunori/fluent-emoji-webfont/archive/refs/tags/v$pkgver.tar.gz"
)
sha256sums=('8eff57d0f6034440bebe79784fca3de13233bee4edab0fbe661614a0b9d63f11')

package() {
    cd $srcdir/fluent-emoji-webfont-$pkgver

    mkdir -p $pkgdir/usr/share/fonts/TTF/fluent-emoji
    find $srcdir -name "*.ttf" -exec install -Dm644 {} -t $pkgdir/usr/share/fonts/TTF/fluent-emoji \;
}
