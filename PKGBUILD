# Maintainer: Emilio Reggi <nag@mailbox.org>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=llama-bin
pkgver=1.0.2
pkgrel=1
pkgdesc="Terminal file manager"
arch=('x86_64' 'i686' 'arm')
url="https://github.com/antonmedv/llama"
license=('MIT')
provides=('llama')
conflicts=('llama')
source=("LICENSE-$pkgver::$url/raw/v$pkgver/LICENSE")
source_x86_64=("llama-$pkgver-x86_64::$url/releases/download/v$pkgver/llama_linux_amd64")
source_i686=("llama-$pkgver-i686::$url/releases/download/v$pkgver/llama_linux_386")
source_arm=("llama-$pkgver-arm::$url/releases/download/v$pkgver/llama_linux_arm")
sha256sums=('d63a8c4f17dde022f8d1f96a4b2c744821f65bcae926b4de4ee77230a70cdee4')
sha256sums_x86_64=('e4939e659bb18d4b17f209164dde1cf5fe9d9919e83d9441d8abcb6912a6be2e')
sha256sums_i686=('b92a52fc9f36e4c64c09842a773a9cb9c8d79b5c791c18933884c7863b449070')
sha256sums_arm=('5e1781c3bd040811f2c489cee91d878780a032b8dcd03f904ae36805dfc4fcf7')

package() {
   install -D "llama-$pkgver-$CARCH" "$pkgdir/usr/bin/llama"
   install -Dm644 "LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
