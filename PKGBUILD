# Maintainer: mark.blakeney at bullet-systems dot net
pkgname=pacsync
pkgver=1.3.1
pkgrel=1
pkgdesc="Utility to push an Arch host's package and AUR caches to other hosts"
url="https://github.com/bulletmark/$pkgname"
license=("GPL3")
arch=("any")
depends=("python" "rsync" "sudo" "openssh" "pacaur")
source=("$url/archive/$pkgver.tar.gz")
md5sums=('123b817f4c5f5adb30f246b7cacb6635')

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
