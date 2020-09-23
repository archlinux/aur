# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname='naabu'
pkgname="${_pkgname}-bin"
pkgver=2.0.1
pkgrel=1
pkgdesc='Fast port scanner with a focus on reliability and simplicity'
arch=('x86_64' 'armv6h' 'aarch64')
url='https://github.com/projectdiscovery/naabu'
license=('GPL3')
provides=("${_pkgname}")

source_x86_64=("${_pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_amd64.tar.gz")
source_armv6h=("${_pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_armv6.tar.gz")
source_aarch64=("${_pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_arm64.tar.gz")

sha256sums_x86_64=('67e0968020e82c658cb14f6ad7c80a9861b75a1d4bd8db1b32021fc8a0c0d446')
sha256sums_armv6h=('f1383cab0cd51e616481db654996fcb6e8dd149f09a0fb9e0849cacc7729de4a')
sha256sums_aarch64=('c3e44178a11dfaebf02b6020b701877a7b2a18f97a9f0a995c072614a8d73572')

package() {
  install -Dm755 -t "${pkgdir}/usr/bin" "${_pkgname}"
  install -Dm644 -t "${pkgdir}/usr/share/doc/${_pkgname}" 'README.md'
}

# vim: ts=2 sw=2 et:
