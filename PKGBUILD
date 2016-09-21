# Maintainer : David Dotson <dotsdl at gmail dot com>
# Maintainer : Manuel Hüsers <manuel.huesers@uni-ol.de>
# Contributor : dmiranda at gmail dot com

pkgname=numix-frost-themes
pkgver=3.6.2
pkgrel=1
pkgdesc='Official Numix GTK theme - Antergos edition'
arch=('any')
url='https://github.com/Antergos/Numix-Frost'
license=('GPL3')
depends=('gtk-engine-murrine')
replaces=('gtk-theme-numix-frost')
source=(http://mirrors.antergos.com/antergos/x86_64/${pkgname}-${pkgver}-${pkgrel}-any.pkg.tar.xz{,.sig})
sha512sums=('558ddf34fedd8b4f24198dd9a3dfd3bf1c91aad1d017d0a26c48db4561d3bedaa4d5d8e1ac7ac50838a3d1ee09661de2a2b75badd280d7ee69259b69338204d2'
            'SKIP')
validpgpkeys=('24B445614FAC071891EDCE49CDBD406AA1AA7A1D') # Antergos Build Server (Automated Package Build System) <admin@antergos.org>

package() {
	cd "${srcdir}"
	cp -dr --no-preserve=ownership './usr' "${pkgdir}/"
}
