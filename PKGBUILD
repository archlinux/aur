# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: GordonGR <ntheo1979@gmail.com>
# Contributor: Hilton Medeiros <medeiros.hilton@gmail.com>
_base=cm-unicode
pkgname=otf-${_base}
pkgver=0.7.0
pkgrel=7
pkgdesc="Font family converted from D. Knuth's Computer Modern metafont"
arch=(any)
url="https://${_base}.sourceforge.io"
license=(OFL-1.1-RFN)
depends=()
source=(http://downloads.sourceforge.net/${_base}/${_base}-${pkgver}-otf.tar.xz)
md5sums=('8503cc1316103d97a668a9efa71d0e3c')

package() {
	cd "${_base}-${pkgver}"
	install -Dm 644 *.otf -t "${pkgdir}/usr/share/fonts/${pkgname}"
	install -Dm 644 OFL.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
