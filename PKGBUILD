# Maintainer: Alexander F Rødseth <xyproto@archlinux.org>

pkgname=fnu
pkgver=0.2
pkgrel=1
pkgdesc='Commandline utility for listing directory contents in columns'
arch=('x86_64' 'i686')
url='http://github.com/xyproto/fnu'
license=('MIT')
depends=('python')
source=("git://github.com/xyproto/fnu.git#tag=$pkgver")
md5sums=('SKIP')

package() {
  cd fnu

  install -Dm755 fnu "$pkgdir/usr/bin/fnu"
  install -Dm755 fnu_ascii "$pkgdir/usr/bin/fnu_ascii"
  install -Dm644 LICENSE \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
