# Maintainer: mark.blakeney at bullet-systems dot net
pkgname=pacsync
pkgver=1.7
pkgrel=1
pkgdesc="Utility to push an Arch host's package and AUR caches to other hosts"
url="https://github.com/bulletmark/$pkgname"
license=("GPL3")
arch=("any")
depends=("python" "rsync" "sudo" "openssh" "pacaur")
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
md5sums=('ad389f7e65e38927bd7a30d31c5f3749')

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
