# Maintainer: Bao Trinh <qubidt@gmail.com>

pkgname=levant-bin
pkgver=0.3.3
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

sha256sums_i686=('75a6196be4b683f14102fe1f1218b51738a5e13d113f9fea09268ffc1cbe54a6')
sha256sums_x86_64=('630c4c0499fdc0b904be22905e18dcd81350f8011ab1494b23f20d06f192d462')
sha256sums_arm=('02c7106dbf788fdc592f30393a44c9fc4103c7ec7b5662eed351425b149e3a7e')
sha256sums_aarch64=('e2e3bf5aed271d848d8aac86b4649594b7f9aa1e11aa4612f5b571f97598bba4')
options=('!strip')

package() {
  cd "$srcdir"
  install -Dm755 levant "$pkgdir"/usr/bin/levant
}
