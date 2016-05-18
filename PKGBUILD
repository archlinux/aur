# Maintainer: Jack L. Frost <fbt@fleshless.org>

pkgname=sx-open
pkgver=1.4
pkgrel=1
pkgdesc='A simple replacement for xdg-open'
url='https://git.fleshless.org/sx-open'
arch=( 'x86_64' 'i686' )
license=( 'ISC' )
depends=( 'bash' )
provides=( 'xdg-utils' )
conflicts=( 'xdg-utils' )

source=( "https://git.fleshless.org/sx-open/snapshot/sx-open-${pkgver}.tar.gz" )
sha1sums=('1813f406a960230ef847a2af0ba2c51b8004cee8')

package() {
		cd "${pkgname}-${pkgver}"
			
			install -Dm755 sx-open "$pkgdir/usr/bin/sx-open"
				ln -s sx-open "$pkgdir/usr/bin/xdg-open"
	}
