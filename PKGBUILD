# Maintainer: Jerome Leclanche <jerome@leclan.ch>

pkgname=echo-icon-theme
pkgver=0.3.3
pkgrel=1
pkgdesc="The Echo icon theme from the Fedora project."
arch=("any")
url="https://fedorahosted.org/echo-icon-theme/"
license=("CCPL")
source=("https://fedorahosted.org/releases/${_pkgname:0:1}/${_pkgname:1:2}/$pkgname/$pkgname-$pkgver.tar.bz2")
sha256sums=("faae588a26d4096421616aa9e0f1e23b5fdaa31e237f6235c56d4b050cb1a2e9")


package() {
	cd "$srcdir"
	install -d "$pkgdir/usr/share/icons/"
	cp -r "$pkgname-$pkgver/" "$pkgdir/usr/share/icons/"
}
