# Maintainer: Anatol Pomozov <anatol.pomozov@gmail.com>

pkgname=vmd.pl-git
pkgver=r35.d3ffee5
pkgrel=2
pkgdesc='Download music manager from vkontakte.ru'
arch=(any)
url='https://github.com/genaev/vmd'
license=(GPL2)
depends=(perl perl-vk-app perl-file-homedir perl-thread-pool-simple)
makedepends=(git)
source=(git://github.com/genaev/vmd)
sha1sums=('SKIP')

pkgver() {
  cd vmd
  echo r$(git rev-list --count master).$(git rev-parse --short master)
}

package() {
  cd vmd

  install -d "$pkgdir/usr/bin"
  install -m755 -t "$pkgdir/usr/bin" vmd.pl
}
