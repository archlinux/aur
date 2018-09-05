# Maintainer: mark.blakeney at bullet-systems dot net
pkgname=pacpush
pkgver=2.7.3
pkgrel=1
pkgdesc="Utility to push an Arch host\'s package and AUR caches to other hosts. Previously named pacsync"
url="https://github.com/bulletmark/$pkgname"
license=("GPL3")
arch=("any")
backup=("etc/$pkgname.conf")
depends=("python>=3.6" "rsync" "sudo" "openssh" "python-requests" "python-ruamel-yaml")
makedepends=("python-setuptools")
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
replaces=("pacsync")
conflicts=("pacsync")
sha1sums=('c6ac8586835a1e9ca8bea0f47ceb5397388d7286')

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
