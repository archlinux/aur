# Maintainer: 305a385 <lotsof@shitposting.expert>


pkgname='ytfind'
pkgver='1.1'
pkgrel=1
pkgdesk=" A program that searches invidious and gives you video titles and IDs"
arch=('x86_64')
url='https://github.com/305a385/ytfind/releases/tag/Release'
license=('AGPL3')
depends=('curl')
makedepends=('git')
binname=('GNU-Linux-x86_64')
source=("https://github.com/305a385/$pkgname/releases/download/v$pkgver/$binname")
sha256sums=('4280bd3d1193c56b744f0789e719727abb52e20107410a6151b04274107b4972')
noextract=('ytfind')

package() {
	mkdir -p "${pkgdir}/usr/bin"
	install -m 755 ${srcdir}/${binname} ${pkgdir}/usr/bin/${pkgname}
}
