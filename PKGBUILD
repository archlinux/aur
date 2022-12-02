# Maintainer: Grant G <grant@fig.io>

pkgname='fig-beta'
pkgver='2.9.0_beta.5'
pkgrel=1
pkgdesc='Adds IDE-style autocomplete to your existing terminal.'
arch=('x86_64')
url='https://fig.io'
license=('custom')
depends=('gtk3' 'webkit2gtk' 'libappindicator-gtk3' 'ibus' 'xdg-utils')
provides=('fig')
conflicts=('fig')
source=("${pkgname}-${pkgver//_/-}.tar.xz::https://repo.fig.io/generic/beta/asset/${pkgver//_/-}/x86_64/fig.tar.xz")

sha256sums=('6dc55fb587c18e6a35e6b4fb8d99866ab2fcddb35ee847c8079e0209bfad072d')

package() {
  cp -r "${srcdir}/usr" "${pkgdir}/usr"
}
