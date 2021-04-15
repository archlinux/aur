# Maintainer: Gennadiy Mykhailiuta <gmykhailiuta@gmail.com>
# Contributor: Westofer Raymond <westoferraymond@gmail.com>

pkgname=ytfzf
pkgver=1.1.3
pkgrel=1
pkgdesc="A posix script to find and watch youtube videos from the terminal. (Without API)"
arch=('any')
url="https://github.com/pystardust/ytfzf"
license=('GPL')
depends=('jq' 'mpv' 'youtube-dl')
makedepends=('make')
optdepends=(
    'dmenu: use dmenu for search prompts and results'
    'rofi:  use rofi for search prompts and results'
    'fzf:   use fzf for results'
    'ueberzug: thumbnails image preview'
)
source=("https://github.com/pystardust/ytfzf/archive/v${pkgver}.tar.gz")
sha256sums=('892897aecef5516ae586b980a670d22e08114737809519c86a3e0fe6e70e347a')

package() {
    cd "$srcdir/${pkgname}-${pkgver}"
    make DESTDIR="$pkgdir/" install

}
