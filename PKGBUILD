# Maintainer: Wyrd Company <support@wyrd.company>
pkgname='toha-bin'
pkgver='0.1.0'
pkgrel=1
pkgdesc='Generate projects and files from templates'
arch=('x86_64' 'aarch64')
url='https://github.com/wyrd-company/toha'
license=('Apache-2.0')
provides=('toha')
conflicts=('toha')
options=('!strip')
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::https://repo.wyrd.foo/artifacts/toha/0.1.0/toha_0.1.0_linux_x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::https://repo.wyrd.foo/artifacts/toha/0.1.0/toha_0.1.0_linux_aarch64.tar.gz")
sha256sums_x86_64=('6ff38c2a7947e699e20932117da0e5f70062fa0465127f96b5690694eb66794f')
sha256sums_aarch64=('bf92809313b2daa84a438422d70e793a884afeeaa60dab5c2c0135682f4e6382')

package() {
  install -Dm755 "${srcdir}/toha" "${pkgdir}/usr/bin/toha"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${srcdir}/README.md" "${pkgdir}/usr/share/doc/toha/README.md"
}
