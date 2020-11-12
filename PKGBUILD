# Maintainer: Aurélien Ooms <aurelien.ooms@gmail.com>
pkgname=gifify
pkgver=3.0.2
pkgrel=1
epoch=
pkgdesc="Convert videos to GIFs"
arch=(any)
url="https://github.com/aureooms/gifify"
license=('AGPL-3.0')
groups=()
depends=('coreutils' 'findutils' 'grep' 'ffmpeg' 'imagemagick' 'gifsicle' 'gifski' 'bc' 'sed')
makedepends=('git')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=("https://github.com/aureooms/gifify/archive/v${pkgver}.tar.gz")
noextract=()
md5sums=('SKIP')

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
}
