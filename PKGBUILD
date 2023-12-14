# Maintainer: Dane Hobrecht <76x5l22l@anonaddy.me>

pkgname=fzd-bin
pkgver=1.0.6
pkgrel=1
pkgdesc="Fuzzy-found file or URL opener in the user's default application."
arch=('any')
url="https://github.com/danehobrecht/fzd"
license=('GPL')
depends=("fzf" "xdg-utils")
source=("https://github.com/danehobrecht/fzd/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('44d6804971227ed5909757d81263987c0031dc05e6ab4ba145b518b1df883154')

package() {
	mkdir -p "${pkgdir}/usr/bin"
	cp -r "${srcdir}/fzd-${pkgver}/fzd" "${pkgdir}/usr/bin/fzd"
	chmod +x "${pkgdir}/usr/bin/fzd"
}