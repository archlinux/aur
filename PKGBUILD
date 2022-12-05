# Maintainer: Grant G <grant@fig.io>

pkgname='fig'
pkgver='2.9.0'
pkgrel=1
pkgdesc='Adds IDE-style autocomplete to your existing terminal.'
arch=('x86_64')
url='https://fig.io'
license=('custom')
depends=('gtk3' 'webkit2gtk' 'libappindicator-gtk3' 'ibus' 'xdg-utils')
source=("${pkgname}-${pkgver//_/-}.tar.xz::https://repo.fig.io/generic/stable/asset/${pkgver//_/-}/x86_64/fig.tar.xz")

sha256sums=('26f3aceea4a4ac81d742c91d079f7183be60a6f8cee9beab17acb748a76e1789')

package() {
  cp -r "${srcdir}/usr" "${pkgdir}/usr"
}
