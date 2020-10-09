pkgname='teatool'
pkgver='1.8'
pkgrel=1
pkgdesc="Tiny encryption algorithm utility"
url="https://github.com/turbocat2001/TEAtool"
source=('https://github.com/turbocat2001/TEAtool/archive/'v${pkgver}'-linux64.tar.gz')
license=('GPLv3')
arch=('any')
md5sums=('SKIP')


build(){
   cd TEAtool-${pkgver}-linux64
   make 
}

package() {
    cd TEAtool-${pkgver}-linux64
    mkdir -p $pkgdir/usr/bin
    make install DIR=$pkgdir/usr/bin
}


