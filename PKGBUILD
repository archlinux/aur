# Maintainer: Devin Bayer <dev@doubly.so>
pkgname=fake-sudo
pkgver=1
pkgrel=2
pkgdesc="A drop-in replacement for sudo that pretends to be root with user namespaces"
arch=('any')
url="https://github.com/0ex/fake-sudo"
license=('GPL')
depends=('sh' 'util-linux')
provides=('sudo')
conflicts=('sudo')
makedepends=()
source=('fake-sudo.sh')
sha256sums=('4dac8e64024a0cb54d011ad21c0bc227d921569f2f9c0a2628c03ed8d6cbbe41')

package() {
   install -D fake-sudo.sh "$pkgdir/usr/bin/sudo"
}
