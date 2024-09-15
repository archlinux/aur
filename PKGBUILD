pkgname='mostaqem'
pkgver=1.6.4
pkgrel=4
pkgdesc="An Islamic app"
arch=("x86_64")
url="https://github.com/Mostaqem/mostaqem_desktop"
license=('GNU-V3')
depends=("mpv" "zenity")
source=("mostaqem-linux-${pkgver//_/-}-x86_64.tar.gz::https://github.com/Mostaqem/mostaqem_desktop/releases/download/v${pkgver//_/-}/mostaqem-linux-x86_64.tar.gz")
sha256sums=('584ae7958314d9f131f462a7d56aca32ec43dbaf11c547c8c2efb1066f36b20c')

package() {
	cp -dr "$srcdir"/usr "$pkgdir"/usr
}
