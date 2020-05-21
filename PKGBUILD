# Contributor: Paul Nicholson <brenix@gmail.com>

_name=variant
pkgname=variant-bin
pkgdesc="Turn your bash scripts into a modern, single-executable CLI app today"
pkgver=0.28.0
pkgrel=1
arch=('x86_64')
url="https://github.com/mumoshu/variant2"
license=('MIT')
provides=('variant')
source=(
  "${pkgname}-${pkgver}::https://github.com/mumoshu/variant2/releases/download/v${pkgver}/variant_${pkgver}_linux_amd64.tar.gz"
)
sha256sums=('96949ea3170515e718d2e500c55bacfad835aaad7703a15c37d6a65bd53ee068')

package() {
  install -Dm0755 ${_name} "${pkgdir}/usr/bin/${_name}"
}
