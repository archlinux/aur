# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=sent
pkgver=0.1
pkgrel=1
pkgdesc='Simple plaintext presentation tool'
arch=('i686' 'x86_64')
url='http://tools.suckless.org/sent'
depends=('libxft' 'fontconfig' 'libpng')
makedepends=('git')
license=('MIT')
source=("git://git.suckless.org/sent#tag=${pkgver}")
sha256sums=('SKIP')

build() {
	cd sent/

	make
}

package() {
	cd sent/

	make DESTDIR="${pkgdir}" PREFIX='/usr/' install
}

