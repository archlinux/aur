# Maintainer: Grant G <grant@fig.io>

pkgname='fig'
pkgver='2.7.10'
pkgrel=1
pkgdesc='Adds IDE-style autocomplete to your existing terminal.'
arch=('x86_64')
url='https://fig.io'
license=('custom')
depends=('gtk3' 'webkit2gtk' 'libappindicator-gtk3' 'ibus' 'xdg-utils')
source=("${pkgname}-${pkgver//_/-}.tar.xz::https://repo.fig.io/generic/stable/asset/${pkgver//_/-}/x86_64/fig.tar.xz")

sha256sums=('c67e6510d351c8d343951237845f8cb92ca6b630b1eb31d5ffaa0c3ae90222b8')

package() {
  cp -r "${srcdir}/usr" "${pkgdir}/usr"
}
