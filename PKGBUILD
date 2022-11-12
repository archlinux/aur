# Maintainer: Grant G <grant@fig.io>

pkgname='fig'
pkgver='2.7.8'
pkgrel=1
pkgdesc='Adds IDE-style autocomplete to your existing terminal.'
arch=('x86_64')
url='https://fig.io'
license=('custom')
depends=('gtk3' 'webkit2gtk' 'libappindicator-gtk3' 'ibus' 'xdg-utils')
provides=('fig')
conflicts=('fig')
source=("${pkgname}-${pkgver//_/-}.tar.xz::https://repo.fig.io/generic/stable/asset/${pkgver//_/-}/x86_64/fig.tar.xz")

sha256sums=('a16097b1a9beb79d2f6502afe024e539fe0415014668c9514afcd2b7ca35237d')

package() {
  cp -r "${srcdir}/usr" "${pkgdir}/usr"
}
