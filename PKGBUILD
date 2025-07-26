pkgname='mostaqem'
pkgver=2.3.1
pkgrel=3
pkgdesc="An Islamic app"
arch=("x86_64")
url="https://github.com/Mostaqem/mostaqem_desktop"
license=('GNU-V3')
depends=("mpv" "zenity")
source=("mostaqem-linux-${pkgver//_/-}-x86_64.tar.gz::https://github.com/Mostaqem/mostaqem_desktop/releases/download/v${pkgver//_/-}/mostaqem-linux-x86_64.tar.gz")
sha256sums=('0663f2b509bb0e0a743dd39b48d3a18c447ba937aba7c23e8d92d1692e0c13e6')

package() {
	cp -dr "$srcdir"/usr "$pkgdir"/usr
}
