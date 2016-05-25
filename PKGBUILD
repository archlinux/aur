# Maintainer: hashworks <mail@hashworks.net>
pkgname=srrdb-terminal-client
pkgver=1.1.2
pkgrel=1
pkgdesc="A terminal client to access srrdb.com, written in Go."
arch=(i686 x86_64)
url=https://github.com/hashworks/srrdb-Terminal-Client
license=(GPL3)
changelog=CHANGELOG
source=(LICENSE)
md5sums=(84dcc94da3adb52b53ae4fa38fe49e5d)
source_x86_64=(https://github.com/hashworks/srrdb-Terminal-Client/releases/download/v${pkgver}/srrdb-linux-amd64.tar.gz)
md5sums_x86_64=(8531d47e32ff2c642e414bb608d6e964)
source_i686=(https://github.com/hashworks/srrdb-Terminal-Client/releases/download/v${pkgver}/srrdb-linux-386.tar.gz)
md5sums_i686=(e88efe825c7b0483025972c5902fd524)

package() {
  install -D LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
  install -D srrdb ${pkgdir}/usr/bin/srrdb
}
