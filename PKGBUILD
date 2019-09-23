pkgname="zkl"
pkgdesc='The zkl programming language'
url='http://www.zenkinetic.com/zkl.html'
license=('zlib/libpng')
pkgver=1.14.3
pkgrel=1
arch=('any')
makedepends=('unzip' 'clang')
source=("zkl_vm_src.zip::http://www.zenkinetic.com/Documents/zkl_vm_src.zip")
md5sums=('27bba465bf1004d132e2a911f89f3ec9')

build() {
	cd ${srcdir}/ZKL/VM
	make zkl
}

package() {
	cd ${srcdir}/ZKL
	install -Dm755 ./Bin/zkl ${pkgdir}/usr/bin/zkl
}
