# Maintainer: Daniel Bermond < yahoo-com: danielbermond >

# NOTE:
# This package is intended mainly for wine-git and wine-staging-git to fulfill the
# latest version of wine-mono that could be required in these git development versions.

_srcname=wine-mono
pkgname=wine-mono-latest
pkgver=4.6.3
pkgrel=1
pkgdesc="Wine's built-in replacement for Microsoft's .NET Framework (latest version, intended mainly for wine-git and wine-staging-git)"
arch=('any')
url="http://wiki.winehq.org/Mono"
license=('GPL' 'LGPL2.1' 'MPL')
depends=('wine')
provides=('wine-mono')
conflicts=('wine-mono')
source=("http://dl.winehq.org/wine/${_srcname}/${pkgver}/${_srcname}-${pkgver}.msi")
sha256sums=('f883e88ae78c7ea3d887c24023aa1ed03bb71a83f717c6595abf18b31fef28b9')

package() {
	_monodir="${pkgdir}/usr/share/wine/mono"
	install -D -m644 "${_srcname}-${pkgver}.msi" "${_monodir}/${_srcname}-${pkgver}.msi"
}
