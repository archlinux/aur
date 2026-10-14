# Maintainer: Wyrd Company <support@wyrd.company>
pkgname='wyrwood-bin'
pkgver='0.2.1'
pkgrel=1
pkgdesc='Filtered SSH-agent endpoints for containers'
arch=('x86_64' 'aarch64')
url='https://github.com/wyrd-company/wyrwood'
license=('Apache-2.0')
provides=('wyrwood')
conflicts=('wyrwood')
options=('!strip')
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::https://repo.wyrd.foo/artifacts/wyrwood/0.2.1/wyrwood_0.2.1_linux_x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::https://repo.wyrd.foo/artifacts/wyrwood/0.2.1/wyrwood_0.2.1_linux_aarch64.tar.gz")
sha256sums_x86_64=('d1a80705225c5cc6616044932e6e54fea608c95474b612353dfc1e53173ae71c')
sha256sums_aarch64=('edce53903b685b99cea0784c5b41aa30313551760fb7a6e66bbac6b8882a68eb')

package() {
  install -Dm755 "${srcdir}/wyrwood" "${pkgdir}/usr/bin/wyrwood"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${srcdir}/README.md" "${pkgdir}/usr/share/doc/wyrwood/README.md"
}
