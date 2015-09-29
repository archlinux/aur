# Maintainer: zh99998 <zh99998@gmail.com>

pkgname=tcpping
pkgver=1.7
pkgrel=2
pkgdesc='test response times using TCP SYN packets'
arch=('any')
url='http://www.vdberg.org/~richard/tcpping.html'
depends=('bc' 'tcptraceroute')
source=('http://www.vdberg.org/~richard/tcpping')
noextract=('tcpping')

sha256sums=(
'SKIP'
)

package() {
	install -Dm755 "$srcdir/tcpping" "$pkgdir/usr/bin/tcpping"
}

