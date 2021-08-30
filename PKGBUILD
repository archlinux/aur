# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=mcfly-bin
pkgver=0.5.9
pkgrel=1
pkgdesc="Fly through your shell history"
arch=('i686' 'x86_64' 'arm' 'armv7h')
url="https://github.com/cantino/mcfly"
license=('MIT')
provides=('mcfly')
conflicts=('mcfly')
source=("https://raw.githubusercontent.com/cantino/mcfly/master/LICENSE")
source_i686=("https://github.com/cantino/mcfly/releases/download/v$pkgver/mcfly-v$pkgver-i686-unknown-linux-musl.tar.gz")
source_x86_64=("https://github.com/cantino/mcfly/releases/download/v$pkgver/mcfly-v$pkgver-x86_64-unknown-linux-musl.tar.gz")
source_arm=("https://github.com/cantino/mcfly/releases/download/v$pkgver/mcfly-v$pkgver-arm-unknown-linux-gnueabi.tar.gz")
source_armv7h=("https://github.com/cantino/mcfly/releases/download/v$pkgver/mcfly-v$pkgver-armv7-unknown-linux-gnueabihf.tar.gz")
sha256sums=('SKIP')
sha256sums_i686=('aa550d37ae3e5245d4d354a2fb8cb027319dcea9b36f1fe8552dff1d8bf455bd')
sha256sums_x86_64=('6b89e320e0dd31be81fd8bde44a55c8236e6471d444705cec9327ef6be36ce0a')
sha256sums_arm=('ee4f17e6ac956a7dde88411f67b7ebeed6819b47ee9e0c90a97541b54d9d461d')
sha256sums_armv7h=('013e8bf398f3db3c24e6e7306ca8ed73e5b3b1747e849f2518ef9d8b6679552c')


package() {
  install -Dm755 "$srcdir/mcfly" -t "$pkgdir/usr/bin"
  install -Dm644 "$srcdir/LICENSE" -t "$pkgdir/usr/share/licenses/mcfly"
}
