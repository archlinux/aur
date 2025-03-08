# Maintainer: Parham Alvani <parham.alvani@gmail.com>

pkgname=rpk-bin
pkgver=24.2.20
pkgrel=1
pkgdesc="The rpk command line interface tool is designed to manage your entire Redpanda cluster, without the need to run a separate script for each function, as with Apache Kafka."
arch=(x86_64)
url="https://github.com/redpanda-data/redpanda"
license=('Redpanda Business Source License')

conflicts=('rpk' 'rpk-git')
provides=('rpk')

source=("https://github.com/redpanda-data/redpanda/releases/download/v${pkgver}/rpk-linux-amd64.zip")

sha256sums=('68c9ee09e97e7cbd9aa5a2f24e109134003b4e37ad42b72f8185c7a618cfd8e1')

package() {
	install -D -m755 $srcdir/rpk $pkgdir/usr/bin/rpk
}
