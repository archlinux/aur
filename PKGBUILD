# Maintainer: OscarHolst <oscar.holst@linux.com>
pkgname=uxpload
pkgver=0.1
pkgrel=3
pkgdesc="UnixPorn.org screenshot uploader"
arch=('any')
url="https://github.com/OscarHolst/UnixPorn"
license=('GPL')
depends=(
  'bash'
  'scrot'
  'curl'
  'screenfetch'
  
)
source=('https://raw.githubusercontent.com/OscarHolst/UnixPorn/master/uxpload.sh')
md5sums=('11baca90f2d0b2ba08c1c1c61c5c5fc2')

package() {
  cd "${srcdir}"
  install -Dm755 uxpload.sh $pkgdir/usr/bin/uxpload
}

