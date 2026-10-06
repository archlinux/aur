# Maintainer: Antoine Bertin <ant.bertin@gmail.com>

pkgname=yayamlls
pkgver=0.3.2 # renovate: datasource=github-releases depName=home-operations/yayamlls
pkgrel=1
pkgdesc="Go YAML language server"
arch=(x86_64)
url=https://github.com/home-operations/yayamlls
license=(MIT)
options=(!strip)
source=("$pkgname-$pkgver-linux-amd64.tar.gz::$url/releases/download/$pkgver/${pkgname}_${pkgver}_linux_amd64.tar.gz")
sha256sums=('f6dfd7aa573e46a37a0595ff9139eab8f76eae9af179617a4fcb5d707ecb4fe3')

package() {
  install -Dm755 yayamlls "$pkgdir/usr/bin/yayamlls"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
