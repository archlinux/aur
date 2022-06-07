# Maintainer: Thiago Almeida <echo "dGhpYWdvYWxtZWlkYXNhQGdtYWlsLmNvbQo=" | base64 -d>

pkgname="cloud-nuke-bin"
pkgver=0.11.7
pkgrel=1
pkgdesc="A tool for cleaning up your cloud accounts by nuking (deleting) all resources within it."
url="https://github.com/gruntwork-io/cloud-nuke"
arch=('x86_64' 'i386')
license=('MIT')
provides=('cloud-nuke')
source_x86_64=("$pkgname::$url/releases/download/v${pkgver}/${pkgname/-bin/}_linux_amd64")
source_i386=("$pkgname::$url/releases/download/v${pkgver}/${pkgname/-bin/}_linux_386")
sha256sums_x86_64=(2aa14fc85892ad8e4e39b0750bd6b715a67bad4c23f5515d41225e7a448a4710)
sha256sums_i386=(e0d97cfe180ece998fb3d59aed9c875b51a9158c018de9011ba5deaf58efb0cb)

package() {
  install -Dm755 cloud-nuke-bin "$pkgdir/usr/bin/cloud-nuke"
}
