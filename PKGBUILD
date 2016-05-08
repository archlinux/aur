# Maintainer : David Dotson <dotsdl at gmail dot com>
# Maintainer : Manuel Hüsers <manuel.huesers@uni-ol.de>
# Contributor : dmiranda at gmail dot com

pkgname=numix-frost-themes
pkgver=3.5.r711
pkgrel=1
pkgdesc='Official Numix GTK theme - Antergos edition'
arch=('any')
url='http://numixproject.org/'
license=('GPL3')
depends=('gtk-engine-murrine')
replaces=('gtk-theme-numix-frost')
source=(http://mirrors.antergos.com/antergos/x86_64/${pkgname}-${pkgver}-${pkgrel}-any.pkg.tar.xz{,.sig})
sha512sums=('ca5944a98aba5d47521e527133b996d36c36b2994231e11e69b2b4a1264ca0d563d24b940b67ac40b33ccb35898a64235b33feb94ae590d1499946380f89b9b4'
            'SKIP')
validpgpkeys=('24B445614FAC071891EDCE49CDBD406AA1AA7A1D') # Antergos Build Server (Automated Package Build System) <admin@antergos.org>

package() {
	cd "${srcdir}"
	cp -dr --no-preserve=ownership './usr' "${pkgdir}/"
}
