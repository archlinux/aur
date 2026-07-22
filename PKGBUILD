# Maintainer: Wyrd Company <support@wyrd.company>
pkgname='wyrwood-bin'
pkgver='0.1.0'
pkgrel=1
pkgdesc='Filtered SSH-agent endpoints for containers'
arch=('x86_64' 'aarch64')
url='https://github.com/wyrd-company/wyrwood'
license=('Apache-2.0')
provides=('wyrwood')
conflicts=('wyrwood')
options=('!strip')
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::https://repo.wyrd.foo/artifacts/wyrwood/0.1.0/wyrwood_0.1.0_linux_x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::https://repo.wyrd.foo/artifacts/wyrwood/0.1.0/wyrwood_0.1.0_linux_aarch64.tar.gz")
sha256sums_x86_64=('563af8535bbdbcdbc0ce86ae980b9f60419aeeebb9b57a52055d32d243ed364b')
sha256sums_aarch64=('2ee1471911c835b4689453fcff41cb92d7fdcdf867b06a49b11b3b05797bf56e')

package() {
  install -Dm755 "${srcdir}/wyrwood" "${pkgdir}/usr/bin/wyrwood"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${srcdir}/README.md" "${pkgdir}/usr/share/doc/wyrwood/README.md"
}
