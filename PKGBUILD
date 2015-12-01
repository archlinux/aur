# Maintainer : David Dotson <dotsdl at gmail dot com>
# Maintainer : Manuel Hüsers <manuel.huesers@uni-ol.de>
# Contributor : dmiranda at gmail dot com

pkgname=numix-frost-themes
pkgver=3.0.2
pkgrel=1
pkgdesc='Official Numix GTK theme - Antergos edition'
arch=('any')
url='http://numixproject.org/'
license=('GPL3')
depends=('gtk-engine-murrine')
replaces='gtk-theme-numix-frost'
source=(http://repo.antergos.info/antergos/x86_64/${pkgname}-${pkgver}-${pkgrel}-any.pkg.tar.xz{,.sig})
sha512sums=('e0aed54f0676dcbd589a4d78cad06b0de8ea5ffbf12c3bf00e493a9862a1483b34fc2ef39b1ab28266c96736ac4445a91684e8a641b6ac79c4f6bf0b3dadc5f7'
            '4dba4cca82f30168a2b3acc8a339648ec91bf22bbf9cd75a9bc7964f57c673692a19c0361fccf99e2f3e0e881627f73281787722e9848c0679478e79bfa15d4f')
validpgpkeys=('24B445614FAC071891EDCE49CDBD406AA1AA7A1D')

package() {
	cd "${srcdir}"
	cp -dr --no-preserve=ownership './usr' "${pkgdir}/"
}
