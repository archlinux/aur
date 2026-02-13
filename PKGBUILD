# Maintainer: Mark <speedorama1 at gmail dot com>

pkgname=koboldcpp-bin
<<<<<<< HEAD
pkgver=1.107.1
=======
pkgver=1.107.3
>>>>>>> f2d1a8c (bump to version 1.107.3)
pkgrel=1
pkgdesc="A simple one-file way to run various GGML and GGUF models with KoboldAI's UI"
arch=('x86_64')
url="https://github.com/LostRuins/koboldcpp"
license=('AGPL3')
depends=('glibc')
conflicts=('koboldcpp')
provides=("koboldcpp=$pkgver")
source=(
	"$pkgname-$pkgver::https://github.com/LostRuins/koboldcpp/releases/download/v$pkgver/koboldcpp-linux-x64-nocuda"
	"koboldcpp.desktop"
	"koboldcpp.png"
)
sha256sums=(
<<<<<<< HEAD
  '1a8d41320ff38d2926dad01fc9c9759a7d18c59336cf522e7c690b7364e1cf52'
=======
  '12e2cfcc6e55bcf7f428911a6e5564c4e7191889df185acddaf0e7aef5c8b267'
>>>>>>> f2d1a8c (bump to version 1.107.3)
  'fcec7b843b908e1c03496fdc0605e6509f52526a855c43db16e287ef646503ef'
  'd244788c74a693a383bea7db6ab2bb2f762e6020de900be977b16e18dcd20f54'
)

package() {
  install -D -m 0755 "$pkgname-$pkgver" "$pkgdir/usr/bin/koboldcpp"
  install -D -m 0644 "$srcdir/koboldcpp.desktop" "$pkgdir/usr/share/applications/koboldcpp.desktop"
  install -D -m 0644 "$srcdir/koboldcpp.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/koboldcpp.png"
}
