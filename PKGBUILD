pkgname=ttf-fluent-emoji
pkgver=0.8.5
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
sha256sums=('98ddb337dd27f4afb451d9c191674045439e49ec1fcd0751816b9a0c09aa667f')

package() {
    cd $srcdir/fluent-emoji-webfont-$pkgver

    install -Dm644 dist/FluentEmoji{Color,Flat,HighContrast}.ttf -t $pkgdir/usr/share/fonts/fluent-emoji
    install -Dm644 LICENSE -t $pkgdir/usr/share/licenses/$pkgname
}
