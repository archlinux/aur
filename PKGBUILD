# Contributor: Paul Nicholson <brenix@gmail.com>

_name=variant
pkgname=variant-bin
pkgdesc="Turn your bash scripts into a modern, single-executable CLI app today"
pkgver=0.36.1
pkgrel=1
arch=('x86_64')
url="https://github.com/mumoshu/variant2"
license=('MIT')
provides=('variant')
source=(
  "${pkgname}-${pkgver}::https://github.com/mumoshu/variant2/releases/download/v${pkgver}/variant_${pkgver}_linux_amd64.tar.gz"
)
sha256sums=('d2593ad207f4ae5b225eb0b97b6e4fd40d453158a55a3faa8cf4addfb32dda24')

package() {
  install -Dm0755 ${_name} "${pkgdir}/usr/bin/${_name}"
}
