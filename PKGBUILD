pkgname=ttf-fluent-emoji
pkgver=0.8.1
pkgrel=1
pkgdesc="fluent-emoji by Microsoft"
arch=('any')
url="https://github.com/tetunori/fluent-emoji-webfont"
license=('MIT')
depends=('fontconfig')
source=(
    "https://github.com/tetunori/fluent-emoji-webfont/archive/refs/tags/v$pkgver.tar.gz"
)
sha256sums=('3522cdc43ebf8780a7b46312cc201c98287e4d999ebaa2c374fc19f68ed02c30')

package() {
    cd $srcdir/fluent-emoji-webfont-$pkgver

    mkdir -p $pkgdir/usr/share/fonts/TTF/fluent-emoji
    find $srcdir -name "*.ttf" -exec install -Dm644 {} -t $pkgdir/usr/share/fonts/TTF/fluent-emoji \;
}
