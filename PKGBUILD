# Maintainer: Borislav Borisov <borislav.borisov@gmail.com>

pkgname=osysinfo
pkgver=1.0
pkgrel=1
pkgdesc="A basic CLI tool to see your system details"
arch=('x86_64')
url="https://github.com/ottop/osysinfo"
license=('GPL')
makedepends=('python-fire' 'python-distro' 'python-psutil')
source_x86_64=('https://github.com/ottop/osysinfo/archive/refs/tags/1.0.tar.gz')
sha256sums_x86_64=('4f431460bb2ef5543474d742b576882e8217d5d5ad7d2f346249abcc53aee70a')

package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}

