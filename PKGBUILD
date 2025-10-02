pkgname=redpanda-connect-bin
_pkgname=redpanda-connect
pkgver=4.65.0
pkgrel=1
pkgdesc='Redpanda Connect is a declarative data streaming service'
arch=('aarch64' 'armv6h' 'armv7h' 'x86_64')
url="https://docs.redpanda.com/redpanda-connect/about/"
license=('Apache-2.0')
provides=($_pkgname)
source=("https://github.com/redpanda-data/connect/releases/download/v$pkgver/redpanda-connect_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("https://github.com/redpanda-data/connect/releases/download/v$pkgver/redpanda-connect_${pkgver}_linux_arm64.tar.gz")
sha256sums=('d41caa85419e140cafaee97becebe400467744222d0b8051eb58c0626985234e')
sha256sums_aarch64=('beb565bb6e4886c69e5565c4ff9656177fd123f4ce4c3a090e5d583f73b37246')

package() {
  install -Dm755 $_pkgname "$pkgdir"/usr/bin/$_pkgname
}
