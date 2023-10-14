# Maintainer: Jan-Philipp Fischer <mail at jpfischer dot de>
_name=focus
pkgname=$_name-timer-bin
pkgver=1.4.0 # renovate: datasource=github-tags depName=ayoisaiah/focus
pkgrel=1
pkgdesc="Focus is a cross-platform productivity timer for the command line written in Go."
arch=('x86_64')
url="https://github.com/ayoisaiah/$_name"
license=('MIT')
provides=($_name)
conflicts=($_name)
options=('!strip')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ayoisaiah/${_name}/releases/download/v${pkgver}/${_name}_${pkgver}_linux_amd64.tar.gz")
b2sums=('61284e594e5ab2acd9a7ac8f83d9ba5d02d1282957ae519f8d0af336b6b423d946275c6075fe477517f2a078120bf93e73588aa12bbced20e0ea6edc6e366edd')

package() {
  install -Dm644 LICENCE "$pkgdir/usr/share/licenses/$pkgname/LICENCE"
  install -Dm755 "${_name}" "${pkgdir}/usr/bin/${_name}"
}
