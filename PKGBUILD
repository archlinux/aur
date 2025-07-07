# Maintainer: Mahid Sheikh <mahid@standingpad.org>
pkgname=nom-bin
pkgver=2.13.0
pkgrel=1
pkgdesc="RSS reader for the terminal"
arch=(x86_64)
url="https://github.com/guyfedwards/nom"
license=('GPL')
source=("https://github.com/guyfedwards/nom/releases/download/v${pkgver}/nom_${pkgver}_linux_amd64.tar.gz")
sha256sums=('507754744f4c0a7ff4d8b7e93e517ba4a24361359ee39906674f0c7d760e70a4')

package() {
	cd "$srcdir/"
	install -Dm0755 -t "$pkgdir/usr/local/bin" "nom"
}
