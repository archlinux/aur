# Maintainer: mark.blakeney at bullet-systems dot net
pkgname=pacsync
pkgver=1.4.1
pkgrel=1
pkgdesc="Utility to push an Arch host's package and AUR caches to other hosts"
url="https://github.com/bulletmark/$pkgname"
license=("GPL3")
arch=("any")
depends=("python" "rsync" "sudo" "openssh" "pacaur")
source=("$url/archive/$pkgver.tar.gz")
md5sums=('d84fd1135e3e1edc04fde7625ca7fb24')

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
