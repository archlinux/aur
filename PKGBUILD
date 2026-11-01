# Maintainer: Wyrd Company <support@wyrd.company>
pkgname='dcb-bin'
pkgver='0.2.1'
pkgrel=1
pkgdesc='Build and run development containers'
arch=('x86_64' 'aarch64')
url='https://github.com/wyrd-company/devcontainer-builder'
license=('MIT')
provides=('dcb')
conflicts=('dcb')
options=('!strip')
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::https://repo.wyrd.foo/artifacts/dcb/0.2.1/dcb_0.2.1_linux_x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::https://repo.wyrd.foo/artifacts/dcb/0.2.1/dcb_0.2.1_linux_aarch64.tar.gz")
sha256sums_x86_64=('cef3428f8ca6e16dc04985d1cb2f6c8be36d130c5e93210dbfa462d6ba7eec97')
sha256sums_aarch64=('20f47b5ae0340da4d2cafa3f151966630249d4976913227901853e9df769a912')

package() {
  install -Dm755 "${srcdir}/dcb" "${pkgdir}/usr/bin/dcb"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${srcdir}/README.md" "${pkgdir}/usr/share/doc/dcb/README.md"
}
