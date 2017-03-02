# Maintainer: Alexander F Rødseth <xyproto@archlinux.org>

pkgname=lq
pkgver=0.3
pkgrel=1
pkgdesc='Commandline utility for listing directory contents in columns'
arch=('x86_64' 'i686')
url='http://github.com/xyproto/lq'
license=('MIT')
depends=('python')
source=("git+https://github.com/xyproto/lq.git#tag=$pkgver")
md5sums=('SKIP')

package() {
  cd lq

  install -Dm755 lq "$pkgdir/usr/bin/lq"
  install -Dm755 lq_ascii "$pkgdir/usr/bin/lq_ascii"
  install -Dm644 LICENSE \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
