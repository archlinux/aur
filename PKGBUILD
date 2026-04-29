pkgname=bd-mpv
pkgver=1.0.0
pkgrel=1
pkgdesc="Playing blurays with mpv with fzf from the command line"
arch=('x86_64')
url="https://github.com/Twisteddanns/BD-Title-Selection-for-MPV-in-the-Terminal"
license=('custom')
depends=('mpv' 'fzf' 'grep' 'libbluray')
optdepends=('makemkv' 'makemkv-libaacs')
source=("bd-mpv")
sha256sums=('SKIP')

package() {
	install -Dm755 bd-mpv "$pkgdir/usr/bin/bd-mpv"
}
