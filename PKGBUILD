# Maintainer: Thiago Almeida <echo "dGhpYWdvYWxtZWlkYXNhQGdtYWlsLmNvbQo=" | base64 -d>

pkgname="cloud-nuke-bin"
pkgver=0.29.5
pkgrel=1
pkgdesc="A tool for cleaning up your cloud accounts by nuking (deleting) all resources within it."
url="https://github.com/gruntwork-io/cloud-nuke"
arch=('x86_64' 'i386' 'aarch64')
license=('MIT')
provides=('cloud-nuke')
source_x86_64=("$pkgname::$url/releases/download/v${pkgver}/${pkgname/-bin/}_linux_amd64")
source_i386=("$pkgname::$url/releases/download/v${pkgver}/${pkgname/-bin/}_linux_386")
sha256sums_x86_64=(94d8fa868581fe1738864b3f38851f5a58a403ae2f5100e43a0aa5ac8503b6b7)
sha256sums_i386=(0563f505a0dc66b5181c29688af58ac20ca0a340eb960ab0b51c8ae70395bf10)
sha256sums_aarch64=(4c8fb4ecbaf5e7f132e5588d8588d0089f217e87bd78c3f0b5cb759d732c0f95)

package() {
  install -Dm755 cloud-nuke-bin "$pkgdir/usr/bin/cloud-nuke"
}
