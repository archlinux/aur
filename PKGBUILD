# Maintainer: Wyrd Company <support@wyrd.company>
pkgname='toha-bin'
pkgver='0.5.1'
pkgrel=1
pkgdesc='Generate projects and files from templates'
arch=('x86_64' 'aarch64')
url='https://github.com/wyrd-company/toha'
license=('Apache-2.0')
provides=('toha')
conflicts=('toha')
options=('!strip')
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::https://repo.wyrd.foo/artifacts/toha/0.5.1/toha_0.5.1_linux_x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::https://repo.wyrd.foo/artifacts/toha/0.5.1/toha_0.5.1_linux_aarch64.tar.gz")
sha256sums_x86_64=('764891a397e7d3b83d6ae775bc9fa0a3dfea01d90292f27dcce134b11e54b2ad')
sha256sums_aarch64=('828fb74d0fb3936c395237b12a675b01c8d68a71bb073a7c9541d47a9f419a71')

package() {
  install -Dm755 "${srcdir}/toha" "${pkgdir}/usr/bin/toha"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${srcdir}/README.md" "${pkgdir}/usr/share/doc/toha/README.md"
}
