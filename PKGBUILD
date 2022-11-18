# Maintainer: Grant G <grant@fig.io>

pkgname='fig-nightly-bin'
pkgver='2.8.0_nightly.20221118'
pkgrel=1
pkgdesc='Adds IDE-style autocomplete to your existing terminal.'
arch=('x86_64')
url='https://fig.io'
license=('custom')
depends=('gtk3' 'webkit2gtk' 'libappindicator-gtk3' 'ibus' 'xdg-utils')
provides=('fig')
conflicts=('fig')
source=("${pkgname}-${pkgver//_/-}.tar.xz::https://repo.fig.io/generic/nightly/asset/${pkgver//_/-}/x86_64/fig.tar.xz")

sha256sums=('f70078029df3fae11c1c5f9b5bd91830791e4041e275450a5ea8bff55bc3b0dd')

package() {
  cp -r "${srcdir}/usr" "${pkgdir}/usr"
}
