# Contributor: Paul Nicholson <brenix@gmail.com>

_name=variant
pkgname=variant-bin
pkgdesc="Turn your bash scripts into a modern, single-executable CLI app today"
pkgver=0.37.1
pkgrel=1
arch=('x86_64')
url="https://github.com/mumoshu/variant2"
license=('MIT')
provides=('variant')
source=(
  "${pkgname}-${pkgver}::https://github.com/mumoshu/variant2/releases/download/v${pkgver}/variant_${pkgver}_linux_amd64.tar.gz"
)
sha256sums=('59a845fcecd6087524513ae3498e95ff511ae091a8aecacded31e7bc598b7719')

package() {
  install -Dm0755 ${_name} "${pkgdir}/usr/bin/${_name}"
}
