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
sha256sums=('568f72aa7321f117bfe718645ca1bad475894acc34c219ac0cbd583fc368a19d')

package() {
	mkdir -p "${pkgdir}/usr/bin"
	cp "${srcdir}/fzd" "${pkgdir}/usr/bin/fzd"
	chmod +x "${pkgdir}/usr/bin/fzd"
}