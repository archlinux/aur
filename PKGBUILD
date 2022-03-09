# Maintainer: Sam A. Horvath-Hunt <hello@samhh.com>

pkgname=traitor-bin
_pkgname=traitor
pkgver=0.0.14
pkgrel=1
pkgdesc='Automatic Linux privesc via exploitation of low-hanging fruit.'
arch=('x86_64')
license=('MIT')
url="https://github.com/liamg/$_pkgname"
source=(
  "${url}/releases/download/v${pkgver}/traitor-amd64"
  "${url}/archive/v${pkgver}.tar.gz"
)
sha256sums=('fdfbfc07248c3359d9f1f536a406d4268f01ed63a856bd6cef9dccb3cf4f2376'
            '544d935bd8d7f8d8ac7bfcb75a4d67f6d8a264639e659fc95de00637315f6af2')

package() {
  install -Dm755 "$srcdir/traitor-amd64" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 "$srcdir/${_pkgname}-${pkgver}/LICENSE" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
