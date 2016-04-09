# Maintainer: Daniel Bermond < yahoo-com: danielbermond >

# NOTE:
# This package is intended mainly for wine-git and wine-staging-git to fulfill the
# latest version of wine-mono that could be required in these git development versions.

_srcname=wine-mono
pkgname=wine-mono-latest
pkgver=4.6.2
pkgrel=1
pkgdesc="Wine's built-in replacement for Microsoft's .NET Framework (latest version, intended mainly for wine-git and wine-staging-git)"
arch=('any')
url="http://wiki.winehq.org/Mono"
license=('GPL' 'LGPL2.1' 'MPL')
depends=('wine')
provides=('wine-mono')
conflicts=('wine-mono')
source=("http://dl.winehq.org/wine/${_srcname}/${pkgver}/${_srcname}-${pkgver}.msi")
sha256sums=('a46c5b32b6ed66e2e8d7ac9b15ff9ffe143a3aa6f12f2ea07a6ca9a4d2023e41')

package() {
	_monodir="${pkgdir}/usr/share/wine/mono"
	install -D -m644 "${_srcname}-${pkgver}.msi" "${_monodir}/${_srcname}-${pkgver}.msi"
}
