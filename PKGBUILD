# Maintainer:  Vincent Grande <shoober420@gmail.com>

pkgname=fallout2-sfall
pkgver=4.2.7
pkgrel=1
arch=('x86_64')
url="https://sourceforge.net/projects/sfall/"
#source=("https://sourceforge.net/projects/sfall/files/sfall/sfall_4.2.7.7z/download")
makedepends=(wget)
#sha256sums=('SKIP')
pkgdesc="fallout 2 community patch"

prepare() {

wget -O sfall_4.2.7.7z https://sourceforge.net/projects/sfall/files/sfall/sfall_4.2.7.7z/download

mv $srcdir/sfall_$pkgver.7z $startdir

}
