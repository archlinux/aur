# Maintainer:  <lohjingyen at gmail dot com>

pkgname=canvas-downloader-bin
pkgver=0.1.7
pkgrel=1
pkgdesc='Downloads files from all courses in canvas.'
depends=('gcc-libs' 'openssl')
arch=('x86_64')
url='https://github.com/k-walter/canvas-downloader'
#license=('')
source=("https://github.com/k-walter/canvas-downloader/releases/download/v$pkgver/canvas-downloader-x86_64-unknown-linux-gnu-v$pkgver")
sha256sums=('2ac006e4f7c2b05d559b7cba970793551a5324676cef94c74eb6828a4a6c6849')

package() {
  install -D -m755 canvas-downloader-x86_64-unknown-linux-gnu-v$pkgver "$pkgdir/usr/bin/canvas-downloader"
}
