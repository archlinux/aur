pkgname=htmail-view
_commit=59e04aadcd568d3b6f2d80fd6afd839ecaf4c005
pkgver=20190721
pkgrel=1
pkgdesc="Web page renderer based on WebKit"
arch=(any)
url="https://github.com/liske/htmail-view"
license=('GPL2')
depends=('perl' 'perl-browser-open' 'perl-uri' 'glib-perl' 'perl-gtk3' 'perl-gtk3-webkit')
optdepends=('wmctrl')
source=("https://github.com/liske/htmail-view/archive/${_commit}.tar.gz")
sha256sums=('3d6d3e5bbb29e6f2f3ad22e05cb2f6d4750a7a338b4e2fa559a7d597e079786f')

package() {
	cd "$pkgname-${_commit}"
	make DESTDIR="$pkgdir/" install
}
