# Maintainer: Jan-Philipp Fischer <mail at jpfischer dot de>
_name=focus
pkgname=$_name-timer-bin
pkgver=1.4.3 # renovate: datasource=github-tags depName=ayoisaiah/focus
pkgrel=1
pkgdesc="Focus is a cross-platform productivity timer for the command line written in Go."
arch=('x86_64')
url="https://github.com/ayoisaiah/$_name"
license=('MIT')
provides=($_name)
conflicts=($_name)
options=('!strip')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ayoisaiah/${_name}/releases/download/v${pkgver}/${_name}_${pkgver}_linux_amd64.tar.gz")
b2sums=('1b6104fe27be576c1e3451c09e57d15d7bc01395327aed80e863b67190770262833da9ba71f2a51f4828e676de01b3a540021e056c3dcb433113170099f643bb')

package() {
  install -Dm644 LICENCE "$pkgdir/usr/share/licenses/$pkgname/LICENCE"
  install -Dm755 "${_name}" "${pkgdir}/usr/bin/${_name}"
}
