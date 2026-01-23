# Maintainer: Maryam Sheikh (Mahid Sheikh) <mahid@standingpad.org>
pkgname=nom-bin
pkgver=3.1.1
pkgrel=1
pkgdesc="RSS reader for the terminal"
arch=(x86_64)
url="https://github.com/guyfedwards/nom"
license=('GPL')
source=("https://github.com/guyfedwards/nom/releases/download/v${pkgver}/nom_${pkgver}_linux_amd64.tar.gz")
sha256sums=('0274795e80863d9397bda4f95d3785ae70f8827288d096a21683f91c88074139')

package() {
	cd "$srcdir/"
	install -Dm0755 -t "$pkgdir/usr/local/bin" "nom"
}
