# Maintainer: Wyrd Company <support@wyrd.company>
pkgname='toha-bin'
pkgver='0.2.0'
pkgrel=1
pkgdesc='Generate projects and files from templates'
arch=('x86_64' 'aarch64')
url='https://github.com/wyrd-company/toha'
license=('Apache-2.0')
provides=('toha')
conflicts=('toha')
options=('!strip')
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::https://repo.wyrd.foo/artifacts/toha/0.2.0/toha_0.2.0_linux_x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::https://repo.wyrd.foo/artifacts/toha/0.2.0/toha_0.2.0_linux_aarch64.tar.gz")
sha256sums_x86_64=('13b35e0dbf09bd2c8522a83dc334759b928a2d1a8a0ccd40d2d139da713a052f')
sha256sums_aarch64=('815c30e5dca44df84ea734e1725bdd6e31fc23e8ba8d980d696a78931ebaaa52')

package() {
  install -Dm755 "${srcdir}/toha" "${pkgdir}/usr/bin/toha"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${srcdir}/README.md" "${pkgdir}/usr/share/doc/toha/README.md"
}
