# Maintainer: Sergey Mezentsev <thebits@yandex.ru>
pkgname=xlcat-bin
pkgver=0.1.6
pkgrel=1
pkgdesc="xlcat is like cat except for Excel files"
license=('MIT')
arch=("x86_64")
url="https://github.com/xlprotips/xl"
source=("https://github.com/xlprotips/xl/releases/download/v${pkgver}/xlcat-v${pkgver}-x86_64-unknown-linux-musl.tar.gz")
sha256sums=('56568b413912dab093bba49204667872dbc7858ce18dc8b58800bbddb2558315')

package() {
  cd "${srcdir}/xlcat-v${pkgver}-x86_64-unknown-linux-musl"
  install -D -m 0755 xlcat "$pkgdir/usr/bin/xlcat"
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
