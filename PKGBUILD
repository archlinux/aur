# Maintainer: ThatOneCalculator (kainoa@t1c.dev)

pkgname=ytfzf
pkgver=1.1.7
pkgrel=1
pkgdesc="Slightly improved fork of ytfzf"
arch=('any')
url="https://github.com/pystardust/ytfzf"
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
sha256sums=('5296143fe77be3cc89d06660c1563b51b0a328ce27978ab93ea7f0c38d1e946f')

package() {
    cd "$srcdir/${pkgname}-${pkgver}"
    make DESTDIR="$pkgdir/" install

}
