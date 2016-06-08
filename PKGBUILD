# Maintainer: William Termini <aur@termini.me>
pkgname='minivmac'
pkgver='3.3.3'
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
sha256_arm=('b03281436e2457f0207458853c9c496ea936d69f0c5dd898452a22f2bdfdb771')

#32bit
source_i686=($_source-lx86.bin.tgz)
sha256_i686=('e6a352ff0fbe017a27dba1bdf067b49b21c0da88cb068cc3b61b78cacdeff161')

#64bit
source_x86_64=($_source-lx64.bin.tgz)
sha256sums_x86_64=('c79b415d7c9192bf723b7e1bdb81aeec97cf1cba498ee52436509d77a5ed3d43')

build() {
cd $srcdir
mkdir usr
mkdir usr/bin
mv 'Mini vMac' usr/bin/minivmac
}

package() {
mv $srcdir/usr $pkgdir/
}


