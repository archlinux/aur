# Maintainer: hugo

pkgname=cli-manga
pkgver=1.0.0
pkgrel=1
pkgdesc="Search, read and download manga from the terminal"
arch=('any')
url="https://github.com/yourusername/cli-manga"
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
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')

package() {
    cd "$srcdir/$pkgname-$pkgver"

    install -Dm755 cli-manga.py "$pkgdir/usr/bin/cli-manga"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
