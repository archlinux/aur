# Maintainer: hashworks <mail@hashworks.net>
pkgname=srrdb-terminal-client
pkgver=1.1.4
pkgrel=1
pkgdesc="A terminal client to access srrdb.com, written in Go."
arch=(i686 x86_64)
url=https://github.com/hashworks/srrdb-Terminal-Client
license=(GPL3)
changelog=CHANGELOG
source=(LICENSE)
md5sums=(84dcc94da3adb52b53ae4fa38fe49e5d)
source_x86_64=(https://github.com/hashworks/srrdb-Terminal-Client/releases/download/v${pkgver}/srrdb-linux-amd64.tar.gz)
md5sums_x86_64=(db1ab55948a69264895791bfccf4d6a7)
source_i686=(https://github.com/hashworks/srrdb-Terminal-Client/releases/download/v${pkgver}/srrdb-linux-386.tar.gz)
md5sums_i686=(26c057ec7e4a0279f9471f4e3bccf8f4)

package() {
  install -D LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
  install -D srrdb ${pkgdir}/usr/bin/srrdb
}
