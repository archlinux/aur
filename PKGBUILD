pkgname=redpanda-connect-bin
_pkgname=redpanda-connect
pkgver=4.45.0
pkgrel=1
pkgdesc='Redpanda Connect is a declarative data streaming service'
arch=('aarch64' 'armv6h' 'armv7h' 'x86_64')
url="https://docs.redpanda.com/redpanda-connect/about/"
license=('Apache-2.0')
provides=($_pkgname)
source=("https://github.com/redpanda-data/connect/releases/download/v$pkgver/redpanda-connect_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("https://github.com/redpanda-data/connect/releases/download/v$pkgver/redpanda-connect_${pkgver}_linux_arm64.tar.gz")
sha256sums=('02f6e5662d68d871ba0c1ec84ca484304d04a69228950471876636d0127e676d')
sha256sums_aarch64=('484f03a13b4ca75dc32bb12d00a44f4018f740fba02ed928a1388175ce41c469')

package() {
  install -Dm755 $_pkgname "$pkgdir"/usr/bin/$_pkgname
}
