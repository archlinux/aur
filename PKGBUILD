pkgname=kewl
pkgver=1.0.0
pkgrel=3
pkgdesc="A super kewl C++ IRC"
arch=('x86_64')
url='https://github.com/patztablook22/kewl'
license=('MIT')
depends=('git' 'glibc' 'ncurses' 'openssl')

package() {

  cd ${srcdir}

  if [ -d kewl ]; then
    rm -rf kewl
  fi

  git clone https://github.com/patztablook22/kewl
  cd kewl

  
  install -d "$pkgdir/usr/bin/"
  ./build.sh pacman "$pkgdir/usr/bin/kewl"
  echo $pkgdir/usr/bin/kewl

}
