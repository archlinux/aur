# Maintainer: hashworks <mail@hashworks.net>
pkgname=xrel-terminal-client
pkgver=2.1.0
pkgrel=3
pkgdesc="A terminal client to access the xREL.to API, written in Go."
arch=(i686 x86_64)
url=https://github.com/hashworks/xREL-Terminal-Client
license=(GPL3)
changelog=CHANGELOG
source_x86_64=(https://github.com/hashworks/xREL-Terminal-Client/releases/download/v${pkgver}/xREL-linux-amd64.tar.gz
               LICENSE)
source_i686=(https://github.com/hashworks/xREL-Terminal-Client/releases/download/v${pkgver}/xREL-linux-386.tar.gz
             LICENSE)
md5sums_x86_64=(50f9df00bb76efcdfb6367c78eda4ce8
                84dcc94da3adb52b53ae4fa38fe49e5d)
md5sums_i686=(6cc29a24aaf2448c2ece8ddff5fa2f6a
              84dcc94da3adb52b53ae4fa38fe49e5d)

package() {
  install -D LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
  install -D xREL ${pkgdir}/usr/bin/xREL
}
