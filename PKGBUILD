# Maintainer:  <lohjingyen at gmail dot com>

pkgname=canvas-downloader-bin
pkgver=0.1.6
pkgrel=1
pkgdesc='Downloads files from all courses in canvas.'
depends=('gcc-libs' 'openssl')
arch=('x86_64')
url='https://github.com/stein212/canvas-downloader'
#license=('')
source=("https://github.com/stein212/canvas-downloader/releases/download/v$pkgver/canvas-downloader-x86_64-unknown-linux-gnu-v$pkgver")
sha256sums=('d97c2e5c8c4ddfc02c8177c42c30ae8f3afed338e0cbc57449feeaf960886157')

package() {
  install -D -m755 canvas-downloader-x86_64-unknown-linux-gnu-v$pkgver "$pkgdir/usr/bin/canvas-downloader"
}
