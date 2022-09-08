# Maintainer: Grant G <grant@fig.io>
pkgname='fig-beta'
pkgver='2.4.1'
pkgrel=1
pkgdesc='Adds IDE-style autocomplete to your existing terminal.'
arch=('x86_64')
url='https://fig.io'
license=('custom')
depends=('gtk3' 'webkit2gtk' 'libappindicator-gtk3' 'ibus' 'xdg-utils')
provides=('fig')
conflicts=('fig')
source=("${pkgname}-${pkgver//_/-}.tar.xz::https://d64exoad0v6gz.cloudfront.net/${pkgver//_/-}/linux/${arch}/fig.tar.xz")

sha256sums=('e6d6465d6087ed5ef907f7ca47f92996ea8e6d7152b915f5ddbf1887c492a03c')

package() {
  cp -r "${srcdir}/usr" "${pkgdir}/usr"
}

