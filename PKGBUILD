# Maintainer: dmitry.romanov <dmitry.romanov85@gmail.com>

pkgname=fman
pkgver=0.4.1
pkgrel=1
pkgdesc="A modern file manager for power users. Beautiful, fast and extensible"
arch=('i686' 'x86_64')
url="https://fman.io/"
license=('custom')
depends_x86_64=()
depends_i686=()
makedepends=()

source=("https://www.dropbox.com/s/21somfqm8n1bfoz/fman-0.4.1.deb")
sha256sums=('b3224c1e69206587b974a93692a44b700c704984ce481c73057eb3733141fa8b')

package() {
	tar -zxf data.tar.gz -C "${pkgdir}"
	chmod -R 755 "${pkgdir}"
}
