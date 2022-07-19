# Maintainer: Thiago Almeida <echo "dGhpYWdvYWxtZWlkYXNhQGdtYWlsLmNvbQo=" | base64 -d>

pkgname="cloud-nuke-bin"
pkgver=0.15.0
pkgrel=1
pkgdesc="A tool for cleaning up your cloud accounts by nuking (deleting) all resources within it."
url="https://github.com/gruntwork-io/cloud-nuke"
arch=('x86_64' 'i386' 'aarch64')
license=('MIT')
provides=('cloud-nuke')
source_x86_64=("$pkgname::$url/releases/download/v${pkgver}/${pkgname/-bin/}_linux_amd64")
source_i386=("$pkgname::$url/releases/download/v${pkgver}/${pkgname/-bin/}_linux_386")
sha256sums_x86_64=(02acac0d8ddce1455935789f8620f3df5756c422330f8e941c3bf59b78914dc6)
sha256sums_i386=(16a49edc482419dcf5a6d42dcfd2008689986bf5f61b34707feec725bcf98c1c)
sha256sums_aarch64=(cc05d5e5c947a8f8fb7ea791fb1ddb274b07c9d3a1199cef325d547e38e22a81)

package() {
  install -Dm755 cloud-nuke-bin "$pkgdir/usr/bin/cloud-nuke"
}
