# Maintainer: Lukas Jirkovsky <l.jirkovsky@gmail.com>
pkgname=amrenc
pkgver=0.5.3
pkgrel=1
pkgdesc="An AMR encoder"
arch=('i686' 'x86_64')
url="http://teknoraver.net/software/mp4tools/"
license=('unknown')
depends=('glibc')
source=("http://ppa.launchpad.net/teknoraver/ppa/ubuntu/pool/main/a/amrenc/amrenc_${pkgver}.tar.gz")
md5sums=('4d2e76b836b7b081817b198084424a1b')

build() {
  cd "$srcdir"/$pkgname
  make
}

package() {
  cd "$srcdir"/$pkgname
  make INSTDIR="$pkgdir"/usr install
}
