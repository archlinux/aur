# Maintainer: dmitry.romanov <dmitry.romanov85@gmail.com>

pkgname=fman
pkgver=0.3.9
pkgrel=1
pkgdesc="A modern file manager for power users. Beautiful, fast and extensible"
arch=('i686' 'x86_64')
url="https://fman.io/"
license=('Proprietary')
depends_x86_64=()
depends_i686=()
makedepends=()

source=("http://download.fman.io/fman.deb")
sha256sums=('f6da007a4d294868c7a06bd9a2656021660e2af487315eb10ef251c3226feee0')

package() {
	tar -zxf data.tar.gz -C "${pkgdir}"
}
