# Maintainer: 305a385 <lotsof@shitposting.expert>

pkgname='ytfind'
pkgver='1.0'
pkgrel=1
pkgdesk=" A program that searches invidious and gives you video titles and IDs"
arch=('x86_64')
url='https://github.com/305a385/ytfind/releases/tag/Release'
license=('AGPL3')
depends=('curl')
makedepends=('git')
source=("https://github.com/305a385/ytfind/releases/download/v$pkgver/ytfind")
sha256sums=('3d3d34bc8706794c735e26240f4a50ef1b7dd26abd8afbad695fe6b2bd4bf1ee')
noextract=('ytfind')

package() {
	mkdir -p "${pkgdir}/usr/bin"
	install -m 755 ${srcdir}/${pkgname} ${pkgdir}/usr/bin/${pkgname}
}
