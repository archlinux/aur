# Maintainer: Dylan Marcano <nxusdev@protonmail.com>
pkgname=goxe-bin
pkgver=1.3.6
pkgrel=1
pkgdesc="Is a log reduction tool that normalizes, filters, and aggregates repeated messages to reduce noise and storage."
arch=('x86_64' 'aarch64')
options=('!debug')
url="https://github.com/DumbNoxx/Goxe"
license=('Apache-2.0')

source_x86_64=("https://github.com/DumbNoxx/goxe/releases/download/v${pkgver}/goxe_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("https://github.com/DumbNoxx/goxe/releases/download/v${pkgver}/goxe_${pkgver}_linux_arm64.tar.gz")

sha256sums_x86_64=('46965fb1288c8b3433c8072c94c28d4389eea1ba416f60a0fc8025de2b7bfc6a')
sha256sums_aarch64=('a83dd8e7bb350ce5f2636f4e6775f954da2da4b26ab66774b963fd2168f89172')

package() {
  install -Dm755 "${srcdir}/goxe" "${pkgdir}/usr/bin/goxe-bin"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
