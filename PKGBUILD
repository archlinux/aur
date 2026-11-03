# Maintainer: Wyrd Company <support@wyrd.company>
pkgname='dcb-bin'
pkgver='0.3.0'
pkgrel=1
pkgdesc='Build and run development containers'
arch=('x86_64' 'aarch64')
url='https://github.com/wyrd-company/devcontainer-builder'
license=('MIT')
provides=('dcb')
conflicts=('dcb')
options=('!strip')
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::https://repo.wyrd.foo/artifacts/dcb/0.3.0/dcb_0.3.0_linux_x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::https://repo.wyrd.foo/artifacts/dcb/0.3.0/dcb_0.3.0_linux_aarch64.tar.gz")
sha256sums_x86_64=('af3141bdc7abcb260b20a9d50375661d84fd3bdb40cbaf6e2bc713697efa0d1d')
sha256sums_aarch64=('ee9f19c2bf9058fbde239044dc0d6b421db0c5eb513a32e88cb565ce2b17ef57')

package() {
  install -Dm755 "${srcdir}/dcb" "${pkgdir}/usr/bin/dcb"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${srcdir}/README.md" "${pkgdir}/usr/share/doc/dcb/README.md"
}
