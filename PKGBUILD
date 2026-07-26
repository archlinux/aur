# Maintainer: Hauryn Lee <lihaoyuan0506@gmail.com>
pkgname=meowcli-bin
pkgver=1.5.3
pkgrel=1
pkgdesc='High-performance API forwarding service for CLI tools'
arch=('x86_64' 'aarch64')
url='https://github.com/nekohy/MeowCLI'
license=('custom:unknown')
install='meowcli-bin.install'
provides=("meowcli=${pkgver}")
options=('!strip' '!debug')

source_x86_64=("${pkgname}-${pkgver}-x86_64::https://github.com/nekohy/MeowCLI/releases/download/v1.5.3/meowcli-linux-amd64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::https://github.com/nekohy/MeowCLI/releases/download/v1.5.3/meowcli-linux-arm64")
sha256sums_x86_64=('SKIP')
sha256sums_aarch64=('SKIP')

package() {
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/meowcli"
}
