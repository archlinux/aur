pkgname=ttf-fluent-emoji
pkgver=0.8.2
pkgrel=2
pkgdesc="fluent-emoji by Microsoft"
arch=('any')
url="https://github.com/tetunori/fluent-emoji-webfont"
license=('MIT')
provides=('emoji-font')
depends=('fontconfig')
source=(
    "https://github.com/tetunori/fluent-emoji-webfont/archive/refs/tags/v$pkgver.tar.gz"
)
sha256sums=('8eff57d0f6034440bebe79784fca3de13233bee4edab0fbe661614a0b9d63f11')

package() {
    cd $srcdir/fluent-emoji-webfont-$pkgver

    install -Dm644 dist/FluentEmoji{Color,Flat,HighContrast}.ttf -t $pkgdir/usr/share/fonts/fluent-emoji
    install -Dm644 LICENSE -t $pkgdir/usr/share/licenses/$pkgname
}
