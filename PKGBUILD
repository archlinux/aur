# Maintainer: HAHWUL <hahwul@gmail.com>
pkgname=deadfinder
pkgver=2.0.2
pkgrel=1
pkgdesc="Find dead (broken) links in web pages, URL lists, and sitemaps"
arch=('x86_64' 'aarch64')
url="https://github.com/hahwul/deadfinder"
license=('MIT')

source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${url}/releases/download/${pkgver}/deadfinder-linux-x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${url}/releases/download/${pkgver}/deadfinder-linux-aarch64.tar.gz")
source=("LICENSE-${pkgver}::https://raw.githubusercontent.com/hahwul/deadfinder/${pkgver}/LICENSE")
sha256sums=('SKIP')
sha256sums_x86_64=('SKIP')
sha256sums_aarch64=('SKIP')

package() {
  install -Dm755 "${srcdir}/deadfinder" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
