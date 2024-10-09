pkgname='mostaqem'
pkgver=2.1.0
pkgrel=6
pkgdesc="An Islamic app"
arch=("x86_64")
url="https://github.com/Mostaqem/mostaqem_desktop"
license=('GNU-V3')
depends=("mpv" "zenity")
source=("mostaqem-linux-${pkgver//_/-}-x86_64.tar.gz::https://github.com/Mostaqem/mostaqem_desktop/releases/download/v${pkgver//_/-}/mostaqem-linux-x86_64.tar.gz")
sha256sums=('11f20a3d000729b777ee9b6a8cf8bd2f814ca7e7b74cd8ecb82aa87a833b281a')

package() {
	cp -dr "$srcdir"/usr "$pkgdir"/usr
}
