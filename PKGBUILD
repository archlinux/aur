# Maintainer: Parham Alvani <parham.alvani@gmail.com>

pkgname=rpk-bin
pkgver=26.1.12
pkgrel=1
pkgdesc="The rpk command line interface tool is designed to manage your entire Redpanda cluster, without the need to run a separate script for each function, as with Apache Kafka."
arch=(x86_64)
url="https://github.com/redpanda-data/redpanda"
license=('Redpanda Business Source License')

conflicts=('rpk' 'rpk-git')
provides=('rpk')

source=("https://github.com/redpanda-data/redpanda/releases/download/v${pkgver}/rpk-linux-amd64.zip")

sha256sums=('dca55216f0e9d992af4dae7440a04957b072364e3e20e4946c7d3685d576ba27')

package() {
  install -D -m755 $srcdir/rpk $pkgdir/usr/bin/rpk
}
