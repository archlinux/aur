# Maintainer: OscarHolst <oscar.holst@linux.com>
pkgname=uxpload
pkgver=0.1
pkgrel=2
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
md5sums=('6d0280b28123764643e87a5516629c51')

package() {
  cd "${srcdir}"
  install -Dm755 uxpload.sh $pkgdir/usr/bin/uxpload
}

