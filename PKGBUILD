# Maintainer: Antoine Bertin <ant.bertin@gmail.com>

pkgname=yayamlls
pkgver=0.1.12 # renovate: datasource=github-releases depName=home-operations/yayamlls
pkgrel=1
pkgdesc="Go YAML language server"
arch=(x86_64)
url=https://github.com/home-operations/yayamlls
license=(MIT)
options=(!strip)
source=("$pkgname-$pkgver-linux-amd64.tar.gz::$url/releases/download/$pkgver/${pkgname}_${pkgver}_linux_amd64.tar.gz")
sha256sums=('17a90c4d4af15306a4ed40f8afc72b6f0faa949b068da8e2572bf2a4563c49a9')

package() {
  install -Dm755 yayamlls "$pkgdir/usr/bin/yayamlls"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
