# Maintainer: mark.blakeney at bullet-systems dot net
pkgname=pacpush
pkgver=2.7.7
pkgrel=1
pkgdesc="Utility to push an Arch hosts package and AUR caches to other hosts"
url="https://github.com/bulletmark/$pkgname"
license=("GPL3")
arch=("any")
backup=("etc/$pkgname.conf")
depends=("python>=3.6" "rsync" "sudo" "openssh" "python-requests" "python-ruamel-yaml")
makedepends=("python-setuptools")
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
replaces=("pacsync")
conflicts=("pacsync")
sha1sums=('3c632e30674332f3fe434a09a84bfdb35b7df30d')

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
