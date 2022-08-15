# Maintainer:  <lohjingyen at gmail dot com>

pkgname=canvas-downloader-bin
pkgver=0.1.5
pkgrel=1
pkgdesc='Downloads files from all courses in canvas.'
depends=('gcc-libs' 'openssl')
arch=('x86_64')
url='https://github.com/stein212/canvas-downloader'
#license=('MIT')
source=("https://github.com/stein212/canvas-downloader/releases/download/v$pkgver/canvas-downloader-x86_64-unknown-linux-gnu-v$pkgver")
#source=("https://github.com/fluminurs/fluminurs/releases/download/$pkgver/fluminurs-cli.ubuntu" 'https://raw.githubusercontent.com/fluminurs/fluminurs/master/LICENSE')
sha256sums=('3ba3bd66df8dc666d93df29a0c34b5df0ae850b94d1a88331a79f39c1493aace')

package() {
  install -D -m755 canvas-downloader-x86_64-unknown-linux-gnu-v$pkgver "$pkgdir/usr/bin/canvas-downloader"
  #install -D -m644 LICENSE "$pkgdir/usr/share/licenses/fluminurs/LICENSE"
}
