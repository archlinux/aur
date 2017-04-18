# Maintainer: mark.blakeney at bullet-systems dot net
pkgname=pacsync
pkgver=1.4
pkgrel=1
pkgdesc="Utility to push an Arch host's package and AUR caches to other hosts"
url="https://github.com/bulletmark/$pkgname"
license=("GPL3")
arch=("any")
depends=("python" "rsync" "sudo" "openssh" "pacaur")
source=("$url/archive/$pkgver.tar.gz")
md5sums=('b45b344d9d0d6d08c327e5c26352cec7')

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
