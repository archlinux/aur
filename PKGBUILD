# Maintainer: Bao Trinh <qubidt@gmail.com>

pkgname=levant-bin
pkgver=0.3.0
pkgrel=1
pkgdesc='An open source templating and deployment tool for HashiCorp Nomad jobs'
arch=('i686' 'x86_64' 'arm' 'aarch64')
url="https://github.com/hashicorp/levant"
license=('MPL')
depends=('glibc')
provides=('levant')
changelog=levant-bin.changelog
source_i686=("https://releases.hashicorp.com/levant/${pkgver}/levant_${pkgver}_linux_386.zip")
source_x86_64=("https://releases.hashicorp.com/levant/${pkgver}/levant_${pkgver}_linux_amd64.zip")
source_arm=("https://releases.hashicorp.com/levant/${pkgver}/levant_${pkgver}_linux_arm.zip")
source_aarch64=("https://releases.hashicorp.com/levant/${pkgver}/levant_${pkgver}_linux_arm64.zip")

sha256sums_i686=('16171b0cf0ea1cdbd6805eb8b0160eaee32ed35f3832f958a231e7d71deb65e5')
sha256sums_x86_64=('082bd747cf49bc317035a4caab8742924eac67605a82b1b5f4640d896999ea98')
sha256sums_arm=('b7ab105a08622e75fcff2d47e0475f7ba9ccbff791dddfd66ed5f1cd63db6ac1')
sha256sums_aarch64=('5d4af2ed56b7493ea04b0d2a984e26661d3d500cc8bcf097d87545d4583dd9c8')
options=('!strip')

package() {
  install -Dm755 levant "$pkgdir"/usr/bin/levant
}
