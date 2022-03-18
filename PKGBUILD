# Maintainer: Thiago Almeida <echo "dGhpYWdvYWxtZWlkYXNhQGdtYWlsLmNvbQo=" | base64 -d>

pkgname="cloud-nuke-bin"
pkgver=0.11.3
pkgrel=1
pkgdesc="A tool for cleaning up your cloud accounts by nuking (deleting) all resources within it."
url="https://github.com/gruntwork-io/cloud-nuke"
arch=('x86_64' 'i386')
license=('MIT')
provides=('cloud-nuke')
source_x86_64=("$pkgname::$url/releases/download/v${pkgver}/${pkgname/-bin/}_linux_amd64")
source_i386=("$pkgname::$url/releases/download/v${pkgver}/${pkgname/-bin/}_linux_386")
sha256sums_x86_64=(b9cce7506b32edef33f03d95c9548a1a3d5313868357ad6f8d5e364fc405d2ad)
sha256sums_i386=(0e071048f2bb0b34ba0261f92b894c2dbb49306ef3973ccb9d989792132dba41)

package() {
  install -Dm755 cloud-nuke-bin "$pkgdir/usr/bin/cloud-nuke"
}
