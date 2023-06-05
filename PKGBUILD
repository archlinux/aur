# Maintainer: Emilio Reggi <nag@mailbox.org>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=llama-bin
pkgver=1.4.0
pkgrel=1
pkgdesc="Terminal file manager"
arch=('x86_64' 'arm')
url="https://github.com/antonmedv/llama"
license=('MIT')
provides=('llama')
conflicts=('llama')
source=("LICENSE-$pkgver::$url/raw/v$pkgver/LICENSE")
source_x86_64=("llama-$pkgver-x86_64::$url/releases/download/v$pkgver/llama_linux_amd64")
source_arm=("llama-$pkgver-arm::$url/releases/download/v$pkgver/llama_linux_arm")
sha256sums=('d63a8c4f17dde022f8d1f96a4b2c744821f65bcae926b4de4ee77230a70cdee4')
sha256sums_x86_64=('47685ed4a117c621ba12a84ffc7be94739ae0bc01c2d144c386595e98914bd9f')
sha256sums_arm=('530eab4089fc9cb534cce6ed2d6cce6eb71dbf2fec7148a00ec7488e4a80fd08')

package() {
   install -D "llama-$pkgver-$CARCH" "$pkgdir/usr/bin/llama"
   install -Dm644 "LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
