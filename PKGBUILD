# Maintainer : David Dotson <dotsdl at gmail dot com>
# Maintainer : Manuel Hüsers <manuel.huesers@uni-ol.de>
# Contributor : dmiranda at gmail dot com

pkgname=numix-frost-themes
pkgver=3.2
pkgrel=1
pkgdesc='Official Numix GTK theme - Antergos edition'
arch=('any')
url='http://numixproject.org/'
license=('GPL3')
depends=('gtk-engine-murrine')
replaces=('gtk-theme-numix-frost')
source=(http://repo.antergos.info/antergos/x86_64/${pkgname}-${pkgver}-${pkgrel}-any.pkg.tar.xz{,.sig})
sha512sums=('3cadcee40621ab4de55653005e769090e8b9ecf183701af79133ffbe8e0c1f9de5881df851c4079766eddafb45aa7d5e36d21ef3eb445815f1ea92b9ec9c9346'
            'SKIP')
validpgpkeys=('24B445614FAC071891EDCE49CDBD406AA1AA7A1D') # Antergos Build Server (Automated Package Build System) <admin@antergos.org>

package() {
	cd "${srcdir}"
	cp -dr --no-preserve=ownership './usr' "${pkgdir}/"
}
