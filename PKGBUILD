# Maintainer: Jan-Philipp Fischer <mail at jpfischer dot de>
_name=focus
pkgname=$_name-timer-bin
pkgver=1.0.0 # renovate: datasource=github-tags depName=ayoisaiah/focus
pkgrel=1
pkgdesc="Focus is a cross-platform productivity timer for the command line written in Go."
arch=('x86_64')
url="https://github.com/ayoisaiah/$_name"
license=('MIT')
provides=($_name)
conflicts=($_name)
options=('!strip')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ayoisaiah/${_name}/releases/download/v${pkgver}/${_name}_${pkgver}_linux_amd64.tar.gz")
b2sums=('7cd0f33dbbd6bb1d13a7e88eec5445403d486347b18b766ef700af31cb206f3d163dfe2f27566b2ce1cd105ebef38afc4085054e680764b2fefeb110b8eb71fb')

package() {
  install -Dm644 LICENCE "$pkgdir/usr/share/licenses/$pkgname/LICENCE"
  install -Dm755 "${_name}" "${pkgdir}/usr/bin/${_name}"
}
