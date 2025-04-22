pkgname=unarchiver-bsdtar-shim
pkgver=1
pkgrel=1
pkgdesc='Do not use'
arch=('x86_64')
depends=('libarchive' 'dash')
conflicts=('unarchiver')
provides=('unarchiver')
package() {
	echo -e '#!/bin/dash\nbsdtar -xf "$@"' > unar
	install -Dm755 unar "${pkgdir}"/usr/bin/unar
}
