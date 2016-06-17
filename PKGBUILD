# Maintainer : David Dotson <dotsdl at gmail dot com>
# Maintainer : Manuel Hüsers <manuel.huesers@uni-ol.de>
# Contributor : dmiranda at gmail dot com

pkgname=numix-frost-themes
pkgver=3.5.r768
pkgrel=1
pkgdesc='Official Numix GTK theme - Antergos edition'
arch=('any')
url='https://github.com/Antergos/Numix-Frost'
license=('GPL3')
depends=('gtk-engine-murrine')
replaces=('gtk-theme-numix-frost')
source=(http://mirrors.antergos.com/antergos/x86_64/${pkgname}-${pkgver}-${pkgrel}-any.pkg.tar.xz{,.sig})
sha512sums=('511c76715c9195054ca96a5d9a1787a7ebcc66e161b090b3cd1082987d321daa2b5906732585b24d93c1f1bad039f282b17547a3efceb137579e4fd51becea6f'
            'SKIP')
validpgpkeys=('24B445614FAC071891EDCE49CDBD406AA1AA7A1D') # Antergos Build Server (Automated Package Build System) <admin@antergos.org>

package() {
	cd "${srcdir}"
	cp -dr --no-preserve=ownership './usr' "${pkgdir}/"
}
