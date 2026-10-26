# Maintainer: Wyrd Company <support@wyrd.company>
pkgname='toha-bin'
pkgver='0.4.0'
pkgrel=1
pkgdesc='Generate projects and files from templates'
arch=('x86_64' 'aarch64')
url='https://github.com/wyrd-company/toha'
license=('Apache-2.0')
provides=('toha')
conflicts=('toha')
options=('!strip')
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::https://repo.wyrd.foo/artifacts/toha/0.4.0/toha_0.4.0_linux_x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::https://repo.wyrd.foo/artifacts/toha/0.4.0/toha_0.4.0_linux_aarch64.tar.gz")
sha256sums_x86_64=('cdbd95c4d1fbe47a41a1783b34eadb08057f0be62f27faf3b51fc5217941bd1d')
sha256sums_aarch64=('750efbd785196a7b0f220e31c86aaa8b7329310a56f30c7acac5cf6af8bbdd8e')

package() {
  install -Dm755 "${srcdir}/toha" "${pkgdir}/usr/bin/toha"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${srcdir}/README.md" "${pkgdir}/usr/share/doc/toha/README.md"
}
