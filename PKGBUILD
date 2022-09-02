# Maintainer: Grant G <grant@fig.io>
pkgname='fig'
pkgver='2.3.17'
pkgrel=1
pkgdesc='Adds IDE-style autocomplete to your existing terminal.'
arch=('x86_64')
url='https://fig.io'
license=('custom')
depends=('gtk3' 'webkit2gtk' 'libappindicator-gtk3' 'ibus' 'xdg-utils')
source=("${pkgname}-${pkgver//_/-}.tar.xz::https://d64exoad0v6gz.cloudfront.net/${pkgver//_/-}/linux/${arch}/fig.tar.xz")

sha256sums=('36eb3b8f1da3d3b93a3697b8b441e5a26d8a798e5bf94424b53eefe145dd6fa3')

package() {
  cp -r "${srcdir}/usr" "${pkgdir}/usr"
  chmod +x "${pkgdir}/usr/bin/"*
}

