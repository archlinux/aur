# Maintainer: Dylan Marcano <nxusdev@protonmail.com>
pkgname=goxe-bin
pkgver=1.3.1
pkgrel=1
pkgdesc="Is a log reduction tool that normalizes, filters, and aggregates repeated messages to reduce noise and storage."
arch=('x86_64' 'aarch64')
options=('!debug')
url="https://github.com/DumbNoxx/Goxe"
license=('Apache-2.0')

source_x86_64=("https://github.com/DumbNoxx/goxe/releases/download/v${pkgver}/goxe_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("https://github.com/DumbNoxx/goxe/releases/download/v${pkgver}/goxe_${pkgver}_linux_arm64.tar.gz")

sha256sums_x86_64=('07fe59ac1ea9aa798104716e97b4e343f41e53f2da411328d49cd666df3d0451')
sha256sums_aarch64=('d349ecb5cece6df6d67265a11fec29b075fc54d8a55aeeeb19ba39bd76d75a55')

package() {
  install -Dm755 "${srcdir}/goxe" "${pkgdir}/usr/bin/goxe-bin"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
