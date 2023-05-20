# Maintainer: 305a385 <lotsof@shitposting.expert>


pkgname='ytfind'
pkgver='1.2'
pkgrel=2
pkgdesk="A program that searches invidious and gives you video titles and IDs"
arch=('x86_64')
url='https://github.com/305a385/ytfind/'
license=('AGPL3')
depends=('curl')
makedepends=('git')
binname=('GNU-Linux-x86_64')
source=("https://github.com/305a385/$pkgname/releases/download/v$pkgver/$binname")
sha256sums=('5425960f70d58abd00832a0c1bd5b258b2b17a90b518af260597e4efe3ee2657')
noextract=('ytfind')
package() {
	mkdir -p "${pkgdir}/usr/bin"
	install -m 755 ${srcdir}/${binname} ${pkgdir}/usr/bin/${pkgname}
}
