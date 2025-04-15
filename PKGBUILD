pkgname=unzip-bsdunzip-symlink
pkgver=3.7.9
pkgrel=1
pkgdesc='A symlink to unzip from bsdunzip of libarchive'
arch=('x86_64')
depends=('libarchive')
conflicts=('unzip')
provides=('unzip')

package() {
	mkdir -p "${pkgdir}"/usr/bin
	ln -sf /usr/bin/bsdunzip "${pkgdir}"/usr/bin/unzip
}
