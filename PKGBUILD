# Maintainer: Brуan Childs <godeater[at]𝚐mail[dot]com>
pkgname=atmos-bin
pkgver=1.78.0
pkgrel=1
pkgdesc='Automated Terraform Management & Orchestration Software (ATMOS)'
arch=(x86_64)
url=https://github.com/cloudposse/atmos
license=('Apache-2.0')
optdepends=('terraform'
            'opentofu')
source=("${url}/releases/download/v${pkgver}/${pkgname/-bin/}_${pkgver}_linux_amd64")
b2sums=('abcbff170fd03e78b682027e45b44790fe55b4a8478ddc0f1852c73d7b9dd4be2d1f52662e4be9efe29b8af7d0335a8cec163be4adefaab1d1a4d52b27fec299')
sha512sums=('46b353681dab1a8d5bee6999ba37065000b4a12a830fb6282fc4657242b3d32d32736036bfa87f8c5bee9864284e306291a9218e71c59845b36c0da0e1ac3574')

package() {
  install -Dm755 "${srcdir}/${pkgname/-bin/}_${pkgver}_linux_amd64" "${pkgdir}/usr/bin/${pkgname/-bin/}"
}

