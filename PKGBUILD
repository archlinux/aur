# Maintainer: Bao Trinh <qubidt@gmail.com>

pkgname=levant-bin
pkgver=0.3.1
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

sha256sums_i686=('b0fe0871d511aa42a3d8bc156452c0d59166923e6de927f660628c7e9391398e')
sha256sums_x86_64=('01b4a15a1eb5d6c69178ff383a457a6251658224dd9537fe1ea9f24e07044f76')
sha256sums_arm=('9b7176f351915e0dbc030ab8347c09ee4f10f8b4f4f807637ef8fc23e42f30c2')
sha256sums_aarch64=('a30190ba4aa5fd7e6b2ef8cd4e0cd949349736f00d215c8c28137c85a0f1ae3d')
options=('!strip')

package() {
  install -Dm755 levant "$pkgdir"/usr/bin/levant
}
