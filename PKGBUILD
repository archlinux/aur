# Maintainer: Gennadiy Mykhailiuta <gmykhailiuta@gmail.com>
# Contributor: Westofer Raymond <westoferraymond@gmail.com>

pkgname=ytfzf
pkgver=1.1.4
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
sha256sums=('be56890e198fa6cfdf1e28a095cf286e10e2a8a77efe99d1214aaff8a122c087')

package() {
    cd "$srcdir/${pkgname}-${pkgver}"
    make DESTDIR="$pkgdir/" install

}
