# Maintainer: Westofer Raymond <westoferraymond@gmail.com>

pkgname=ytfzf
pkgver=1.0.0
pkgrel=1
pkgdesc="A posix script to find and watch youtube videos from the terminal. (With out API)"
arch=('any')
url="https://github.com/pystardust/ytfzf"
license=('GPL')
depends=('jq' 'mpv' 'youtube-dl')
makedepends=() 
optdepends=('dmenu: use dmenu for search prompts and results'
						'rofi:  use rofi for search prompts and results'
						'fzf:   use fzf for results'
						'ueberzug: thumbnails image preview'
						)
provides=('ytfzf')
conflicts=("ytfzf-git")
install=
source=("https://github.com/pystardust/ytfzf/archive/v${pkgver}.tar.gz")
md5sums=('5175c10f63c05ca542d5ad4d0bdd72b0')

package() {
	cd "$srcdir/${pkgname}-${pkgver}"
	install -Dm755  -t "${pkgdir}/usr/bin" "${pkgname}"
}
