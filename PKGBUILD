# Maintainer: Alexander F Rødseth <xyproto@archlinux.org>

pkgname=dui
pkgver=1
pkgrel=1
pkgdesc='Cross-platform tool for removing modified subversion files'
arch=('x86_64' 'i686')
url='https://gist.github.com/xyproto/d3b49582bc2b16aee5b0'
license=('custom')
optdepends=('subversion: For dealing with svn repos')
source=('https://gist.githubusercontent.com/xyproto/d3b49582bc2b16aee5b0/raw/a70e38ca03b24c0e5e215a51f6b72a7921492f35/dui.c')
md5sums=('7af33879b0f6fa73ff099fa0ddec61cb')

build() {
  gcc -O dui.c -o dui
}

package() {
  install -Dm755 dui "$pkgdir/usr/bin/dui"
}

# vim:set ts=2 sw=2 et:
