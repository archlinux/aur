pkgname="fonts-jetbrains-mono"
pkgver=1.0.0
pkgrel=1
pkgdesc="A typeface made for developers."
arch=("any")
url="https://www.jetbrains.com/lp/mono/"
license=("Apache License 2.0")
depends=()
optdepends=()
makedepends=("git")
source=("https://download.jetbrains.com/fonts/JetBrainsMono-1.0.0.zip")
sha256sums=('82bf0dec956e4ca9afa4da4978fa5de80a75a576b3353d570ccbaabe4e858389')

package() {
    mkdir -p "$pkgdir/usr/share/fonts/JetBrainsMono/"
    install -Dm644 *.ttf "$pkgdir/usr/share/fonts/JetBrainsMono/"
}
