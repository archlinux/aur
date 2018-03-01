# Maintainer: mark.blakeney at bullet-systems dot net
pkgname=pacpush
pkgver=2.5
pkgrel=1
pkgdesc="Utility to push an Arch host's package and AUR caches to other hosts. Previously named pacsync."
url="https://github.com/bulletmark/$pkgname"
license=("GPL3")
arch=("any")
backup=("etc/$pkgname.conf")
depends=("python" "rsync" "sudo" "openssh" "python-requests" "python-ruamel-yaml")
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
replaces=("pacsync")
conflicts=("pacsync")
md5sums=('54a25208f667d2ad113439a1f6d7533f')

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
