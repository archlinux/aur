pkgname=redpanda-connect-bin
_pkgname=redpanda-connect
pkgver=4.81.0
pkgrel=1
pkgdesc='Redpanda Connect is a declarative data streaming service'
arch=('aarch64' 'armv6h' 'armv7h' 'x86_64')
url="https://docs.redpanda.com/redpanda-connect/about/"
license=('Apache-2.0')
provides=($_pkgname)
source=("https://github.com/redpanda-data/connect/releases/download/v$pkgver/redpanda-connect_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("https://github.com/redpanda-data/connect/releases/download/v$pkgver/redpanda-connect_${pkgver}_linux_arm64.tar.gz")
sha256sums=('23f359c315d2e845076c50cf7c5a8d4f249002f198ac72fdca277af1f45b09b0')
sha256sums_aarch64=('260a8a07cdc22dd2aee03d711478dd6ab1e073eb61e93ba4c89b42a72ebc4d73')

package() {
  install -Dm755 $_pkgname "$pkgdir"/usr/bin/$_pkgname
}
