# Maintainer: Dane Hobrecht <76x5l22l@anonaddy.me>

pkgname=fzd-bin
pkgver=1.0.2
pkgrel=1
pkgdesc="Fuzzy-found file or URL opener in the user's default application."
arch=('any')
url="https://github.com/danehobrecht/fzd"
license=('GPL')
depends=("fzf" "xdg-utils")
source=("https://github.com/danehobrecht/fzd/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('0935493d6298a25a514376d1a40423f9261bb259a1d521afd8615eaecf3e91a5')

package() {
	mkdir -p "${pkgdir}/usr/bin"
	cp "${srcdir}/fzd" "${pkgdir}/usr/bin/fzd"
	chmod +x "${pkgdir}/usr/bin/fzd"
}