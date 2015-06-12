# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>
pkgname=sysrss
pkgver=2.1
pkgrel=1
pkgdesc="Let your system generate a maintenance notification RSS"
arch=('any')
url="https://github.com/maandree/sysrss"
license=('GPL3')
depends=('python>=3' 'util-linux')
provides=('sysrss')
conflicts=('sysrss')
source=(https://github.com/maandree/sysrss/tarball/2.1)
md5sums=(45a3031610f52df3ec418fef206dc8dc)

build() {
  cd maandree-sysrss-*
  make -B DESTDIR="$pkgdir/"
}

package() {
  cd maandree-sysrss-*
  make DESTDIR="$pkgdir/" install
}
