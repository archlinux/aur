pkgname='mostaqem'
pkgver=.2.6.0
pkgrel=1
pkgdesc="An Islamic app"
arch=("x86_64")
url="https://github.com/Mostaqem/mostaqem_desktop"
license=('GNU-V3')
depends=("mpv" "zenity")
source=("mostaqem-linux-${pkgver//_/-}-x86_64.tar.gz::https://github.com/Mostaqem/mostaqem_desktop/releases/download/v${pkgver//_/-}/mostaqem-linux-x86_64.tar.gz")
sha256sums=('7c51e2401676905426de0a19914442124c628150fad0731fc74843229f079a75')

package() {
	cp -dr "$srcdir"/usr "$pkgdir"/usr
}
