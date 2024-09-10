pkgname='mostaqem'
pkgver=1.6.4
pkgrel=3
pkgdesc="An Islamic app"
arch=("x86_64")
url="https://github.com/Mostaqem/mostaqem_desktop"
license=('GNU-V3')
depends=("mpv" "zenity")
source=("https://github.com/Mostaqem/mostaqem_desktop/releases/latest/download/mostaqem-linux-x86_64.tar.gz")
sha256sums=('455cc9825c2dfc95f8bca249dc75076a1404af88a0b2e5073610bdfa3da04fa9')


package() {
	cp -dr "$srcdir"/usr "$pkgdir"/usr
}
