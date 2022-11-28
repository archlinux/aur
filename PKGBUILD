# Maintainer: Grant G <grant@fig.io>

pkgname='fig-beta'
pkgver='2.8.0_beta.3'
pkgrel=1
pkgdesc='Adds IDE-style autocomplete to your existing terminal.'
arch=('x86_64')
url='https://fig.io'
license=('custom')
depends=('gtk3' 'webkit2gtk' 'libappindicator-gtk3' 'ibus' 'xdg-utils')
provides=('fig')
conflicts=('fig')
source=("${pkgname}-${pkgver//_/-}.tar.xz::https://repo.fig.io/generic/beta/asset/${pkgver//_/-}/x86_64/fig.tar.xz")

sha256sums=('ec4f3230d397c34e278b4ac35c2ea22fa5b993281fa05b96b1f2997169033453')

package() {
  cp -r "${srcdir}/usr" "${pkgdir}/usr"
}
