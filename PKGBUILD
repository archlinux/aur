# Maintainer: Grant G <grant@fig.io>

pkgname='fig'
pkgver='2.8.0'
pkgrel=1
pkgdesc='Adds IDE-style autocomplete to your existing terminal.'
arch=('x86_64')
url='https://fig.io'
license=('custom')
depends=('gtk3' 'webkit2gtk' 'libappindicator-gtk3' 'ibus' 'xdg-utils')
source=("${pkgname}-${pkgver//_/-}.tar.xz::https://repo.fig.io/generic/stable/asset/${pkgver//_/-}/x86_64/fig.tar.xz")

sha256sums=('7ba62c371baabe6f372c8a12aa8e16b88a0fc917bc45e329a3f69b2811ee4808')

package() {
  cp -r "${srcdir}/usr" "${pkgdir}/usr"
}
