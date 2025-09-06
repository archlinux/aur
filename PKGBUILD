# Maintainer: Parham Alvani <parham.alvani@gmail.com>

pkgname=rpk-bin
pkgver=25.2.3
pkgrel=1
pkgdesc="The rpk command line interface tool is designed to manage your entire Redpanda cluster, without the need to run a separate script for each function, as with Apache Kafka."
arch=(x86_64)
url="https://github.com/redpanda-data/redpanda"
license=('Redpanda Business Source License')

conflicts=('rpk' 'rpk-git')
provides=('rpk')

source=("https://github.com/redpanda-data/redpanda/releases/download/v${pkgver}/rpk-linux-amd64.zip")

sha256sums=('1968722b17206a6e7710d57276481b65a44273cc0ca8d3a2b77e42a8b79b1589')

package() {
  install -D -m755 $srcdir/rpk $pkgdir/usr/bin/rpk
}
