# Maintainer: Grant G <grant@fig.io>

pkgname='fig-nightly-bin'
pkgver='2.8.0_nightly.20221119'
pkgrel=1
pkgdesc='Adds IDE-style autocomplete to your existing terminal.'
arch=('x86_64')
url='https://fig.io'
license=('custom')
depends=('gtk3' 'webkit2gtk' 'libappindicator-gtk3' 'ibus' 'xdg-utils')
provides=('fig')
conflicts=('fig')
source=("${pkgname}-${pkgver//_/-}.tar.xz::https://repo.fig.io/generic/nightly/asset/${pkgver//_/-}/x86_64/fig.tar.xz")

sha256sums=('3f857dd97b5f7803c01a2d2d4ec4761a79bc4eaf8250b5f6b475cdaa7501929f')

package() {
  cp -r "${srcdir}/usr" "${pkgdir}/usr"
}
