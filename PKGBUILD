# Maintainer: Wyrd Company <support@wyrd.company>
pkgname='toha-bin'
pkgver='0.5.0'
pkgrel=1
pkgdesc='Generate projects and files from templates'
arch=('x86_64' 'aarch64')
url='https://github.com/wyrd-company/toha'
license=('Apache-2.0')
provides=('toha')
conflicts=('toha')
options=('!strip')
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::https://repo.wyrd.foo/artifacts/toha/0.5.0/toha_0.5.0_linux_x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::https://repo.wyrd.foo/artifacts/toha/0.5.0/toha_0.5.0_linux_aarch64.tar.gz")
sha256sums_x86_64=('35fabd2cd6a986f0d7f90cdd576e5c28c00db5abd61775c3436656108793a71d')
sha256sums_aarch64=('a1b2fb7c5a79a0c00b7df813d6a2d14f44e729d41b7ea781d0a5942cf0b5f9e8')

package() {
  install -Dm755 "${srcdir}/toha" "${pkgdir}/usr/bin/toha"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${srcdir}/README.md" "${pkgdir}/usr/share/doc/toha/README.md"
}
