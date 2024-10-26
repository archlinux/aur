# Maintainer: Felipe Contreras <felipe.contreras@gmail.com>

pkgname=dot-tools
pkgver=0.3
pkgrel=1
pkgdesc='Tools for distributed dotfiles'
url="https://github.com/felipec/$pkgname"
arch=('any')
license=('MIT')
makedepends=('git')
source=("${url}/archive/v${pkgver}.tar.gz")
sha1sums=('0f2ff4359bdec0362ed53a916e70e567abaa6078')

package() {
	cd $pkgname &&
	DESTDIR="$pkgdir" make prefix=/usr install
}
