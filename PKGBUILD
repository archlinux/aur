# Maintainer: Wyrd Company <support@wyrd.company>
pkgname='dcb-bin'
pkgver='0.2.0'
pkgrel=1
pkgdesc='Build and run development containers'
arch=('x86_64' 'aarch64')
url='https://github.com/wyrd-company/devcontainer-builder'
license=('MIT')
provides=('dcb')
conflicts=('dcb')
options=('!strip')
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::https://repo.wyrd.foo/artifacts/dcb/0.2.0/dcb_0.2.0_linux_x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::https://repo.wyrd.foo/artifacts/dcb/0.2.0/dcb_0.2.0_linux_aarch64.tar.gz")
sha256sums_x86_64=('c3906a74482db3ac19a0dfc1d0852627cc214100bba1931831040d66b632963e')
sha256sums_aarch64=('21b58e3e44c01cf6a6cd3b2b59eb1b7f05cb2e42ef88f8510aa8d8a498238478')

package() {
  install -Dm755 "${srcdir}/dcb" "${pkgdir}/usr/bin/dcb"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${srcdir}/README.md" "${pkgdir}/usr/share/doc/dcb/README.md"
}
