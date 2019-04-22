pkgname=xcursor-breeze-adapta
epoch=0
pkgver=1.0.0
pkgrel=0
pkgdesc="Popular Breeze Cursor modified for Adapta theme."
arch=('any')
url="https://github.com/gabrielmoura/Breeze-Adapta-Cursor"
license=('GPL')
provides=('breeze-adapta')
depends=('libxcursor')
conflicts=('breeze-adapta')
source=(${pkgname}::git+${url})
sha512sums=('SKIP')

package() {
        install -dm655 "$pkgdir"/usr/share/icons/Breeze-Adapta
	cp -r "$srcdir"/$pkgname/* "$pkgdir"/usr/share/icons/Breeze-Adapta
}
