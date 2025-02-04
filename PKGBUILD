# Maintainer: robertfoster

pkgname=cupp-v3
pkgver=3.0
pkgrel=1
pkgdesc="Common User Passwords Profiler "
arch=('i686' 'x86_64')
url="http://www.remote-exploit.org/?page_id=418"
depends=('python2')
license=('GPL')
source=(http://www.remote-exploit.org/content/cupp-$pkgver.tar.gz
  cupp-bin)

package() {
  # Organize the paths
  mkdir -p $pkgdir/usr/share/
  cp -r $srcdir/cupp $pkgdir/usr/share/

  # Create the executable link
  mkdir -p $pkgdir/usr/bin
  cp $srcdir/cupp-bin $pkgdir/usr/bin/cupp

}

sha256sums=('d85f862c7255c27a4cdca1943d175356db54ebaa87d0d88f5d20d447d3710ee8'
            'cb5f7f14e89a97306af59152a6d5a6afa88e5c0aeb671f4e8613c6a0699ac7a2')
