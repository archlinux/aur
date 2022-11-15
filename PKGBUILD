# Maintainer: Grant G <grant@fig.io>

pkgname='fig-headless-bin'
pkgver='2.7.8'
pkgrel=1
pkgdesc='Adds IDE-style autocomplete to your existing terminal.'
arch=('x86_64')
url='https://fig.io'
license=('custom')
provides=('fig')
conflicts=('fig')
source=("${pkgname}-${pkgver//_/-}.tar.xz::https://repo.fig.io/generic/stable/asset/${pkgver//_/-}/x86_64/fig_headless.tar.xz")

sha256sums=('932daba32064d7cbbd85a7eb683fc0049c076576734fb89946d62d42fd39845f')

package() {
  cp -r "${srcdir}/usr" "${pkgdir}/usr"
}
