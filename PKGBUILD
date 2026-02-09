# Maintainer: Dylan Marcano <nxusdev@protonmail.com>
pkgname=goxe-bin
pkgver=1.2.0
pkgrel=1
pkgdesc="Is a log reduction tool that normalizes, filters, and aggregates repeated messages to reduce noise and storage."
arch=('x86_64' 'aarch64')
options=('!debug')
url="https://github.com/DumbNoxx/Goxe"
license=('Apache-2.0')

source_x86_64=("https://github.com/DumbNoxx/goxe/releases/download/v${pkgver}/goxe_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("https://github.com/DumbNoxx/goxe/releases/download/v${pkgver}/goxe_${pkgver}_linux_arm64.tar.gz")

sha256sums_x86_64=('8b437a7f4b0d90aa6491ec6eef523209283a9ad335ec5ab30e60e4d910663924')
sha256sums_aarch64=('91e7b3ecdabe1119cc7b35a47832809216f382b265ef07984ee25aeda6af02f0')

package() {
  install -Dm755 "${srcdir}/goxe" "${pkgdir}/usr/bin/goxe-bin"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
