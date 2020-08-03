pkgname=kewld
pkgver=1.0.0
pkgrel=3
pkgdesc="A super kewl C++ IRC daemon"
arch=('x86_64')
url='https://github.com/patztablook22/kewld'
license=('MIT')
depends=('git' 'glibc' 'openssl')

package() {

  cd ${srcdir}

  if [ -d kewld ]; then
    rm -rf kewld
  fi

  git clone https://github.com/patztablook22/kewld
  cd kewld

  install -d "$pkgbuild/usr/bin/"
  ./build.sh pacman "$pkgdir/usr/bin/kewld"

}
