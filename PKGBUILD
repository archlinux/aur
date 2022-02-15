# Maintainer: Funami
pkgname=fend-bin
pkgver=0.1.28
pkgrel=1
pkgdesc="Arbitrary-precision unit-aware calculator"
arch=('x86_64')
url="https://github.com/printfn/fend"
license=('MIT')
provides=('fend')
conflicts=('fend')
source=("https://github.com/printfn/fend/releases/download/v$pkgver/fend-$pkgver-linux-x64.zip"
        "https://raw.githubusercontent.com/printfn/fend/v$pkgver/LICENSE.md")
sha256sums=('c48fea5963f525b43789c12cd7cd61bd389488f976f5b8c8e94838f35b2c651c'
            '9976b2d5c68966c9e5cec76ab25beb1a67eb271f8f58ef0534f441d6bd74470c')

package() {
  install -Dm755 fend -t "$pkgdir/usr/bin"
  install -Dm644 "LICENSE.md" "$pkgdir/usr/share/licenses/fend/LICENSE"
}
