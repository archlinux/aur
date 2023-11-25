# Maintainer: Jan-Philipp Fischer <mail at jpfischer dot de>
_name=focus
pkgname=$_name-timer-bin
pkgver=1.4.2 # renovate: datasource=github-tags depName=ayoisaiah/focus
pkgrel=1
pkgdesc="Focus is a cross-platform productivity timer for the command line written in Go."
arch=('x86_64')
url="https://github.com/ayoisaiah/$_name"
license=('MIT')
provides=($_name)
conflicts=($_name)
options=('!strip')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ayoisaiah/${_name}/releases/download/v${pkgver}/${_name}_${pkgver}_linux_amd64.tar.gz")
b2sums=('84b31c751f29e94da12b7fbb6fe68f9a374c8eb93323c7225cda1baad16821223b7a12e80258aec9e80a21c0d42d4ed5c7dec30702ebe7f9494f984d556fa69e')

package() {
  install -Dm644 LICENCE "$pkgdir/usr/share/licenses/$pkgname/LICENCE"
  install -Dm755 "${_name}" "${pkgdir}/usr/bin/${_name}"
}
