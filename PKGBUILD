# Maintainer: Grant G <grant@fig.io>
pkgname='fig'
pkgver='2.3.14'
pkgrel=2
pkgdesc='Adds IDE-style autocomplete to your existing terminal.'
arch=('x86_64')
url='https://fig.io'
license=('custom')
depends=('gtk3' 'webkit2gtk' 'libappindicator-gtk3' 'ibus' 'xdg-utils')
source=("${pkgname}-${pkgver//_/-}.tgz::https://pkg.fig.io/download?kind=archlinux&platform=archlinux&version=${pkgver//_/-}&arch=${arch}")

sha256sums=('0314df59524e24f45e66e9b0aa2fe55e3e7fbf480cd0ac27cb3be29f8d1c2c85')

package() {
  cp -r "${srcdir}/usr" "${pkgdir}/usr"
  chmod +x "${pkgdir}/usr/bin/"*
}

