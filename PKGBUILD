# Maintainer: Grant G <grant@fig.io>

pkgname='fig-beta'
pkgver='2.7.8_beta.1'
pkgrel=1
pkgdesc='Adds IDE-style autocomplete to your existing terminal.'
arch=('x86_64')
url='https://fig.io'
license=('custom')
depends=('gtk3' 'webkit2gtk' 'libappindicator-gtk3' 'ibus' 'xdg-utils')
provides=('fig')
conflicts=('fig')
source=("${pkgname}-${pkgver//_/-}.tar.xz::https://repo.fig.io/generic/beta/asset/${pkgver//_/-}/x86_64/fig.tar")

sha256sums=('$aur_sha256sum')

package() {
  cp -r "${srcdir}/usr" "${pkgdir}/usr"
}
