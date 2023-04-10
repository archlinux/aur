# Maintainer: Bao Trinh <qubidt@gmail.com>

pkgname=levant-bin
pkgver=0.3.2
pkgrel=1
pkgdesc='An open source templating and deployment tool for HashiCorp Nomad jobs'
arch=('i686' 'x86_64' 'arm' 'aarch64')
url="https://github.com/hashicorp/levant"
license=('MPL')
depends=('glibc')
provides=('levant')
conflicts=('levant')
changelog=levant-bin.changelog
source_i686=("https://releases.hashicorp.com/levant/${pkgver}/levant_${pkgver}_linux_386.zip")
source_x86_64=("https://releases.hashicorp.com/levant/${pkgver}/levant_${pkgver}_linux_amd64.zip")
source_arm=("https://releases.hashicorp.com/levant/${pkgver}/levant_${pkgver}_linux_arm.zip")
source_aarch64=("https://releases.hashicorp.com/levant/${pkgver}/levant_${pkgver}_linux_arm64.zip")

sha256sums_i686=('ceebb6a29f7f473a0d2b7165a33312309cc8b57031469aa1f7b7b05c87ecff4a')
sha256sums_x86_64=('1e06180f8d8327e721e2ad4c9637d1f391034a22709473b8ed8ee19f1cad1570')
sha256sums_arm=('3c511d66e9018fdfefb179f5558f1639aa25f2a3a3376b7033f10a505f3c09a2')
sha256sums_aarch64=('8cb3c3c10b5415704964b437d85a2f26091bf25e8575df76403874eee78934b1')
options=('!strip')

package() {
  cd "$srcdir"
  install -Dm755 levant "$pkgdir"/usr/bin/levant
}
