pkgname=redpanda-connect-bin
_pkgname=redpanda-connect
pkgver=4.30.1
pkgrel=1
pkgdesc='Redpanda Connect is a declarative data streaming service'
arch=('aarch64' 'armv6h' 'armv7h' 'x86_64')
url="https://docs.redpanda.com/redpanda-connect/about/"
license=('Apache-2.0')
provides=($_pkgname)
source=("https://github.com/redpanda-data/connect/releases/download/v$pkgver/redpanda-connect_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("https://github.com/redpanda-data/connect/releases/download/v$pkgver/redpanda-connect_${pkgver}_linux_arm64.tar.gz")
source_armv6h=("https://github.com/redpanda-data/connect/releases/download/v$pkgver/redpanda-connect_${pkgver}_linux_armv6.tar.gz")
source_armv7h=("https://github.com/redpanda-data/connect/releases/download/v$pkgver/redpanda-connect_${pkgver}_linux_armv7.tar.gz")
sha256sums=('a9cd79f26263d36c15c8d96bb05a229c400f55dc113e890e3a4fbf46e0ad3673')
sha256sums_aarch64=('af71e1185ff4af9f178eb77f6d5be7488fe01dd904ef87009d4d9c82e9642bf2')
sha256sums_armv6h=('22f2bdaa4c1f6a9abe6bceba8a3220b488bd4ce8aeeb7a07ac6737bfe9f7468a')
sha256sums_armv7h=('bc34a727f154fcf58853fcdf535db76577909aae59fa59c6f4e87881010b14e5')

package() {
  install -Dm755 $_pkgname "$pkgdir"/usr/bin/$_pkgname
}
