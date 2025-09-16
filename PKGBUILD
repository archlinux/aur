pkgname='mostaqem'
pkgver=.2.4.0
pkgrel=1
pkgdesc="An Islamic app"
arch=("x86_64")
url="https://github.com/Mostaqem/mostaqem_desktop"
license=('GNU-V3')
depends=("mpv" "zenity")
source=("mostaqem-linux-${pkgver//_/-}-x86_64.tar.gz::https://github.com/Mostaqem/mostaqem_desktop/releases/download/v${pkgver//_/-}/mostaqem-linux-x86_64.tar.gz")
sha256sums=('1b4631cd221df9f1433e22fd5d952e00629569610235ec157b683ec9ddd93d67')

package() {
	cp -dr "$srcdir"/usr "$pkgdir"/usr
}
