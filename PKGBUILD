# Maintainer: hashworks <mail@hashworks.net>
pkgname=srrdb-terminal-client
pkgver=1.1.4
pkgrel=1
pkgdesc="A terminal client to access srrdb.com, written in Go."
arch=(x86_64)
url=https://github.com/hashworks/srrdb-Terminal-Client
license=(GPL3)
changelog=CHANGELOG
source=("https://github.com/hashworks/srrdb-Terminal-Client/releases/download/v${pkgver}/srrdb-linux-amd64.tar.gz")
md5sums=(db1ab55948a69264895791bfccf4d6a7)

package() {
  install -D srrdb "${pkgdir}/usr/bin/srrdb"
}
