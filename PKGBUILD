# Maintainer: Felipe Contreras <felipe.contreras@gmail.com>

pkgname=dot-tools
pkgver=0.4
pkgrel=1
pkgdesc='Tools for distributed dotfiles'
url="https://github.com/felipec/$pkgname"
arch=('any')
license=('MIT')
makedepends=('git')
source=("${url}/archive/v${pkgver}.tar.gz")
sha1sums=('c71ae85dd8a63d06474c26683d9d4b4f2145a70c')

package() {
	cd $pkgname &&
	DESTDIR="$pkgdir" make prefix=/usr install
}
