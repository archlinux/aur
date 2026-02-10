pkgname='mostaqem'
pkgver=.2.7.0
pkgrel=1
pkgdesc="An Islamic app"
arch=("x86_64")
url="https://github.com/Mostaqem/mostaqem_desktop"
license=('GNU-V3')
depends=("mpv" "zenity")
source=("mostaqem-linux-${pkgver//_/-}-x86_64.tar.gz::https://github.com/Mostaqem/mostaqem_desktop/releases/download/v${pkgver//_/-}/mostaqem-linux-x86_64.tar.gz")
sha256sums=('2b1f7d5cf94d76cfffeae46b5acfa46ec2dbc07c4c4608bcceb42e952835407e')

package() {
	cp -dr "$srcdir"/usr "$pkgdir"/usr
}
