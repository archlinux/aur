# Maintainer : David Dotson <dotsdl at gmail dot com>
# Maintainer: Manuel Hüsers <manuel.huesers@uni-ol.de>
# Contributor : dmiranda at gmail dot com

pkgname=numix-frost-themes
pkgver=3.0.1
pkgrel=3
pkgdesc='Official Numix GTK theme - Antergos edition'
arch=('any')
url='http://numixproject.org/'
license=('GPL3')
depends=('gtk-engine-murrine')
replaces='gtk-theme-numix-frost'
source=(http://repo.antergos.info/antergos/x86_64/${pkgname}-${pkgver}-${pkgrel}-any.pkg.tar.xz{,.sig})
sha512sums=('bc3c0d20317326b6f54df97f1d11bb8da1db64092d2f7ab6518b6d5bc2383758ce117933d96ba073d5d7f4aff523a9f9072ddf6e713f65f362eb2811838fb4d4'
            'f3a23fbea85047798d1c845007284fec0f8423d7cfac14f38eb41c69d043976806ed0b29ddb2cbd3fcab33bfd141a20383601cbd816322c9d1e7a199e0adb72f')
validpgpkeys=('24B445614FAC071891EDCE49CDBD406AA1AA7A1D')

package() {
	cd "${srcdir}"
	cp -dr --no-preserve=ownership './usr' "${pkgdir}/"
}
