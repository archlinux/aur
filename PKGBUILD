# Maintainer: Dane Hobrecht <76x5l22l@anonaddy.me>

pkgname=fzd-bin
pkgver=1.0.3
pkgrel=1
pkgdesc="Fuzzy-found file or URL opener in the user's default application."
arch=('any')
url="https://github.com/danehobrecht/fzd"
license=('GPL')
depends=("fzf" "xdg-utils")
source=("https://github.com/danehobrecht/fzd/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('8e977bc21ee0f072f62afccf268c3f4dfb51d8a6def69b229669b76c45a09e52')

package() {
	mkdir -p "${pkgdir}/usr/bin"
	cp "${srcdir}/fzd-${pkgver}" "${pkgdir}/usr/bin/fzd"
	chmod +x "${pkgdir}/usr/bin/fzd"
}