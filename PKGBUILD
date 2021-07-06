# Contributor: Paul Nicholson <brenix@gmail.com>

_name=variant
pkgname=variant-bin
pkgdesc="Turn your bash scripts into a modern, single-executable CLI app today"
pkgver=0.38.0
pkgrel=1
arch=('x86_64')
url="https://github.com/mumoshu/variant2"
license=('MIT')
provides=('variant')
source=(
  "${pkgname}-${pkgver}::https://github.com/mumoshu/variant2/releases/download/v${pkgver}/variant_${pkgver}_linux_amd64.tar.gz"
)
sha256sums=('495721b3f68b59433ab23b834260f877b33928a0e980cafd9fb536411dbc834d')

package() {
  install -Dm0755 ${_name} "${pkgdir}/usr/bin/${_name}"
}
