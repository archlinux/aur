# Maintainer: Lucas Saliés Brum <sistematico@gmail.com>

pkgname=fortune-mod-br
pkgver=20220821
pkgrel=1
epoch=
pkgdesc='A collection of several fortune cookies for Portuguese speakers, gathered from various sources, ranging from proverbs to quotations from literature classics.'
arch=('any')
url=''
license=('GPL')
depends=('fortune-mod')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
source=("http://ftp.us.debian.org/debian/pool/main/f/fortunes-br/fortunes-br_${pkgver}.tar.xz")
sha256sums=('4a12b640bb739b1cdc33c18e56cb250f5ca55b405ffca6bb9ee4f726d357f6d6')

prepare() {
    strfile $srcdir/fortunes-br-20220820+nmu1/brasil 
}

package() {
    mkdir -p $pkgdir/usr/share/fortune/
	install -D -m644 ${srcdir}/fortunes-br-20220820+nmu1/{brasil,brasil.dat} $pkgdir/usr/share/fortune/
}
