# Maintainer: hashworks <mail@hashworks.net>
pkgname=xrel-terminal-client
pkgver=2.1.1
pkgrel=1
pkgdesc="A terminal client to access the xREL.to API, written in Go."
arch=(i686 x86_64)
url=https://github.com/hashworks/xREL-Terminal-Client
license=(GPL3)
changelog=CHANGELOG
source=(LICENSE)
md5sums=(84dcc94da3adb52b53ae4fa38fe49e5d)
source_x86_64=(https://github.com/hashworks/xREL-Terminal-Client/releases/download/v${pkgver}/xREL-linux-amd64.tar.gz)
md5sums_x86_64=(41f0c55b1065f674679b9bd8205abb6c)
source_i686=(https://github.com/hashworks/xREL-Terminal-Client/releases/download/v${pkgver}/xREL-linux-386.tar.gz)
md5sums_i686=(c089ba0c405b68434029d33e77d3af62)

package() {
  install -D LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
  install -D xREL ${pkgdir}/usr/bin/xREL
}
