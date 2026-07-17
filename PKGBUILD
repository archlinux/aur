# Maintainer: Parham Alvani <parham.alvani@gmail.com>

pkgname=rpk-bin
pkgver=26.1.13
pkgrel=1
pkgdesc="The rpk command line interface tool is designed to manage your entire Redpanda cluster, without the need to run a separate script for each function, as with Apache Kafka."
arch=(x86_64)
url="https://github.com/redpanda-data/redpanda"
license=('Redpanda Business Source License')

conflicts=('rpk' 'rpk-git')
provides=('rpk')

source=("https://github.com/redpanda-data/redpanda/releases/download/v${pkgver}/rpk-linux-amd64.zip")

sha256sums=('cf3dc7a34cafea15e8eae720c04ce9c5a389765ff51e7a038cdee4136378ccba')

package() {
  install -D -m755 $srcdir/rpk $pkgdir/usr/bin/rpk
}
