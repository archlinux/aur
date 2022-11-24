# Maintainer: Grant G <grant@fig.io>

pkgname='fig-nightly-bin'
pkgver='2.8.0_nightly.20221124'
pkgrel=1
pkgdesc='Adds IDE-style autocomplete to your existing terminal.'
arch=('x86_64')
url='https://fig.io'
license=('custom')
depends=('gtk3' 'webkit2gtk' 'libappindicator-gtk3' 'ibus' 'xdg-utils')
provides=('fig')
conflicts=('fig')
source=("${pkgname}-${pkgver//_/-}.tar.xz::https://repo.fig.io/generic/nightly/asset/${pkgver//_/-}/x86_64/fig.tar.xz")

sha256sums=('ab5802950710d2d413e9d1d393c5aea3b2df05ccd134da36692b11da4934d9f5')

package() {
  cp -r "${srcdir}/usr" "${pkgdir}/usr"
}
