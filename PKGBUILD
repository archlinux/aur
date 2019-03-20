# Maintainer: milk on freenode
pkgname=moddownloaderr
pkgver=0.3
pkgrel=1
pkgdesc="Moduledownloaderr - forked Bash script to download ModArchive music modules."
arch=('i686' 'x86_64')
url="https://github.com/mxmilkb/moddownloaderr"
license=('LGPL3')
depends=('wget')
source=(git+https://github.com/mxmilkb/moddownloaderr)
md5sums=('SKIP')

build() {
  cd "$srcdir"
}

package() {
  cd "$srcdir"
  cd moddownloaderr
  install -Dm755 moddownloaderr $pkgdir/usr/bin/moddownloaderr
}
