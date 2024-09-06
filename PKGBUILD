pkgname=redpanda-connect-bin
_pkgname=redpanda-connect
pkgver=4.35.0
pkgrel=1
pkgdesc='Redpanda Connect is a declarative data streaming service'
arch=('aarch64' 'armv6h' 'armv7h' 'x86_64')
url="https://docs.redpanda.com/redpanda-connect/about/"
license=('Apache-2.0')
provides=($_pkgname)
source=("https://github.com/redpanda-data/connect/releases/download/v$pkgver/redpanda-connect_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("https://github.com/redpanda-data/connect/releases/download/v$pkgver/redpanda-connect_${pkgver}_linux_arm64.tar.gz")
sha256sums=('7308189bd0b1b3a8834ac080d021e6d652edd50a13b65702faaaad373d5765c9')
sha256sums_aarch64=('fc700f54f2823233f19d83ec05be1ce89b9ba9164f27d2aecc4a4be58075775d')

package() {
  install -Dm755 $_pkgname "$pkgdir"/usr/bin/$_pkgname
}
