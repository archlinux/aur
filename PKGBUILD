# Maintainer: ThatOneCalculator (kainoa@t1c.dev)

pkgname=ytfzfim
pkgver=1.1.8
pkgrel=1
pkgdesc="Slightly improved fork of ytfzf"
arch=('any')
url="https://github.com/thatonecalculator/ytfzfim"
license=('GPL')
depends=('jq' 'mpv' 'youtube-dl')
makedepends=('make')
conflicts=('ytfzf')
optdepends=(
    'dmenu: use dmenu for search prompts and results'
    'rofi:  use rofi for search prompts and results'
    'fzf:   use fzf for results'
    'ueberzug: thumbnails image preview'
)
source=("https://github.com/thatonecalculator/ytfzfim/archive/v${pkgver}.tar.gz")
sha256sums=('SKIP')

package() {
    cd "$srcdir/${pkgname}-${pkgver}"
    make DESTDIR="$pkgdir/" install

}
