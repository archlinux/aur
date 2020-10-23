# Maintainer: Jonas DOREL <jonas at dorel dot me>
pkgname=pacman-hook-list-installed-packages
pkgver=latest
pkgrel=1
pkgdesc="Pacman hook to list installed packages in /etc/packages-list-native.txt and /etc/packages-list-foreign.txt"
arch=('any')
url="https://gitlab.com/jdorel-archlinux/pacman-hook-list-installed-packages"
license=('GPL')
makedepends=('git')
source=('list-installed-packages.hook')
md5sums=('SKIP')
sha256sums=(
  '010b00d9804e65643609f7605661e9a16535729668bd9533db1d83daa7dce197'
)

pkgver() {
  printf "latest"
}

package() {
	install -Dm 644 $srcdir/list-installed-packages.hook "$pkgdir/usr/share/libalpm/hooks/list-installed-packages.hook"
}
