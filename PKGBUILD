pkgname='mostaqem'
pkgver=.2.5.0
pkgrel=1
pkgdesc="An Islamic app"
arch=("x86_64")
url="https://github.com/Mostaqem/mostaqem_desktop"
license=('GNU-V3')
depends=("mpv" "zenity")
source=("mostaqem-linux-${pkgver//_/-}-x86_64.tar.gz::https://github.com/Mostaqem/mostaqem_desktop/releases/download/v${pkgver//_/-}/mostaqem-linux-x86_64.tar.gz")
sha256sums=('ef4bea0bb955473590e1a73c19d141f39378f833e29f47e1456d6de7c861c9c9')

package() {
	cp -dr "$srcdir"/usr "$pkgdir"/usr
}
