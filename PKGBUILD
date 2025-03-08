pkgname='mostaqem'
pkgver=2.2.1
pkgrel=3
pkgdesc="An Islamic app"
arch=("x86_64")
url="https://github.com/Mostaqem/mostaqem_desktop"
license=('GNU-V3')
depends=("mpv" "zenity")
source=("mostaqem-linux-${pkgver//_/-}-x86_64.tar.gz::https://github.com/Mostaqem/mostaqem_desktop/releases/download/v${pkgver//_/-}/mostaqem-linux-x86_64.tar.gz")
sha256sums=('58587248ecd053bf2f121c184188167bf8948eedc1dd1468c35c36edb4f09cc4')

package() {
	cp -dr "$srcdir"/usr "$pkgdir"/usr
}
