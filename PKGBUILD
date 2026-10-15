# Maintainer: Wyrd Company <support@wyrd.company>
pkgname='wyrwood-bin'
pkgver='0.2.2'
pkgrel=1
pkgdesc='Filtered SSH-agent endpoints for containers'
arch=('x86_64' 'aarch64')
url='https://github.com/wyrd-company/wyrwood'
license=('Apache-2.0')
provides=('wyrwood')
conflicts=('wyrwood')
options=('!strip')
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::https://repo.wyrd.foo/artifacts/wyrwood/0.2.2/wyrwood_0.2.2_linux_x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::https://repo.wyrd.foo/artifacts/wyrwood/0.2.2/wyrwood_0.2.2_linux_aarch64.tar.gz")
sha256sums_x86_64=('fec31d9f04bbab05be8f6ea968e014191d7683ad665d8b957f05e68410f6b742')
sha256sums_aarch64=('33e49c933a37428e41fdccab608fc9e79d54e6be1942634440d3291e73874880')

package() {
  install -Dm755 "${srcdir}/wyrwood" "${pkgdir}/usr/bin/wyrwood"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${srcdir}/README.md" "${pkgdir}/usr/share/doc/wyrwood/README.md"
}
