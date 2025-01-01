# Maintainer: Thomas Weißschuh <aur t-8ch de>

pkgname=lilypond-docs
pkgver=2.24.4
pkgrel=1
pkgdesc="Offline documentation for lilypond"
arch=(any)
url="http://lilypond.org"
depends=()
license=(GPL-3.0-only)
options=("!strip")
source=("https://gitlab.com/lilypond/lilypond/-/releases/v${pkgver}/downloads/lilypond-${pkgver}-documentation.tar.xz")
sha256sums=('b387da765df1e5907800ce99af66418f50c2100ddcfb6e50911b84b65d722b3b')


package(){
	  mkdir -p "${pkgdir}/usr/share"

	  cp -R "${srcdir}/share/doc" "${pkgdir}/usr/share/"
}
