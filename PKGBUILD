pkgname='mostaqem'
pkgver=2.0.0
pkgrel=5
pkgdesc="An Islamic app"
arch=("x86_64")
url="https://github.com/Mostaqem/mostaqem_desktop"
license=('GNU-V3')
depends=("mpv" "zenity")
source=("mostaqem-linux-${pkgver//_/-}-x86_64.tar.gz::https://github.com/Mostaqem/mostaqem_desktop/releases/download/v${pkgver//_/-}/mostaqem-linux-x86_64.tar.gz")
sha256sums=('1786d2dcfecf753d0f730538170e8d3e9b302aab38dd841fce9cd9b475356308')

package() {
	cp -dr "$srcdir"/usr "$pkgdir"/usr
}
