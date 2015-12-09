# Maintainer : David Dotson <dotsdl at gmail dot com>
# Maintainer : Manuel Hüsers <manuel.huesers@uni-ol.de>
# Contributor : dmiranda at gmail dot com

pkgname=numix-frost-themes
pkgver=3.0.4
pkgrel=1
pkgdesc='Official Numix GTK theme - Antergos edition'
arch=('any')
url='http://numixproject.org/'
license=('GPL3')
depends=('gtk-engine-murrine')
replaces='gtk-theme-numix-frost'
source=(http://repo.antergos.info/antergos/x86_64/${pkgname}-${pkgver}-${pkgrel}-any.pkg.tar.xz{,.sig})
sha512sums=('05b2d1d3c1b7681b7b1aa94f623b685c349349a0b8135c80d8239c1befbcd624a795aff3588317a8e4fc7016749ab6c55a5b9602e4e73383bf76fe8a681d63df'
            'SKIP')
validpgpkeys=('24B445614FAC071891EDCE49CDBD406AA1AA7A1D') # Antergos Build Server (Automated Package Build System) <admin@antergos.org>

package() {
	cd "${srcdir}"
	cp -dr --no-preserve=ownership './usr' "${pkgdir}/"
}
