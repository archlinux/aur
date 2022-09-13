# Maintainer: Grant G <grant@fig.io>
pkgname='fig-beta'
pkgver='2.4.9'
pkgrel=1
pkgdesc='Adds IDE-style autocomplete to your existing terminal.'
arch=('x86_64')
url='https://fig.io'
license=('custom')
depends=('gtk3' 'webkit2gtk' 'libappindicator-gtk3' 'ibus' 'xdg-utils')
provides=('fig')
conflicts=('fig')
source=("${pkgname}-${pkgver//_/-}.tar.xz::https://pkg-cdn.fig.io/${pkgver//_/-}/linux/${arch}/fig.tar.xz")

sha256sums=('47d4cda06ac1d79ee8a6016ed6011491e407b303b09c803d6c39f855eea185a2')

package() {
  cp -r "${srcdir}/usr" "${pkgdir}/usr"
}

