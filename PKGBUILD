# Maintainer: OscarHolst <oscar.holst@linux.com>
pkgname=uxpload
pkgver=0.2
pkgrel=1
pkgdesc="UnixPorn.org screenshot uploader"
arch=('any')
url="https://github.com/OscarHolst/UnixPorn"
license=('GPL')
depends=(
  'bash'
  'scrot'
  'curl'
  
)
optdepends=(
  'screenfetch: CLI Bash script to show system/theme info in screenshots'
  'archey3: Output a logo and various system information'
)
source=('https://raw.githubusercontent.com/OscarHolst/UnixPorn/master/uxpload.sh')
md5sums=('7a8651ffc6e12f8d7e296daca193ac13')

package() {
  cd "${srcdir}"
  install -Dm755 uxpload.sh $pkgdir/usr/bin/uxpload
}

