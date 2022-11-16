# Maintainer: Grant G <grant@fig.io>

pkgname='fig-nightly-bin'
pkgver='2.8.0_nightly.20221116'
pkgrel=1
pkgdesc='Adds IDE-style autocomplete to your existing terminal.'
arch=('x86_64')
url='https://fig.io'
license=('custom')
depends=('gtk3' 'webkit2gtk' 'libappindicator-gtk3' 'ibus' 'xdg-utils')
provides=('fig')
conflicts=('fig')
source=("${pkgname}-${pkgver//_/-}.tar.xz::https://repo.fig.io/generic/nightly/asset/${pkgver//_/-}/x86_64/fig.tar.xz")

sha256sums=('82b65dab4576d3aed0b8097392feeebc578a3b3233aec1a8e24ad4541816d208')

package() {
  cp -r "${srcdir}/usr" "${pkgdir}/usr"
}
