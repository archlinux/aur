pkgname='mostaqem'
pkgver=2.3.0
pkgrel=2
pkgdesc="An Islamic app"
arch=("x86_64")
url="https://github.com/Mostaqem/mostaqem_desktop"
license=('GNU-V3')
depends=("mpv" "zenity")
source=("mostaqem-linux-${pkgver//_/-}-x86_64.tar.gz::https://github.com/Mostaqem/mostaqem_desktop/releases/download/v${pkgver//_/-}/mostaqem-linux-x86_64.tar.gz")
sha256sums=('aa831cfb28f6b1f0cb7967a8ea2487992315c7b4dfe47083d74a8735257a3460')

package() {
	cp -dr "$srcdir"/usr "$pkgdir"/usr
}
