# Maintainer: Thomas Weißschuh <aur t-8ch de>

pkgname=lilypond-docs
pkgver=2.26.0
pkgrel=1
pkgdesc="Offline documentation for lilypond"
arch=(any)
url="http://lilypond.org"
depends=()
license=(GPL-3.0-only)
options=("!strip")
source=("https://gitlab.com/lilypond/lilypond/-/releases/v${pkgver}/downloads/lilypond-${pkgver}-documentation.tar.xz")
sha256sums=('a0eb14bb70454510c49a40addc61bc30d5fadf5ee1cb042c2ebebc13e16cbf66')


package(){
	mkdir -p "${pkgdir}/usr/share"

	cp -R "${srcdir}/share/doc" "${pkgdir}/usr/share/"
}
