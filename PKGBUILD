pkgname='mostaqem'
pkgver=2.2.1
pkgrel=2
pkgdesc="An Islamic app"
arch=("x86_64")
url="https://github.com/Mostaqem/mostaqem_desktop"
license=('GNU-V3')
depends=("mpv" "zenity")
source=("mostaqem-linux-${pkgver//_/-}-x86_64.tar.gz::https://github.com/Mostaqem/mostaqem_desktop/releases/download/v${pkgver//_/-}/mostaqem-linux-x86_64.tar.gz")
sha256sums=('e034b5c3983ea532cca12b4fe363c1966f61e8144dd84e85aacb8dd99ff0f5db')

package() {
	cp -dr "$srcdir"/usr "$pkgdir"/usr
}
