# Maintainer: Grant G <grant@fig.io>

pkgname='fig-beta'
pkgver='2.7.9_beta.0'
pkgrel=1
pkgdesc='Adds IDE-style autocomplete to your existing terminal.'
arch=('x86_64')
url='https://fig.io'
license=('custom')
depends=('gtk3' 'webkit2gtk' 'libappindicator-gtk3' 'ibus' 'xdg-utils')
provides=('fig')
conflicts=('fig')
source=("${pkgname}-${pkgver//_/-}.tar.xz::https://repo.fig.io/generic/beta/asset/${pkgver//_/-}/x86_64/fig.tar.xz")

sha256sums=('6da66ac42bad3fc8a1fd6915d07d8b23c92789b180a90014cd55eaae7caf459d')

package() {
  cp -r "${srcdir}/usr" "${pkgdir}/usr"
}
