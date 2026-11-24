# Maintainer: Alberto Oliveira <orkan.aos@gmail.com>
pkgname=spinnaker-spin
pkgver=2026.2.6
pkgrel=2
pkgdesc="Command-line administration tool to manage Spinnaker applications, pipelines and configs"
arch=('x86_64')
url="https://github.com/spinnaker/spinnaker/tree/main/spin"
license=('Apache-2.0')
depends=('glibc')

options=('!strip' '!debug')
source=("spin-${pkgver}-linux-amd64::https://storage.googleapis.com/spinnaker-artifacts/spin/${pkgver}/linux/amd64/spin")
sha256sums=('178acfa64cc0e9a8216cec0593284239acd0cdc16baf95cf29c5f37f594adfc2')

package() {
    install -Dm755 "${srcdir}/spin-${pkgver}-linux-amd64" "${pkgdir}/usr/bin/spin"
}
