# Maintainer: Grant G <grant@fig.io>

pkgname='fig-beta'
pkgver='2.7.8_beta.1'
pkgrel=2
pkgdesc='Adds IDE-style autocomplete to your existing terminal.'
arch=('x86_64')
url='https://fig.io'
license=('custom')
depends=('gtk3' 'webkit2gtk' 'libappindicator-gtk3' 'ibus' 'xdg-utils')
provides=('fig')
conflicts=('fig')
source=("${pkgname}-${pkgver//_/-}.tar.xz::https://repo.fig.io/generic/beta/asset/${pkgver//_/-}/x86_64/fig.tar.xz")

sha256sums=('8d2779766f0f6c760c79e4ef03b822a233523ae1134fe7897773ad23db7680be')

package() {
  cp -r "${srcdir}/usr" "${pkgdir}/usr"
}

