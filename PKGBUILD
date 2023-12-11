# Maintainer: Sebastian LaVine <mail@smlavine.com>

pkgname=onclick
pkgver=1.0.3
pkgrel=2
pkgdesc='Runs a command every time the terminal is clicked'
arch=('x86_64' 'aarch64')
url='https://sr.ht/~smlavine/onclick'
license=('MPLv2')
makedepends=('hare-git')
source=("https://git.sr.ht/~smlavine/onclick/archive/${pkgver}.tar.gz")
sha256sums=('df34d9d6fcaa530ed3207b79fac6cc769381e4061741ae0a7f66067cef9c56a0')

build() {
	cd "${pkgname}-${pkgver}"
	make
}

package() {
	cd "${pkgname}-${pkgver}"
	make PREFIX="$pkgdir/usr" install
}
