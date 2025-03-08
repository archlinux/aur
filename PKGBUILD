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

source=("https://github.com/redpanda-data/redpanda/releases/download/v${pkgver}/rpk-linux-arm64.zip")

sha256sums=('798d8d8ac4cc3a88cc5d67ad8e7f450158d9750a8ad6979cf5ac73e29ed7498f')

package() {
	install -D -m755 $srcdir/rpk-linux-amd64/rpk $pkgdir/usr/bin/rpk
}
