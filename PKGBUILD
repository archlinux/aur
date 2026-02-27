# Maintainer: aloy555

pkgname=cli-manga
pkgver=1.0.0
pkgrel=1
pkgdesc="Search, read and download manga from the terminal"
arch=('any')
url="https://github.com/aloy55555123/manga-cli"
license=('custom')
depends=(
    'python'
    'fzf'
    'imagemagick'
    'kcc'
    'kindlegen'
    'okular'
    'python-requests'
    'python-beautifulsoup4'
)
optdepends=(
    'python-ua-generator: random user agents to avoid blocks'
)
source=("cli-manga.py"
        "LICENSE")
sha256sums=('SKIP'
            'SKIP')

package() {
    install -Dm755 "$srcdir/cli-manga.py" "$pkgdir/usr/bin/cli-manga"
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
