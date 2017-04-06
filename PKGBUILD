# Contributtor: William Termini <aur@termini.me>
# Maintainer: Iñigo Alvarez <alvarezviu@gmail.com>
pkgname='minivmac'
pkgver='3.4.1'
pkgrel=1
pkgdesc="a miniature early Macintosh emulator"
arch=('i686' 'x86_64' 'arm')
url="http://www.gryphel.com/c/minivmac/"
license=('GPL')
makedepends=(tar)
conflicts=('minivmac')
_source=(http://www.gryphel.com/d/minivmac/$pkgname-$pkgver/$pkgname-$pkgver)

#ARM
source_arm=($_source-larm.bin.tgz)
sha256_arm=('c8bfc672f19a444307e11861525b46b96ccca09d0065ec8b351a58c96da26dcd')

#32bit
source_i686=($_source-lx86.bin.tgz)
sha256_i686=('7b26c35c2c49b29e51ca8492d8e48c8279803c68cd3068baa3000577a5d3cebf')

#64bit
source_x86_64=($_source-lx64.bin.tgz)
sha256sums_x86_64=('19c800b462b5e98cdd35c2872e724a34840e4001e3f2c4b8f453fc19754bef09')

build() {
cd $srcdir
mkdir usr
mkdir usr/bin
mv 'Mini vMac' usr/bin/minivmac
}

package() {
mv $srcdir/usr $pkgdir/
}


