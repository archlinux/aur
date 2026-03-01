# Maintainer: Dylan Marcano <nxusdev@protonmail.com>
pkgname=goxe-bin
pkgver=1.5.0
pkgrel=1
pkgdesc="Is a log reduction tool that normalizes, filters, and aggregates repeated messages to reduce noise and storage."
arch=('x86_64' 'aarch64')
options=('!debug')
url="https://github.com/DumbNoxx/Goxe"
license=('Apache-2.0')

source_x86_64=("https://github.com/DumbNoxx/goxe/releases/download/v${pkgver}/goxe_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("https://github.com/DumbNoxx/goxe/releases/download/v${pkgver}/goxe_${pkgver}_linux_arm64.tar.gz")

sha256sums_x86_64=('2227af3f1a831f43231f5aac914fe015e5cd64f963d5b0ec6c3e15bdc39ccb71')
sha256sums_aarch64=('ff73df0aa7c0d60584bafc8f643a6ea46c0c2f543cab795849c1336eea40c1e4')

package() {
  install -Dm755 "${srcdir}/goxe" "${pkgdir}/usr/bin/goxe-bin"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
