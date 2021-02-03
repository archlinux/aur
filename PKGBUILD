# Maintainer: Efe Cetin <efectn@6tel.net>

pkgname=teaiso
pkgver=0.3.2
pkgrel=1
pkgdesc="Alternative ISO creation tool for Arch Linux."
arch=("any")
url="https://gitlab.com/tearch-linux/teaiso"
license=("GPL3")
depends=("arch-install-scripts" "dosfstools" "e2fsprogs" "grub" "squashfs-tools" "mtools" "libisoburn"
"python" "python-argparse" "python-yaml")
source=("git+$url.git")
md5sums=("SKIP")

package() {
	cd "$srcdir/$pkgname"
	make DESTDIR="$pkgdir/" install
}
