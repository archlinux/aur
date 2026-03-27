# Maintainer: Sergey Mezentsev <thebits@yandex.ru>
pkgname=xlcat-bin
pkgver=0.1.85
pkgrel=1
pkgdesc="xlcat is like cat except for Excel files"
license=('MIT')
arch=("x86_64")
url="https://github.com/xlprotips/xl"
source=("https://github.com/xlprotips/xl/releases/download/v${pkgver}/xlcat-v${pkgver}-linux64.tar.gz")
sha256sums=('463a44f5faab11c9b6524636a4b83ebf17bf89d0d0d582f6e5595444f481db07')

package() {
  cd "${srcdir}/"
  install -D -m 0755 xlcat "$pkgdir/usr/bin/xlcat"
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
