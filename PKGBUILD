# Maintainer: Pavel Olizko <contact@nolight.dev>

pkgname=nls-bin
pkgver=0.1.1
pkgrel=1
pkgdesc='Nushell-style ls for bash, zsh, and fish'
arch=('x86_64' 'aarch64')
url='https://github.com/nolight132/nls'
license=('MIT')
provides=('nls')
conflicts=('nls')
source_x86_64=("nls-${pkgver}-linux-amd64.tar.gz::${url}/releases/download/v${pkgver}/nls_v${pkgver}_linux_amd64.tar.gz")
source_aarch64=("nls-${pkgver}-linux-arm64.tar.gz::${url}/releases/download/v${pkgver}/nls_v${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('c83d8f787b23bfa699de4dd115b865dbcff29030436814d6ea01577fa172f1a6')
sha256sums_aarch64=('02f11b6884d3b16b0e51df20cf6260618e0f5dbafaecfe5a620e7b4338a37bda')

package() {
  install -Dm755 nls "${pkgdir}/usr/bin/nls"
}
