# Maintainer: Antoine Bertin <ant.bertin@gmail.com>

pkgname=yayamlls
pkgver=0.1.14 # renovate: datasource=github-releases depName=home-operations/yayamlls
pkgrel=1
pkgdesc="Go YAML language server"
arch=(x86_64)
url=https://github.com/home-operations/yayamlls
license=(MIT)
options=(!strip)
source=("$pkgname-$pkgver-linux-amd64.tar.gz::$url/releases/download/$pkgver/${pkgname}_${pkgver}_linux_amd64.tar.gz")
sha256sums=('8e742e78c973fa05702e303a26d46ddac5bdbf8a040ce59ef24f22665aa5b3e5')

package() {
  install -Dm755 yayamlls "$pkgdir/usr/bin/yayamlls"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
