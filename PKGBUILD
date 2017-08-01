pkgname=archlinux-python-helper
pkgver=0.0.1
pkgrel=1
pkgdesc="A Helper-Script to change Symlinks of python to change Python-Version. Syntax like archlinux-java"
arch=('any')
license=('GPL')

source=("local://archlinux-python.sh")
md5sums=('SKIP')

package() {
	install -Dm755 "$srcdir/archlinux-python.sh" "$pkgdir/usr/bin/archlinux-python"
}