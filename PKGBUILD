pkgname='mostaqem'
pkgver=2.3.0
pkgrel=1
pkgdesc="An Islamic app"
arch=("x86_64")
url="https://github.com/Mostaqem/mostaqem_desktop"
license=('GNU-V3')
depends=("mpv" "zenity")
source=("mostaqem-linux-${pkgver//_/-}-x86_64.tar.gz::https://github.com/Mostaqem/mostaqem_desktop/releases/download/v${pkgver//_/-}/mostaqem-linux-x86_64.tar.gz")
sha256sums=('0e2d005f759ac2aabac40c871016e97e65c39ed14f30c51483c08985f67bf387')

package() {
	cp -dr "$srcdir"/usr "$pkgdir"/usr
}
