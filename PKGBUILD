# Maintainer: Emilio Reggi <nag@mailbox.org>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=llama-bin
pkgver=1.0.1
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
sha256sums_x86_64=('6ca0a14a026c08abeb30c354a64f6c108a45046ae2141f77ea3a80cce9e3bfb5')
sha256sums_i686=('59bb8c9ffe01fc01d21eb4b6ad90a91f64ba6662a92b3abd30741af8a42aa325')
sha256sums_arm=('b64ec5cb64e87e9a719e09159c5e7bb9f432e33778eca086c5e1875dffe55764')

package() {
   install -D "llama-$pkgver-$CARCH" "$pkgdir/usr/bin/llama"
   install -Dm644 "LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
