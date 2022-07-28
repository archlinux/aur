# Maintainer: Thiago Almeida <echo "dGhpYWdvYWxtZWlkYXNhQGdtYWlsLmNvbQo=" | base64 -d>

pkgname="cloud-nuke-bin"
pkgver=0.16.2
pkgrel=1
pkgdesc="A tool for cleaning up your cloud accounts by nuking (deleting) all resources within it."
url="https://github.com/gruntwork-io/cloud-nuke"
arch=('x86_64' 'i386' 'aarch64')
license=('MIT')
provides=('cloud-nuke')
source_x86_64=("$pkgname::$url/releases/download/v${pkgver}/${pkgname/-bin/}_linux_amd64")
source_i386=("$pkgname::$url/releases/download/v${pkgver}/${pkgname/-bin/}_linux_386")
sha256sums_x86_64=(b09abd442a783c2074f49aedad7b84a3c658a1e2f395ea6ae24b300278478463)
sha256sums_i386=(dc8086e18006bb5fd6dc958df0ac1513a15bf1725fb8cbb582983f27af9fff54)
sha256sums_aarch64=(f7bd41f7e87cba9b4b6bc90a8b20b16bdd3b6ffc4c1c0fe641658ce7b46f3521)

package() {
  install -Dm755 cloud-nuke-bin "$pkgdir/usr/bin/cloud-nuke"
}
