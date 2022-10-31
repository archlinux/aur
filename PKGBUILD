# Maintainer: Thiago Almeida <echo "dGhpYWdvYWxtZWlkYXNhQGdtYWlsLmNvbQo=" | base64 -d>

pkgname="cloud-nuke-bin"
pkgver=0.21.0
pkgrel=1
pkgdesc="A tool for cleaning up your cloud accounts by nuking (deleting) all resources within it."
url="https://github.com/gruntwork-io/cloud-nuke"
arch=('x86_64' 'i386' 'aarch64')
license=('MIT')
provides=('cloud-nuke')
source_x86_64=("$pkgname::$url/releases/download/v${pkgver}/${pkgname/-bin/}_linux_amd64")
source_i386=("$pkgname::$url/releases/download/v${pkgver}/${pkgname/-bin/}_linux_386")
sha256sums_x86_64=(ec89d7c8a85d852a2edd06b6a51e51fa1d5fce35be54314b6cbcf247eeb90340)
sha256sums_i386=(9ddb8d7cdd4b639a27e7ba6af6741b9d9c8da2dd250ee61c516045472f7b70e0)
sha256sums_aarch64=(e1d8752b6e42c36a00f20ecdf7ff7bd77c35c135aa7d47a9b572b64d01fcc0c1)

package() {
  install -Dm755 cloud-nuke-bin "$pkgdir/usr/bin/cloud-nuke"
}
