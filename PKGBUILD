# Maintainer: Grant G <grant@fig.io>
pkgname='fig'
pkgver='2.4.11'
pkgrel=1
pkgdesc='Adds IDE-style autocomplete to your existing terminal.'
arch=('x86_64')
url='https://fig.io'
license=('custom')
depends=('gtk3' 'webkit2gtk' 'libappindicator-gtk3' 'ibus' 'xdg-utils')
source=("${pkgname}-${pkgver//_/-}.tar.xz::https://pkg-cdn.fig.io/${pkgver//_/-}/linux/${arch}/fig.tar.xz")

sha256sums=('506d5a63a8506869e3161259cd9a5715d15585be5600e8d0dae112f207174f95')

package() {
  cp -r "${srcdir}/usr" "${pkgdir}/usr"
}

