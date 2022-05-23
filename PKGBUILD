# Maintainer: Thiago Almeida <echo "dGhpYWdvYWxtZWlkYXNhQGdtYWlsLmNvbQo=" | base64 -d>

pkgname="cloud-nuke-bin"
pkgver=0.11.6
pkgrel=1
pkgdesc="A tool for cleaning up your cloud accounts by nuking (deleting) all resources within it."
url="https://github.com/gruntwork-io/cloud-nuke"
arch=('x86_64' 'i386')
license=('MIT')
provides=('cloud-nuke')
source_x86_64=("$pkgname::$url/releases/download/v${pkgver}/${pkgname/-bin/}_linux_amd64")
source_i386=("$pkgname::$url/releases/download/v${pkgver}/${pkgname/-bin/}_linux_386")
sha256sums_x86_64=(043b75a488166d79a052587643afd2d69e4dd45e54a83b9ef6f3d47f6211deb2)
sha256sums_i386=(c411bcce7c1156ccf435faeefa54496420881abfd45fbc5a65cb8d4bdfd8088f)

package() {
  install -Dm755 cloud-nuke-bin "$pkgdir/usr/bin/cloud-nuke"
}
