# Maintainer: Parham Alvani <parham.alvani@gmail.com>

pkgname=rpk-bin
pkgver=26.2.2
pkgrel=1
pkgdesc="The rpk command line interface tool is designed to manage your entire Redpanda cluster, without the need to run a separate script for each function, as with Apache Kafka."
arch=(x86_64)
url="https://github.com/redpanda-data/redpanda"
license=('Redpanda Business Source License')

conflicts=('rpk' 'rpk-git')
provides=('rpk')

source=("https://github.com/redpanda-data/redpanda/releases/download/v${pkgver}/rpk-linux-amd64.zip")

sha256sums=('e4d5fa4b4a3ce8f773226ab8e87de1f71394a702aa955e2b2093012fe13f761e')

package() {
  install -D -m755 $srcdir/rpk $pkgdir/usr/bin/rpk
}
