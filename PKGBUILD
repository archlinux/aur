# Maintainer: dongdong <1252603486@qq.com>

pkgname=kigi-bin
pkgver=0.1.18
pkgrel=1
pkgdesc='Terminal coding agent with graph-based workflows (prebuilt binary)'
arch=('x86_64' 'aarch64')
url='https://github.com/ZacharyZhang-NY/Kigi-CLI'
license=('Apache-2.0')
depends=('glibc' 'gcc-libs' 'zlib')
options=('!debug')
provides=('kigi')
conflicts=('kigi')
source_x86_64=("https://github.com/ZacharyZhang-NY/Kigi-CLI/releases/download/v${pkgver}/kigi-${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("https://github.com/ZacharyZhang-NY/Kigi-CLI/releases/download/v${pkgver}/kigi-${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('45310d60588f9df0aa7fcf4fe448fb24f7075e8a25eedbbf5cf0cbd4a673f5e4')
sha256sums_aarch64=('2f41a304489a9bcb1393301fb932ffe92ef7edf617c61a558b9f4d6ff93dec09')

package() {
  install -Dm755 "${srcdir}/kigi" "${pkgdir}/usr/bin/kigi"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${srcdir}/NOTICE" "${pkgdir}/usr/share/doc/${pkgname}/NOTICE"
  install -Dm644 "${srcdir}/THIRD-PARTY-NOTICES.md" "${pkgdir}/usr/share/doc/${pkgname}/THIRD-PARTY-NOTICES.md"
}
