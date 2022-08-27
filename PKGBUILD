# Maintainer: Grant G <grant@fig.io>
pkgname='fig'
pkgver='2.3.14'
pkgrel=1
pkgdesc='Adds IDE-style autocomplete to your existing terminal.'
arch=('x86_64')
url='https://fig.io'
license=('custom')
depends=('gtk3' 'webkit2gtk' 'libappindicator-gtk3' 'ibus' 'xdg-utils')
source=("${pkgname}-${pkgver//_/-}.tgz::https://pkg.fig.io/download?kind=archlinux&platform=archlinux&version=${pkgver//_/-}&arch=${arch}")

sha256sums=('8bca3b447af10f653095cc20bff97256ca365136074271f3edc55b9264999bed')

package() {
  cp -r "${srcdir}/usr" "${pkgdir}/usr"
  chmod +x "${pkgdir}/usr/bin/"*
}

